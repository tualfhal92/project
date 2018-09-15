package com.misoot.lar.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Clob;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.misoot.lar.common.interfaces.LarMailSender;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.util.Utils;
import com.misoot.lar.user.model.service.UserServiceImpl;
import com.misoot.lar.user.model.vo.Purchase;
import com.misoot.lar.user.model.vo.User;

@Controller
@SessionAttributes(value = { "session_user" })
public class UserController {
	@Autowired
	private LarService<User> userServiceImpl;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private LarMailSender larMailSenderImpl;

	@ResponseBody
	@RequestMapping(value = "/user/idDuplicateCheck", method = RequestMethod.POST)
	public boolean idDuplicateCheck(@RequestParam("value") String user_id) {
		System.out.println(user_id);
		return ((UserServiceImpl) userServiceImpl).idDuplicateCheck(user_id);
	}

	@ResponseBody
	@RequestMapping(value = "/user/nicknameDuplicateCheck", method = RequestMethod.POST)
	public boolean nicknameDuplicateCheck(@RequestParam("value") String user_nickname) {
		System.out.println("dup Nick : " + user_nickname);
		return ((UserServiceImpl) userServiceImpl).nicknameDuplicateCheck(user_nickname);
	}

	@ResponseBody
	@RequestMapping(value = "/user/phoneDuplicateCheck", method = RequestMethod.POST)
	public boolean phoneDuplicateCheck(@RequestParam("value") String user_phone) {
		System.out.println(user_phone);
		return ((UserServiceImpl) userServiceImpl).phoneDuplicateCheck(user_phone);
	}

	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public String signup(User user, Model model) {
				
		user.setUser_password(bcryptPasswordEncoder.encode(user.getUser_password()));
		
		int result = ((UserServiceImpl) userServiceImpl).insert(user);
		String message = "";
		String location = "common/_message";
		String href = "";
		
		if (result > 0) {
			message = "회원가입에 성공 했습니다!";
		} else {
			message = "회원가입에 실패 했습니다!";
		}
		
		model.addAttribute("message", message).addAttribute("href", href);
		
		return location;
	}

	@RequestMapping(value = "/user/signin", method = RequestMethod.POST)
	public String signin(User temp, Model model, HttpSession session, HttpServletRequest req) {

		session.invalidate();
		session = req.getSession(true);

		System.out.println("temp : " + temp);

		User user = ((UserServiceImpl) userServiceImpl).selectOne(temp.getUser_id());

		System.out.println("user : " + user);

		String message = "";
		String location = "common/_message";
		String href = "";

		if (user == null) {
			message = "존재하지 않는 사용자입니다.";
			model.addAttribute("message", message);
		} else {
			if (user.isUser_is_secession()) {
				message = "이미 탈퇴한 회원입니다! 관리자에게 문의해주세요.";
				model.addAttribute("message", message).addAttribute("href", href);
			} else if (user.isUser_is_kicked()) {
				message = "약관을 위반해 추방당한 회원입니다! 관리자에게 문의해주세요.";
				model.addAttribute("message", message).addAttribute("href", href);
			} else if (user.getUser_try_signin_count() > 4) {
				message = "로그인 시도 " + user.getUser_try_signin_count() + "회 초과! 계정을 잠금해제 해주세요.";
				model.addAttribute("message", message).addAttribute("href", href);
			} else {
				if (bcryptPasswordEncoder.matches(temp.getUser_password(), user.getUser_password())) {
					// 접속 카운트 reset
					int result = ((UserServiceImpl) userServiceImpl).trySigninCountReset(user);
					model.addAttribute("session_user", user);
					location = "redirect:/";
				} else {
					// 접속 카운트 add
					int result = ((UserServiceImpl) userServiceImpl).trySigninCountIncrease(user);
					message = "로그인 시도 " + user.getUser_try_signin_count() + "회 : 비밀번호를 확인해주세요!";
					model.addAttribute("message", message).addAttribute("href", href);
				}
			}
		}

		return location;
	}

	@RequestMapping(value = "/user/signout")
	public String signout(SessionStatus status) {
		if (!status.isComplete())
			status.setComplete();
		return "redirect:/";
	}

