package com.misoot.lar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.user.model.vo.Purchase;
import com.misoot.lar.user.model.vo.User;

@Repository
public class AdminDaoImpl implements LarDao<Admin> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Admin selectOne(int index) {
		return null;
	}
	
	@Deprecated
	@Override
	public List<Admin> selectList() {
		return null;
	}

	@Override
	public int insert(Admin t) {
		return 0;
	}

	@Override
	public int update(Admin t) {
		return 0;
	}

	@Override
	public int delete(int index) {
		return 0;
	}
	
	public int getTodaySignupCount() {
		return sqlSession.selectOne("admin.getTodaySignupCount");
	}

	public int getTodayPurchaseCount() {
		return sqlSession.selectOne("admin.getTodayPurchaseCount");
	}

	public int getTodayCommuCount() {
		return sqlSession.selectOne("admin.getTodayCommuCount");
	}

	public int getTodayCommuReply() {
		return sqlSession.selectOne("admin.getTodayCommuReply");
	}

	public List<User> selectUserList(int user_level, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectUserList", user_level, rowBounds);
	}

	public int getSelectUserListCount(int user_level) {
		return sqlSession.selectOne("admin.getSelectUserListCount", user_level);
	}

	public User selectUser(int user_index) {
		return sqlSession.selectOne("admin.selectUser", user_index);
	}
	
	public int modifyUserByAdmin(User user) {
		return sqlSession.update("admin.modifyUserByAdmin", user);
	}
	
	public List<Commu> selectCommuListByUserIndex(int user_index, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuListByUserIndex", user_index, rowBounds);
	}
	
	public int getSelectCommuListCountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getSelectCommuListCountByUserIndex", user_index);
	}
	
	public List<Commu> searchCommuListByUserIndex(Map<String, Object> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchCommuListByUserIndex", searchMap, rowBounds);
	}

	public int getSearchCommuListCountByUserIndex(Map<String, Object> searchMap) {
		return sqlSession.selectOne("admin.getSearchCommuListCountByUserIndex", searchMap);
	}
	
	public List<CommuReply> selectCommuReplyListByUserIndex(int user_index, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuReplyListByUserIndex", user_index, rowBounds);
	}
	
	public int getSelectCommuReplyListCountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getSelectCommuReplyListCountByUserIndex", user_index);
	}
	
	public List<CommuReply> searchCommuReplyListByUserIndex(Map<String, Object> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchCommuReplyListByUserIndex", searchMap, rowBounds);
	}

	public int getSearchCommuReplyListCountByUserIndex(Map<String, Object> searchMap) {
		return sqlSession.selectOne("admin.getSearchCommuReplyListCountByUserIndex", searchMap);
	}
	
	public int getTotalPurchaseCountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getTotalPurchaseCountByUserIndex", user_index);
	}

	public int getTotalPurchaseAmountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getTotalPurchaseAmountByUserIndex", user_index);
	}
	
	public List<Purchase> selectPurchaseListByUserIndex(int user_index, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectPurchaseListByUserIndex", user_index, rowBounds);
	}
	
	public int getSelectPurchaseListCountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getSelectPurchaseListCountByUserIndex", user_index);
	}
	
	public List<Map<String, String>> selectCouponListByUserIndex(int user_index, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCouponListByUserIndex", user_index, rowBounds);
	}
	
	public int getSelectCouponListCountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getSelectCouponListCountByUserIndex", user_index);
	}
	
	public int getSelectUnusedCouponListCountByUserIndex(int user_index) {
		return sqlSession.selectOne("admin.getSelectUnusedCouponListCountByUserIndex", user_index);
	}
	
	public List<User> searchUserList(Map<String, Object> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchUserList", searchMap, rowBounds);
	}

	public int getSearchUserListCount(Map<String, Object> searchMap) {
		return sqlSession.selectOne("admin.getSearchUserListCount", searchMap);
	}
	
	/*
	 * community area
	 */
	
	public Commu selectCommuByCommuIndex(int commu_index) {
		return sqlSession.selectOne("admin.selectCommuByCommuIndex", commu_index);
	}

	public List<CommuReply> selectCommuReplyListByCommuIndex(int commu_index) {
		return sqlSession.selectList("admin.selectCommuReplyListByCommuIndex", commu_index);
	}
	
	public List<Commu> selectCommuList(String category, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuList", category, rowBounds);
	}
	
	public int getSelectCommuListCount(String category) {
		return sqlSession.selectOne("admin.getSelectCommuListCount", category);
	}
	
	public List<Commu> searchCommuList(Map<String, String> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchCommuList", searchMap, rowBounds);
	}
	
	public int getSearchCommuListCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("admin.getSearchCommuListCount", searchMap);
	}

	public int deleteCommuByCommuIndex(int target_index) {
		return sqlSession.update("admin.deleteCommuByCommuIndex", target_index);
	}

	public int restoreCommuByCommuIndex(int target_index) {
		return sqlSession.update("admin.restoreCommuByCommuIndex", target_index);
	}
	
	public CommuReply selectCommuReplyByCommuReplyIndex(int commuReply_index) {
		return sqlSession.selectOne("admin.selectCommuReplyByCommuReplyIndex", commuReply_index);
	}

	public int deleteCommuReplyByCommuReplyIndex(int target_index) {
		return sqlSession.update("admin.deleteCommuReplyByCommuReplyIndex", target_index);
	}

	public int restoreCommuReplyByCommuReplyIndex(int target_index) {
		return sqlSession.update("admin.restoreCommuReplyByCommuReplyIndex", target_index);
	}

	public int getCommuIndexByCommuReplyIndex(int target_index) {
		return sqlSession.selectOne("admin.getCommuIndexByCommuReplyIndex", target_index);
	}

	public List<Lecture> selectLectureList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectLectureList", null, rowBounds);
	}

	public int getSelectLectureListCount() {
		return sqlSession.selectOne("admin.getSelectLectureListCount");
	}

	public List<Map<String, String>> selectCouponList() {
		return sqlSession.selectList("admin.selectCouponList");
	}
	
	public List<Map<String, String>> selectCouponList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCouponList", null, rowBounds);
	}
	
	public int getSelectCouponListCount() {
		return sqlSession.selectOne("admin.getSelectCouponListCount");
	}

	public int management_Coupon_Add(Map<String, String> coupon_map) {
		return sqlSession.insert("admin.management_Coupon_Add", coupon_map);
	}

	public List<Map<String, String>> selectCategoryList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCategoryList", null, rowBounds);
	}
	
	public List<Map<String, String>> selectCategoryList() {
		return sqlSession.selectList("admin.selectCategoryList");
	}

	public int getSelectCategoryListCount() {
		return sqlSession.selectOne("admin.getSelectCategoryListCount"); 
	}

	public int management_Category_Add(String category_name) {
		return sqlSession.insert("admin.management_Category_Add", category_name);
	}

	public int management_Lecture_Add(Lecture lecture) {
		return sqlSession.insert("admin.management_Lecture_Add", lecture);
	}

	public int giveCouponToUser(Map<String, Object> insertMap) {
		return sqlSession.insert("admin.giveCouponToUser", insertMap);
	}

	public Purchase selectPurchaseByPurchaseMap(Map<String, Object> selectMap) {
		return sqlSession.selectOne("admin.selectPurchaseByPurchaseMap", selectMap);
	}

	public List<Map<String, Object>> selectPurchaseLectureList(String target_index) {
		return sqlSession.selectList("admin.selectPurchaseLectureList", target_index);
	}

	public List<Map<String, Integer>> getYearlySignupChart() {
		return sqlSession.selectList("admin.getYearlySignupChart");
	}

	public List<Map<String, Integer>> getYearlyPurchaseCountChart() {
		return sqlSession.selectList("admin.getYearlyPurchaseCountChart");
	}

	public List<Map<String, Integer>> getYearlyPurchaseAmountChart() {
		return sqlSession.selectList("admin.getYearlyPurchaseAmountChart");
	}
	
	public List<Map<String, Integer>> getYearlyCommuChart() {
		return sqlSession.selectList("admin.getYearlyCommuChart");
	}

	public List<Map<String, Integer>> getYearlyCommuReplyChart() {
		return sqlSession.selectList("admin.getYearlyCommuReplyChart");
	}
}