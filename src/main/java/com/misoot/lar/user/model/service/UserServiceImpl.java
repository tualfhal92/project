package com.misoot.lar.user.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.user.model.dao.UserDaoImpl;
import com.misoot.lar.user.model.vo.Purchase;
import com.misoot.lar.user.model.vo.User;

@Service
public class UserServiceImpl implements LarService<User> {
	@Autowired
	LarDao<User> userDaoImpl;

	@Override
	public User selectOne(int index) {
		return userDaoImpl.selectOne(index);
	}

	@Override
	public List<User> selectList() {
		return userDaoImpl.selectList();
	}

	@Override
	public int insert(User t) {
		return userDaoImpl.insert(t);
	}

	@Override
	public int update(User t) {
		return userDaoImpl.update(t);
	}

	@Override
	public int delete(int index) {
		return userDaoImpl.delete(index);
	}

	/*
	 * User account start
	*/
	public User selectOne(String user_id) {
		return ((UserDaoImpl)userDaoImpl).selectOne(user_id);
	}

	public boolean idDuplicateCheck(String user_id) {
		return ((UserDaoImpl)userDaoImpl).idDuplicateCheck(user_id);
	}

	public boolean nicknameDuplicateCheck(String user_nickname) {
		return ((UserDaoImpl)userDaoImpl).nicknameDuplicateCheck(user_nickname);
	}

	public boolean phoneDuplicateCheck(String user_phone) {
		return ((UserDaoImpl)userDaoImpl).phoneDuplicateCheck(user_phone);
	}

	public int trySigninCountIncrease(User user) {
		return ((UserDaoImpl)userDaoImpl).trySigninCountIncrease(user);
	}
	
	public int trySigninCountReset(User user) {
		return ((UserDaoImpl)userDaoImpl).trySigninCountReset(user);
	}
	
	public int trySigninCountResetForUnlock(String id_for_unlock_input) {
		return ((UserDaoImpl)userDaoImpl).trySigninCountResetForUnlock(id_for_unlock_input);
	}
	
	public int passwordModify(User temp) {
		return ((UserDaoImpl)userDaoImpl).passwordModify(temp);
	}
	
	public boolean isUserExist(String user_id) {
		return ((UserDaoImpl)userDaoImpl).isUserExist(user_id);
	}
	
	/*
	 * User account end
	*/
	
	/*
	 * My page start
	 */
	public int myPageTotalCnt(HashMap<String, Object> pagingInf) {
		return ((UserDaoImpl)userDaoImpl).myPageTotalCnt(pagingInf);
	}
	
	public List<Map<String, String>> myLectureList(int user_index, int cPage, int numPerPage) {
		return ((UserDaoImpl)userDaoImpl).myLectureList(user_index, cPage, numPerPage);
	}

	public List<Map<String, String>> myWishList(int user_index, int cPage, int numPerPage) {
		return ((UserDaoImpl)userDaoImpl).myWishList(user_index, cPage, numPerPage);
	}

	public List<Map<String, String>> myqnaList(int user_index, int cPage, int numPerPage) {
		return ((UserDaoImpl)userDaoImpl).myqnaList(user_index, cPage, numPerPage);
	}
	
	public List<Purchase> myPaymentList(int user_index) {
		return ((UserDaoImpl)userDaoImpl).myPaymentList(user_index);
	}

	public List<Map<String, String>> myCoupontList(int user_index) {
		return ((UserDaoImpl)userDaoImpl).myCoupontList(user_index);
	}
	
	public int cancelLecture(Map<String, Object> hmap) {
		return ((UserDaoImpl)userDaoImpl).cancelLecture(hmap);
	}

	public int deleteWishList(Map<String, Object> checkList) {
		return ((UserDaoImpl)userDaoImpl).deleteWishList(checkList);
	}

	/*
	 * My page end
	 */

	/*
	 * cart start
	 */
	public List<Map<String, Object>> cartList(int user_index) {
		return ((UserDaoImpl)userDaoImpl).cartList(user_index);
	}
	
	public int deleteCart(Map<String, Object> delcartList) {
		return ((UserDaoImpl)userDaoImpl).deleteCart(delcartList);
	}
	/*
	 * cart end
	 */
	
	/*
	 * purchase start
	 */
	public List<Map<String, Object>> purchaseList(String[] check) {
		return ((UserDaoImpl)userDaoImpl).purchaseList(check);
	}
	
	public int insertPurchase(Map<Object, Object> rsp) {
		return ((UserDaoImpl)userDaoImpl).insertPurchase(rsp);
	}
	
	public Map<String, Object> selectPurchase(String msg) {
		return ((UserDaoImpl)userDaoImpl).selectPurchase(msg);
	}
	
	public int deleteUserCoupon(Object user_coupon_inx) {
		return ((UserDaoImpl)userDaoImpl).deleteUserCoupon(user_coupon_inx);
	}
	
	public int deletefromCart(Map<String, Object> delcartList) {
		return ((UserDaoImpl)userDaoImpl).deletefromCart(delcartList);
	}
	
	public int insertPurchaseList(Map<String, Object> addPurchaseList) {
		return ((UserDaoImpl)userDaoImpl).insertPurchaseList(addPurchaseList);
	}
	/*
	 * purchase end
	 */

	public int idcheck(String transName) {
		return ((UserDaoImpl)userDaoImpl).nickNameCheck(transName);
	}


	public String pwSearch(String userindex) {
		
		return ((UserDaoImpl)userDaoImpl).pwSearch(userindex);
	}

	public int change_pw(Map<Object, Object> map) {
		
		return ((UserDaoImpl)userDaoImpl).change_pw(map);
	}

	public int infoChange(Map<Object, Object> map) {

		return ((UserDaoImpl)userDaoImpl).infoChange(map);
	}

	public User selectOneIndex(String userindex) {
		return ((UserDaoImpl)userDaoImpl).selectOneIndex(userindex);
	}

	public int getout(Map<Object, Object> map) {
		return ((UserDaoImpl)userDaoImpl).getout(map);
	}

	public int imgUpdate(Map<Object, Object> map) {
		return ((UserDaoImpl)userDaoImpl).imgUpdate(map);
	}

	public int history(Map<Object, Object> map) {
		return ((UserDaoImpl)userDaoImpl).history(map);
	}
	
	public int inputWishList(Map<String, Object> hmap) {
		return ((UserDaoImpl)userDaoImpl).inputWishList(hmap);
	}

	public int deleteWishListone(Map<String, Object> hmap) {
		return ((UserDaoImpl)userDaoImpl).deleteWishListone(hmap);
	}

	public int checkcart(Map<String, Object> hmap) {
		return ((UserDaoImpl)userDaoImpl).checkcart(hmap);
	}

	public int addTocart(Map<String, Object> hmap) {
		return ((UserDaoImpl)userDaoImpl).addTocart(hmap);
	}
}