package com.misoot.lar.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.user.model.vo.Purchase;
import com.misoot.lar.user.model.vo.User;

@Repository
public class UserDaoImpl implements LarDao<User> {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public User selectOne(int index) {
		return sqlSession.selectOne("", index);
	}

	@Override
	public List<User> selectList() {
		return sqlSession.selectList("");
	}

	@Override
	public int insert(User t) {
		return sqlSession.insert("user.insert", t);
	}

	@Override
	public int update(User t) {
		return sqlSession.update("", t);
	}
	
	@Override
	public int delete(int index) {
		return 0;
	}

	/*
	 * User account start
	*/
	
	public User selectOne(String user_id) {
		return sqlSession.selectOne("user.select", user_id);
	}

	public boolean idDuplicateCheck(String user_id) {
		return ((Integer)sqlSession.selectOne("user.idDuplicateCheck", user_id) == 0) ? true : false;
	}
	
	public boolean nicknameDuplicateCheck(String user_nickname) {
		return ((Integer)sqlSession.selectOne("user.nicknameDuplicateCheck", user_nickname) == 0) ? true : false;
	}
	
	public boolean phoneDuplicateCheck(String user_phone) {
		return ((Integer)sqlSession.selectOne("user.phoneDuplicateCheck", user_phone) == 0) ? true : false;
	}

	public int trySigninCountIncrease(User user) {
		return sqlSession.update("user.trySigninCountIncrease", user);
	}
	
	public int trySigninCountReset(User user) {
		return sqlSession.update("user.trySigninCountReset", user);
	}
	
	public int trySigninCountResetForUnlock(String id_for_unlock_input) {
		return sqlSession.update("user.trySigninCountResetForUnlock", id_for_unlock_input);
	}
	
	public int passwordModify(User temp) {
		return sqlSession.update("user.passwordModify", temp);
	}
	
	public boolean isUserExist(String user_id) {
		return (Integer)sqlSession.selectOne("user.isUserExist", user_id) != 0 ? true : false;
	}
	
	/*
	 * User account end
	*/
	
	/*
	 * My page start
	 */	
	public int myPageTotalCnt(HashMap<String, Object> pagingInf) {
		return sqlSession.selectOne("user.myPageTotalCnt", pagingInf);
	}
	
	public List<Map<String, String>> myLectureList(int user_index, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("user.myLectureList", user_index, rows);
	}

	public List<Map<String, String>> myWishList(int user_index, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("user.myWishList", user_index, rows);
	}
	
	public List<Map<String, String>> myqnaList(int user_index, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("user.myqnaList", user_index, rows);
	}

	public List<Purchase> myPaymentList(int user_index) {
		return sqlSession.selectList("user.myPaymentList", user_index);
	}

	public List<Map<String, String>> myCoupontList(int user_index) {
		return sqlSession.selectList("user.myCouponList", user_index);
	}
	
	public int cancelLecture(Map<String, Object> hmap) {
		return sqlSession.update("user.cancelLecture",hmap);
	}
	
	public int deleteWishList(Map<String, Object> checkList) {
		return sqlSession.delete("user.deleteWishList",checkList);
	}
	/*
	 * My page end
	 */

	/*
	 * cart start
	 */
	public List<Map<String, Object>> cartList(int user_index) {
		return sqlSession.selectList("user.cartList", user_index);
	}
	
	public int deleteCart(Map<String, Object> delcartList) {
		return sqlSession.delete("user.deleteCart", delcartList);
	}
	/*
	 * cart end
	 */

	/*
	 * purchase start
	 */
	public List<Map<String, Object>> purchaseList(String[] check) {
		return sqlSession.selectList("user.purchaseList", check);
	}
	
	public int insertPurchase(Map<Object, Object> rsp) {
		return sqlSession.insert("user.insertPurchase", rsp);
	}
	
	public int deleteUserCoupon(Object user_coupon_inx) {
		return sqlSession.update("user.deleteUserCoupon", user_coupon_inx);
	}
	
	public Map<String, Object> selectPurchase(String msg) {
		return sqlSession.selectOne("user.selectPurchase", msg);
	}
	
	public int deletefromCart(Map<String, Object> delcartList) {
		return sqlSession.delete("user.deletefromCart", delcartList);
	}
	
	public int insertPurchaseList(Map<String, Object> addPurchaseList) {
		return sqlSession.insert("user.insertPurchaseList", addPurchaseList);
	}
	/*
	 * purchase end
	 */

	public int nickNameCheck(String transName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.nicknameDuplicateCheck", transName);
	}

	public String pwSearch(String userindex) {
		return sqlSession.selectOne("user.pwSearch", userindex);
	}

	public int change_pw(Map<Object, Object> map) {
		return sqlSession.update("user.change_pw", map);
	}

	public int infoChange(Map<Object, Object> map) {
		
		return sqlSession.update("user.infoChange", map);
	}

	public User selectOneIndex(String userindex) {
		return sqlSession.selectOne("user.selectOneIndex", userindex);
	}

	public int getout(Map<Object, Object> map) {

		return sqlSession.update("user.getout", map);
	}

	public int imgUpdate(Map<Object, Object> map) {
		return sqlSession.update("user.imgUpdate",map);
	}

	public int history(Map<Object, Object> map) {
		return sqlSession.selectOne("user.history",map);
	}
	
	public int inputWishList(Map<String, Object> hmap) {
		return sqlSession.insert("user.inputWishList", hmap);
	}

	public int deleteWishListone(Map<String, Object> hmap) {
		return sqlSession.delete("user.deleteWishListone", hmap);
	}

	public int checkcart(Map<String, Object> hmap) {
		return sqlSession.selectOne("user.checkcart", hmap);
	}

	public int addTocart(Map<String, Object> hmap) {
		return sqlSession.insert("user.addTocart", hmap);
	}

}