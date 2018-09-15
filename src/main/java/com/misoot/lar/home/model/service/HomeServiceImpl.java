package com.misoot.lar.home.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.home.model.dao.HomeDaoImpl;
import com.misoot.lar.home.model.vo.Home;
import com.misoot.lar.lecture.model.vo.Lecture;

@Service
public class HomeServiceImpl implements LarService<Home> {

	@Autowired
	LarDao<Home> homeDaoImpl;
	
	@Deprecated
	@Override
	public Home selectOne(int index) {
		return null;
	}

	@Deprecated
	@Override
	public List<Home> selectList() {
		return null;
	}

	@Deprecated
	@Override
	public int insert(Home t) {
		return 0;
	}
	
	@Deprecated
	@Override
	public int update(Home t) {
		return 0;
	}

	@Deprecated
	@Override
	public int delete(int index) {
		return 0;
	}
	
	public List<Lecture> selectLectureList(String method, int user_index) {
		return ((HomeDaoImpl)homeDaoImpl).selectLectureList(method, user_index);
	}

	public List<Lecture> recomandLectureList(Map<String, Object> hmap) {
		return ((HomeDaoImpl)homeDaoImpl).recomandLectureList(hmap);
	}

	public int wishCount(int user_index) {
		return ((HomeDaoImpl)homeDaoImpl).wishCount(user_index);
	}

	public int lectureCount(int user_index) {
		return ((HomeDaoImpl)homeDaoImpl).lectureCount(user_index);
	}
}