	@RequestMapping(value = "/user/unlock")
	public String unlockPage() {
		return "user/form/unlocksendmailForm";
	}

	@RequestMapping(value = "/user/forgotPassword/sendmail", method = RequestMethod.POST)
	public String findPassword(@RequestParam(value = "user_id", required = true) String user_id, HttpSession session,
			Model model) {

		User temp = ((UserServiceImpl) userServiceImpl).selectOne(user_id);

		if (temp == null) {
			String message = "존재하지 않는 아이디 입니다!";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}

		// to, subject, content
		String randnumStr = Integer.toString(new Random().nextInt(Integer.MAX_VALUE) + 1);
		String encodeAuth = bcryptPasswordEncoder.encode(randnumStr + user_id);

		String subject = "[LAR] 비밀번호 분실 인증키 메일입니다.";
		String content = "비밀번호 분실 인증 키 : " + encodeAuth;

		boolean result = larMailSenderImpl.emailSender("LAR Find for password", user_id, subject, content);

		if (result) {
			session.setAttribute("user_id_s", user_id);
			session.setAttribute("passwordAuth", encodeAuth);
			return "user/form/_passwordAuthCompareForm";
		} else {
			String message = "이메일 전송 실패!";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}
	}

	@RequestMapping(value = "/user/forgotPassword/compare", method = RequestMethod.POST)
	public String passwordAuthCompare(@RequestParam(value = "user_id", required = true) String id_for_forgot_input,
			@RequestParam(value = "passwordAuth_input", required = true) String passwordAuth_input,
			@SessionAttribute("passwordAuth") String passwordAuth, @SessionAttribute("user_id_s") String user_id_s,
			SessionStatus sessionStatus, Model model) {
		if (passwordAuth_input.equals(passwordAuth) && id_for_forgot_input.equals(user_id_s)) {
			return "user/form/_newPasswordForm";
		} else {
			if (!sessionStatus.isComplete())
				sessionStatus.setComplete();
			String message = "올바르지 않은 인증키입니다. 처음부터 다시 시도해주세요.";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}
	}

	@RequestMapping(value = "/user/findId")
	public String findId(@RequestParam(value = "user_phone", required = true) String user_phone, HttpSession session) {
		return "";
	}

	// email send example
	@RequestMapping(value = "/user/mailtest")
	public String mailtest(Model model) {
		// to, subject, content
		boolean result = larMailSenderImpl.emailSender("Test For lar", "psh6185@naver.com", "진짜 테스트임", "아무의미없쬬?");

		if (result) {
			return "redirect:/";
		} else {
			String message = "이메일 전송 실패!";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}
	}

	@RequestMapping(value = "/user/unlock/sendmail", method = RequestMethod.POST)
	public String unlockSendmail(@RequestParam(value = "user_id", required = true) String user_id, HttpSession session,
			Model model) {

		User temp = ((UserServiceImpl) userServiceImpl).selectOne(user_id);

		if (temp == null) {
			String message = "존재하지 않는 아이디 입니다!";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		} else if (temp.getUser_try_signin_count() < 5) {
			String message = "계정이 잠겨있지 않습니다.";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}

		// to, subject, content
		String randnumStr = Integer.toString(new Random().nextInt(Integer.MAX_VALUE) + 1);
		String encodeAuth = bcryptPasswordEncoder.encode(randnumStr + user_id);

		String subject = "[LAR] 계정 잠금 해제 인증키 메일입니다.";
		String content = "계정 잠금 해제 인증 키 : " + encodeAuth;

		boolean result = larMailSenderImpl.emailSender("LAR Unlock for account", user_id, subject, content);

		if (result) {
			session.setAttribute("user_id_s", user_id);
			session.setAttribute("unlockAuth", encodeAuth);
			return "user/form/_unlockcompareForm";
		} else {
			String message = "이메일 전송 실패!";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}
	}

