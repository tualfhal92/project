package com.misoot.lar.commu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;

@Repository
public class CommuReplyDaoImpl implements LarDao<CommuReply> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public CommuReply selectOne(int index) {
		return sqlSession.selectOne("", index);
	}

	@Override
	public List<CommuReply> selectList() {
		return sqlSession.selectList("");
	}

	@Override
	public int insert(CommuReply t) {
		return sqlSession.insert("", t);
	}

	@Override
	public int update(CommuReply t) {
		return sqlSession.update("", t);
	}

	@Override
	public int delete(int index) {
		return 0;
	}
	
	public List<CommuReply> selectCommuReplyList(int commuNo) {
		return sqlSession.selectList("commuReply.selectCommuReplyList",commuNo);
	}

	public int insertCommuReply(CommuReply cReply) {
		return sqlSession.insert("commuReply.insertCommuReply",cReply);
	}

	public int insertCommuReply_Reply(CommuReply cReply) {
		return sqlSession.insert("commuReply.insertCommuReplyReply",cReply);
	}

	public int updateCommuReply_Reply(CommuReply cReply) {
		return sqlSession.update("commuReply.updateCommuReplyReply", cReply);
	}

	public CommuReply selectOneCommuReply(int commu_Reply_Index) {
		return sqlSession.selectOne("commuReply.selectOneCommuReply", commu_Reply_Index);
	}

	public int updateCommuReply_Reply2(CommuReply cReply) {
		return sqlSession.update("commuReply.updateCommuReplyReply2", cReply);
	}

	public int deleteCommuReply_Reply(int commu_Reply_Commu_Index) {
		return sqlSession.update("commuReply.deleteCommuReplyReply",commu_Reply_Commu_Index);
	}

	

}
