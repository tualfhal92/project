package com.misoot.lar.common.sockJS.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.sockJS.model.dao.InquireDaoImpl;
import com.misoot.lar.common.sockJS.model.vo.Inquire;

@Service
public class InquireServiceImpl implements LarService<Inquire> {

	@Autowired
	LarDao<Inquire> larDao;

	@Override
	public Inquire selectOne(int index) {
		return null;
	}

	@Override
	public List<Inquire> selectList() {
		return null;
	}

	@Override
	public int insert(Inquire t) {
		return larDao.insert(t);
	}

	@Override
	public int update(Inquire t) {
		return 0;
	}

	@Override
	public int delete(int index) {
		return 0;
	}

	public List<Map<String, Object>> selectAllList() {
		return ((InquireDaoImpl) larDao).selectAllList();
	}

	public List<Map<String, Object>> selectList(int user) {
		return ((InquireDaoImpl) larDao).selectList(user);
	}

	public int deleteContent(int no) {
		return ((InquireDaoImpl) larDao).deleteContent(no);
	}

	public int insert(Map<String, Object> msgMap) {
		return ((InquireDaoImpl) larDao).insert(msgMap);
	}

	public int fileUpdate(Map<String, String> fileName) {
		return ((InquireDaoImpl) larDao).fileUpdate(fileName);
	}
}