package com.misoot.lar.common.sockJS.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.sockJS.model.service.InquireServiceImpl;
import com.misoot.lar.common.sockJS.model.vo.Inquire;
import com.misoot.lar.common.util.Utils;
import com.misoot.lar.user.model.vo.User;


@Controller
public class InquireController {
	
	@Autowired
	LarService<Inquire> larService;
	
	@MessageMapping("/question")
    @SendTo("/topic/greetings") 
	public Map<String, Object> sendEcho(Inquire msg, @SessionAttribute("session_user") User user) throws Exception { 
		System.out.println("sender : " + msg.getInquire_sender_index());
		System.out.println("receiver : " + msg.getInquire_receiver_index());
		System.out.println("receive message : " + msg.getInquire_content());
		System.out.println("sendDate : " + new Date(System.currentTimeMillis()));
		msg.setInquire_sendDate(new Date(System.currentTimeMillis()));
		
		System.out.println("What is msg? : "+msg);
		
		Map<String, Object> msgMap = new HashMap<String, Object>();
		
		System.out.println("user Info : "+user.getUser_thumbnail());
		
		msgMap.put("msg", msg);
		msgMap.put("user_thumbnail", user.getUser_thumbnail());
		
		if(user.getUser_level() == 1001) {
			msgMap.put("level", "admin");
		} else {
			msgMap.put("level", "user");
		}
		
		((InquireServiceImpl) larService).insert(msgMap);
		
		return msgMap;
	}
	
	/**
	 *	fileUpload part 
	 */
	@RequestMapping("/inquireAttachment")
	public @ResponseBody Map<String, Object> inquireAttachment(@RequestParam(value = "input_file", required = false) MultipartFile file,
			HttpServletRequest request) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/inquire");
		File dir = new File(saveDir);
		System.out.println(saveDir);
		if (!dir.exists())
			System.out.println("dir.mkdirs() = " + dir.mkdirs());

		if (!file.isEmpty()) {
			// 파일명 재생성하여 원본 파일과 매칭 시키기
			String originFileName = file.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".") + 1);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

			int randomNum = (int) (Math.random() * 1000);

			String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + randomNum + "." + ext;

			try {
				file.transferTo(new File(saveDir + "/" + renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			Map<String, String> fileName = new HashMap<String, String>();

			fileName.put("orginFileName", originFileName);
			fileName.put("renamedFileName", renamedFileName);

			int attachResult = ((InquireServiceImpl) larService).fileUpdate(fileName);
			System.out.println(attachResult);
			result = (attachResult > 0) ? 1 : 0;
			
			resultMap.put("result", result);
			resultMap.put("renamedFileName", renamedFileName);
		}

		return resultMap;
	}
	
	/**
	 *	userView Select 
	 */
	@RequestMapping(value="/inquireUserView", method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> inquireUserView(@RequestParam("user") int user){
		Utils util = new Utils();
		
		List<Map<String, Object>> list = ((InquireServiceImpl) larService).selectList(user);
		for(Map<String, Object> map : list) {			
			map.put("INQUIRE_CONTENT", util.convertClobToString((Clob) map.get("INQUIRE_CONTENT")));
		}
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value="/inquireAllView", method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> inquireAllView(){
		
		Utils util = new Utils();
		
		List<Map<String, Object>> list = ((InquireServiceImpl) larService).selectAllList();
		
		for(Map<String, Object> map : list) {			
			map.put("INQUIRE_CONTENT", util.convertClobToString((Clob) map.get("INQUIRE_CONTENT")));
		}
		
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value="/inquireDelete", method=RequestMethod.POST)
	public @ResponseBody int inquireDelete(@RequestParam("no") int no){
		
		int result = ((InquireServiceImpl) larService).deleteContent(no);
		
		return result;
	}	
}