	@RequestMapping(value = "/user/unlock/compare", method = RequestMethod.POST)
	public String unlockCompare(@RequestParam(value = "user_id", required = true) String user_id,
			@RequestParam(value = "unlockAuth_input", required = true) String unlockAuth_input,
			@SessionAttribute("unlockAuth") String unlockAuth, @SessionAttribute("user_id_s") String user_id_s,
			SessionStatus sessionStatus, Model model) {

		if (unlockAuth_input.equals(unlockAuth) && user_id.equals(user_id_s)) {
			return "user/form/_newPasswordForm";
		} else {
			if (!sessionStatus.isComplete())
				sessionStatus.setComplete();
			String message = "올바르지 않은 인증키입니다. 처음부터 다시 시도해주세요.";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}
	}

	@RequestMapping(value = "/user/passwordModify", method = RequestMethod.POST)
	public String passwordModify(@RequestParam(value = "user_id", required = true) String user_id,
			@RequestParam(value = "newPassword", required = true) String newPassword, Model model,
			SessionStatus sessionStatus) {
		User temp = new User(user_id, bcryptPasswordEncoder.encode(newPassword));
		int result = ((UserServiceImpl) userServiceImpl).passwordModify(temp);

		System.out.println(temp);
		System.out.println(result);

		String message = "";
		String location = "common/_message";
		String href = "";

		if (result > 0) {
			message = "비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인 해주세요.";
			int result2 = ((UserServiceImpl) userServiceImpl).trySigninCountResetForUnlock(user_id);
		} else {
			message = "비밀번호 변경에 실패하였습니다.";
		}

		if (!sessionStatus.isComplete())
			sessionStatus.setComplete();

		model.addAttribute("message", message).addAttribute("href", href);

		return location;
	}

	// REST URL PATTERN
	// ex) /user/view/faker => view faker's page
	// If it is equal to session.getAttribute("user")
	// This page is probably means my page.
	@RequestMapping(value = "/user/view/{user_nickname}")
	public String user(@PathVariable("user_nickname") String user_nickname, Model model) {

		// model.addAttribute("","");

		return "user/userDetail";
	}

	@RequestMapping(value = "/user/cart")
	public String cart(@ModelAttribute("session_user") User user, Model model) {
		List<Map<String, Object>> clist = ((UserServiceImpl) userServiceImpl).cartList(user.getUser_index());

		Utils util = new Utils();

		for (Map<String, Object> list : clist) {
			for (String key : list.keySet()) {
				if (key.equals("LECTURE_INTRO")) {
					list.put(key, util.convertClobToString((Clob) list.get(key)));
				}
			}
		}

		model.addAttribute("lecList", clist);

		return "user/cart";
	}

	@RequestMapping(value = "/user/deleteCart")
	public String userDeleteCart(@RequestParam("radio") String[] check, @ModelAttribute("session_user") User user,
			Model model) {
		Map<String, Object> delcartList = new HashMap<String, Object>();

		delcartList.put("userIdx", user.getUser_index());
		delcartList.put("cartList", check);

		int deleteCart = ((UserServiceImpl) userServiceImpl).deleteCart(delcartList);

		return "redirect:/user/cart";
	}

	@RequestMapping(value = "/user/purchase")
	public String purchaseList(@RequestParam("radio") String[] check, Model model, HttpServletRequest request) {
		List<Map<String, Object>> plist = ((UserServiceImpl) userServiceImpl).purchaseList(check);
		int price = 0;

		Utils util = new Utils();

		for (Map<String, Object> list : plist) {
			for (String key : list.keySet()) {
				if (key.equals("LECTURE_INTRO")) {
					list.put(key, util.convertClobToString((Clob) list.get(key)));
				} else if (key.equals("LECTURE_PRICE")) {
					price += Integer.parseInt(String.valueOf(list.get(key)));
				}
			}
		}

		request.getSession().setAttribute("session_price", price);
		request.getSession().setAttribute("session_before_price", price);

		model.addAttribute("pchList", plist);
		return "user/purchase";
	}

	@RequestMapping(value = "/purchase/coupon")
	public String couponList(@ModelAttribute("session_user") User user, Model model) {
		List<Map<String, String>> coupon = ((UserServiceImpl) userServiceImpl).myCoupontList(user.getUser_index());

		model.addAttribute("coupon", coupon);
		return "user/_coupon";
	}

