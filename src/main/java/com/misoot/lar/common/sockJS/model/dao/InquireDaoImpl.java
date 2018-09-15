package com.misoot.lar.common.sockJS.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.sockJS.model.vo.Inquire;

@Repository
public class InquireDaoImpl implements LarDao<Inquire>{
	
	@Autowired
	SqlSessionTemplate sqlSes;

	@Override
	public Inquire selectOne(int index) {
		return null;
	}

	@Override
	public List<Inquire> selectList() {
		return sqlSes.selectList("");
	}

	@Override
	public int insert(Inquire t) {
		System.out.println(t);
		return sqlSes.insert("inquire.insert", t);
	}

	@Override
	public int update(Inquire t) {
		return sqlSes.update("", t);
	}

	@Override
	public int delete(int index) {
		return sqlSes.delete("inquire.delete", index);
	}

	/**
	 *	user's inquire List 
	 */
	public List<Map<String, Object>> selectAllList() {
		return sqlSes.selectList("inquire.selectAll");
	}
	
	public List<Map<String, Object>> selectList(int user) {
		return sqlSes.selectList("inquire.selectUserInquireList", user);
	}

	/**
	 *	user's can't see delete own Inquire 
	 */
	public int deleteContent(int no) {
		return sqlSes.update("inquire.deleteContent", no);
	}

	public int insert(Map<String, Object> msgMap) {
		return sqlSes.insert("inquire.insert", msgMap);
	}

	public int fileUpdate(Map<String, String> fileName) {
		return sqlSes.update("inquire.fileUpload", fileName);
	}
}