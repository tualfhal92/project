package com.misoot.lar.commu.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.commu.model.dao.CommuReplyDaoImpl;
import com.misoot.lar.commu.model.vo.CommuReply;

@Service
public class CommuReplyServiceImpl implements LarService<CommuReply> {
	
	@Autowired
	LarDao<CommuReply> commuReplyDaoImpl;
	
	@Override
	public CommuReply selectOne(int index) {
		return commuReplyDaoImpl.selectOne(index);
	}

	@Override
	public List<CommuReply> selectList() {
		return commuReplyDaoImpl.selectList();
	}

	@Override
	public int insert(CommuReply t) {
		return commuReplyDaoImpl.insert(t);
	}

	@Override
	public int update(CommuReply t) {
		return commuReplyDaoImpl.update(t);
	}

	@Override
	public int delete(int index) {
		return commuReplyDaoImpl.delete(index);
	}
	
	
	public List<CommuReply> selectCommuReplyList(int commuNo) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).selectCommuReplyList(commuNo);
	}

	public int insertCommuReply(CommuReply cReply) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).insertCommuReply(cReply);
	}

	public int insertCommuReply_Reply(CommuReply cReply) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).insertCommuReply_Reply(cReply);
	}

	public int updateCommuReply_Reply(CommuReply cReply) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).updateCommuReply_Reply(cReply);
	}

	public CommuReply selectOneCommuReply(int commu_Reply_Index) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).selectOneCommuReply(commu_Reply_Index);
	}

	public int updateCommuReply_Reply2(CommuReply cReply) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).updateCommuReply_Reply2(cReply);
	}

	public int deleteCommuReply_Reply(int commu_Reply_Commu_Index) {
		return ((CommuReplyDaoImpl)commuReplyDaoImpl).deleteCommuReply_Reply(commu_Reply_Commu_Index);
	}

	

	

}