	@ResponseBody
	@RequestMapping(value = "/purchase/returnprice")
	public Object returnprice(HttpServletRequest request) {
		return request.getSession().getAttribute("session_before_price");
	}

	@ResponseBody
	@RequestMapping(value = "/purchase/priceInfSecurity", method = { RequestMethod.GET, RequestMethod.POST })
	public void priceInfSecurity(@RequestParam(value = "couponinf", required = false) String couponinf,
			HttpServletRequest request) {

		int price = (int) request.getSession().getAttribute("session_price");

		int subcouponinf = Integer.parseInt(couponinf.substring(0, couponinf.length() - 1));

		if (couponinf.charAt(couponinf.length() - 1) == '%') {
			price = (int) (price - (price * ((double) subcouponinf / 100.0)));
		} else {
			price = price - subcouponinf;
		}
		request.getSession().setAttribute("session_before_price", price);

		return;
	}

	@ResponseBody
	@RequestMapping(value = "user/purchase/insertPurchase", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String insertPurchase(@RequestBody Map<Object, Object> rsp, @ModelAttribute("session_user") User user) {

		rsp.put("user_idx", user.getUser_index());

		String msg = "0";

		Map<Object, Object> rsp2 = (Map<Object, Object>) rsp.get("rsp");

		List<Object> ucList = (List<Object>) rsp2.get("custom_data");

		Map<String, Object> delcartList = new HashMap<String, Object>();

		delcartList.put("userIdx", user.getUser_index());
		delcartList.put("cartList", ucList.get(2));
		
		Map<String, Object> addPurchaseList = new HashMap<String, Object>();
		
		addPurchaseList.put("lecIdx", ucList.get(2));
		addPurchaseList.put("u_id", rsp2.get("merchant_uid"));

		if (((UserServiceImpl) userServiceImpl).insertPurchase(rsp) > 0 && ((UserServiceImpl) userServiceImpl).insertPurchaseList(addPurchaseList) > 0) {
			if (ucList.get(1).equals("") || ucList.get(1) == null || ((UserServiceImpl) userServiceImpl).deleteUserCoupon(ucList.get(1)) > 0) {
				if (((UserServiceImpl) userServiceImpl).deletefromCart(delcartList) > 0) {
					msg = (String) rsp2.get("merchant_uid");
				}
			}
		}

		return msg;
	}

	@RequestMapping(value = "user/purchase/purchaseCompleted")
	public String purchaseCompleted(@RequestParam(value = "msg") String msg, Model model)
			throws UnsupportedEncodingException {

		msg = URLDecoder.decode(msg, "UTF-8");

		Map<String, Object> paycompleted = ((UserServiceImpl) userServiceImpl).selectPurchase(msg);

		model.addAttribute("pc", paycompleted);

		return "user/_purchaseCompleted";
	}

	@RequestMapping(value = "/user/mypage")
	public String mypageList(@ModelAttribute("session_user") User user, Model model,
			@RequestParam(value = "lcPage", required = false, defaultValue = "1") int lcPage,
			@RequestParam(value = "wcPage", required = false, defaultValue = "1") int wcPage,
			@RequestParam(value = "qnaPage", required = false, defaultValue = "1") int qnaPage) {

		int numPerPage = 5;

		List<Map<String, String>> llist = ((UserServiceImpl) userServiceImpl).myLectureList(user.getUser_index(), lcPage, numPerPage);
		List<Map<String, String>> qnalist = ((UserServiceImpl) userServiceImpl).myqnaList(user.getUser_index(), qnaPage, numPerPage);
		List<Map<String, String>> wlist = ((UserServiceImpl) userServiceImpl).myWishList(user.getUser_index(), wcPage, numPerPage);
		List<Purchase> plist = ((UserServiceImpl) userServiceImpl).myPaymentList(user.getUser_index());
		List<Map<String, String>> couponlist = ((UserServiceImpl) userServiceImpl).myCoupontList(user.getUser_index());

		HashMap<String, Object> pagingInf = new HashMap<String, Object>();

		pagingInf.put("user_index", user.getUser_index());

		pagingInf.put("tab", "myLecture");
		pagingInf.put("lTotalCnt", ((UserServiceImpl) userServiceImpl).myPageTotalCnt(pagingInf));
		pagingInf.put("lcPage", lcPage);

		pagingInf.put("tab", "wishList");
		pagingInf.put("wTotalCnt", ((UserServiceImpl) userServiceImpl).myPageTotalCnt(pagingInf));
		pagingInf.put("wcPage", wcPage);

		pagingInf.put("tab", "QnAList");
		pagingInf.put("qnaTotalCnt", ((UserServiceImpl) userServiceImpl).myPageTotalCnt(pagingInf));
		pagingInf.put("qnaPage", qnaPage);

		Map<String, Object> mypageList = new HashMap<String, Object>();

		mypageList.put("llist", llist);
		mypageList.put("wlist", wlist);
		mypageList.put("qnalist", qnalist);
		mypageList.put("plist", plist);
		mypageList.put("clist", couponlist);

		model.addAttribute("mypageList", mypageList).addAttribute("numPerPage", numPerPage).addAttribute("pagingInf",
				pagingInf);

		return "user/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/cancel_lecture/{lecture_index}")
	public int cancelLecture(@PathVariable(value = "lecture_index") int lecture_index,
			@SessionAttribute("session_user") User user) {
		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("lecture_index", lecture_index);
		hmap.put("user_index", user.getUser_index());

		int result = ((UserServiceImpl) userServiceImpl).cancelLecture(hmap);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/deleteWishList", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> deleteWishList(@ModelAttribute("session_user") User user,
			@RequestParam(value = "checkArr[]") List<Integer> checkArr) {

		Map<String, Object> checkList = new HashMap<String, Object>();

		checkList.put("userIdx", user.getUser_index());
		checkList.put("wishList", checkArr);

		int result = ((UserServiceImpl) userServiceImpl).deleteWishList(checkList);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		data.put("href", "/user/mypage");

		return data;
	}

	@RequestMapping(value = "/user/mypage/infoPage/{userindex}")
	public String info(Model model, @PathVariable("userindex") String userindex) {
		System.out.println(userindex);

		Map<Object, Object> map = new HashMap<Object, Object>();

		map.put("userindex", userindex);

		int history = ((UserServiceImpl) userServiceImpl).history(map);
		model.addAttribute("history", history);
		return "user/C_information";
	}

	@RequestMapping("/user/mypage/infoTrans")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestParam("userid") String transName) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = ((UserServiceImpl) userServiceImpl).idcheck(transName);
		map.put("cnt", count);

		return map;
	}
	/*
	 * 기존의 암호화된 비밀번호를 가지고 와서 내 비밀번호와 같은지 확인하고 같다면 새 비밀번호를 확인하고(다시 한번 쓰는 새 비밀번호)
	 * 같다면 암호화 처리해서 새비밀번호 값을 넘긴다. 기존의 암호화된 비밀번호와 내 비밀번호가 같지 않다면 어랏트 창으로 비밀번호가 같지
	 * 않다고 띄어준다.
	 */

	@RequestMapping("/user/mypage/PasswordCheck")
	@ResponseBody
	public int userpw(@RequestParam("userpassword") String userpassword, @RequestParam("userindex") String userindex) {

		int check = 0;
		String findPw = ((UserServiceImpl) userServiceImpl).pwSearch(userindex);
		System.out.println(userpassword);
		System.out.println(findPw);
		/*
		 * userpassword=bcryptPasswordEncoder.encode(userpassword);
		 * System.out.println(userpassword);
		 */
		if (bcryptPasswordEncoder.matches(userpassword, findPw)) {
			System.out.println("비밀번호 같음");
			check = 1;
		} else {
			System.out.println("비밀번호 다름");
		}
		return check;
	}

	@RequestMapping("/user/mypage/PasswordChange")
	@ResponseBody
	public int userchpw(@RequestParam("change_pw") String change_pw, @RequestParam("userindex") String userindex) {
		change_pw = bcryptPasswordEncoder.encode(change_pw);
		System.out.println(change_pw);
		int count = 0;

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("change_pw", change_pw);
		map.put("userindex", userindex);
		count = ((UserServiceImpl) userServiceImpl).change_pw(map);

		if (count == 1)
			System.out.println("업데성공");
		else
			System.out.println("실패");

		return count;
		// 새로운 비밀번호를 입력 받아 암호화 처리후 값을 넘김
	}

	@RequestMapping("/user/mypage/C_Info")
	public String infoChange(@RequestParam(value = "myPhone", required = false, defaultValue = "") String myPhone,
			@RequestParam(value = "transName", required = false, defaultValue = "") String transName,
			@RequestParam("userindex") String userindex, Model model) {

		System.out.println("myPhone : " + myPhone);
		System.out.println("transName : " + transName);
		System.out.println("userindex : " + userindex);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("nickname", transName);
		map.put("phone", myPhone);
		map.put("userindex", userindex);
		int count = ((UserServiceImpl) userServiceImpl).infoChange(map);
		if (count == 1)
			System.out.println("업데성공");
		else
			System.out.println("실패");

		User user = ((UserServiceImpl) userServiceImpl).selectOneIndex(userindex);
		model.addAttribute("session_user", user);

		return "redirect:/mypage/infoPage";
	}

	@RequestMapping("/user/mypage/getout")
	public String getout(@RequestParam("userindex") String userindex, SessionStatus status) {

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("userindex", userindex);
		int getout = ((UserServiceImpl) userServiceImpl).getout(map);
		if (getout == 1) {
			if (!status.isComplete())
				status.setComplete();
			return "redirect:/";
		} else {
			System.out.println("삭제 실패");
			return "redirect:/mypage/infoPage";
		}
	}

	@RequestMapping("/user/mypage/imgUpdate")
	@ResponseBody
	public String updateImg(@RequestParam("updateImg") MultipartFile updateImg,
			@ModelAttribute("session_user") User user, HttpServletRequest request, Model model) {

		System.out.println("이미지 파일 명 : " + updateImg.getOriginalFilename());
		System.out.println("Image Size check : " + updateImg.getSize());

		String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/userthumbnail");

		File dir = new File(saveDir);

		String renameFileName = "";

		if (!updateImg.isEmpty()) {
			// 파일명 재생성하여
			// 원본 파일과 매칭 시키기
			String originFileName = updateImg.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".") + 1);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

			int randomNum = (int) (Math.random() * 1000);

			renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + randomNum + "." + ext;

			try {
				updateImg.transferTo(new File(saveDir + "/" + renameFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("updateImg", renameFileName);
		map.put("userindex", user.getUser_index());

		int imgUpdate = ((UserServiceImpl) userServiceImpl).imgUpdate(map);

		User user1 = ((UserServiceImpl) userServiceImpl).selectOneIndex(Integer.toString(user.getUser_index()));
		model.addAttribute("session_user", user1);
		return "test";
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/inputWishList/{lecture_index}")
	public int inputWishList(@PathVariable(value = "lecture_index") int lecture_index,
			@SessionAttribute("session_user") User user) {
		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("lecture_index", lecture_index);
		hmap.put("user_index", user.getUser_index());

		int result = ((UserServiceImpl) userServiceImpl).inputWishList(hmap);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/deleteWishList/{lecture_index}")
	public int deleteWishListone(@PathVariable(value = "lecture_index") int lecture_index,
			@SessionAttribute("session_user") User user) {
		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("lecture_index", lecture_index);
		hmap.put("user_index", user.getUser_index());

		int result = ((UserServiceImpl) userServiceImpl).deleteWishListone(hmap);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/checkcart/{lecture_index}")
	public int checkcart(@PathVariable(value = "lecture_index") int lecture_index,
			@SessionAttribute("session_user") User user) {
		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("lecture_index", lecture_index);
		hmap.put("user_index", user.getUser_index());

		int result = ((UserServiceImpl) userServiceImpl).checkcart(hmap);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/addTocart/{lecture_index}")
	public int addTocart(@PathVariable(value = "lecture_index") int lecture_index,
			@SessionAttribute("session_user") User user) {
		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("lecture_index", lecture_index);
		hmap.put("user_index", user.getUser_index());

		int result = ((UserServiceImpl) userServiceImpl).addTocart(hmap);
		return result;
	}
}