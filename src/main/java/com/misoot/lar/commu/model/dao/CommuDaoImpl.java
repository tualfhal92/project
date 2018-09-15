package com.misoot.lar.commu.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.commu.model.vo.Attachment;
import com.misoot.lar.commu.model.vo.Commu;

@Repository
public class CommuDaoImpl implements LarDao<Commu> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Commu selectOne(int index) {
		return sqlSession.selectOne("", index);
	}
		
	@Override
	public List<Commu> selectList() {
		return sqlSession.selectList("");
	}
	@Override
	public int insert(Commu t) {
		return sqlSession.insert("", t);
	}
	@Override
	public int update(Commu t) {
		return sqlSession.update("", t);
	}
	@Override
	public int delete(int index) {
		return 0;
	}

	
	
	public List<Map<String, String>> selectCommuList(int cPage, int numPerPage) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset : 최초 게시글 번호 (1페이지면 1, 2페이지면 11 ...)
		 * limit : 제한 게시글 (최초 게시글로부터 10개)
		*/
		System.out.println("commuOffset : "+(cPage-1)*numPerPage);
		System.out.println("commuLimit : "+numPerPage);
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("commu.selectCommuList",null,rows);
	}
	public List<Map<String, String>> selectCommuListSearchTitle(int cPage, int numPerPage, String commuSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		commuSearchText="%"+commuSearchText+"%";
		return sqlSession.selectList("commu.selectCommuListSearchTitle",commuSearchText,rows);
	}

	public List<Map<String, String>> selectCommuListSearchWriter(int cPage, int numPerPage, String commuSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		commuSearchText="%"+commuSearchText+"%";
		return sqlSession.selectList("commu.selectCommuListSearchWriter",commuSearchText,rows);
	}


	public int selectCommuTotalContents() {
		return sqlSession.selectOne("commu.selectCommuTotalContents");
	}

	public Commu selectCommuOne(int commuNo) {
		return sqlSession.selectOne("commu.selectCommuOne",commuNo);
	}

	public List<Attachment> selectAttachmentList(int commuNo) {
		//System.out.println("boardNo"+commuNo);
		return sqlSession.selectList("commu.selectAttachmentList",commuNo);
	}

	public int insertCommu(Commu commu) {
		return sqlSession.insert("commu.insertCommu",commu);
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("commu.insertAttachment",a);
	}

	public int IncreaseCommu(int commuNo) {
		return sqlSession.update("commu.IncreaseCommu",commuNo);
	}
	public int selectCommuTotalContentsTitle(String commuSearchText) {
		commuSearchText="%"+commuSearchText+"%";
		return sqlSession.selectOne("commu.selectCommuTotalContentsTitle",commuSearchText);
	}
	public int selectCommuTotalContentsWriter(String commuSearchText) {
		commuSearchText="%"+commuSearchText+"%";
		return sqlSession.selectOne("commu.selectCommuTotalContentsWriter",commuSearchText);
	}
	public List<Map<String, String>> selectNoticeList() {
		return sqlSession.selectList("commu.selectNoticeList");
	}

	
	
	public List<Map<String, String>> selectQAListSearchTitle(int cPage, int numPerPage, String qaSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		qaSearchText="%"+qaSearchText+"%";
		return sqlSession.selectList("commu.selectQAListSearchTitle",qaSearchText,rows);
	}//

	public List<Map<String, String>> selectQAListSearchWriter(int cPage, int numPerPage, String qaSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		qaSearchText="%"+qaSearchText+"%";
		return sqlSession.selectList("commu.selectQAListSearchWriter",qaSearchText,rows);
	}//

	public int selectQATotalContentsTitle(String qaSearchText) {
		qaSearchText="%"+qaSearchText+"%";
		return sqlSession.selectOne("commu.selectQATotalContentsTitle",qaSearchText);
	}//

	public int selectQATotalContentsWriter(String qaSearchText) {
		qaSearchText="%"+qaSearchText+"%";
		return sqlSession.selectOne("commu.selectQATotalContentsWriter",qaSearchText);
	}//

	public List<Map<String, String>> selectQAList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("commu.selectQAList",null,rows);
	}//

	public int selectQATotalContents() {
		return sqlSession.selectOne("commu.selectQATotalContents");
	}

	public int deleteCommu(String user_index) {
		return sqlSession.update("commu.deleteCommu",user_index);
		
	}

	public List<Map<String, String>> selectNewsList() {
		return sqlSession.selectList("commu.selectNewsList");
	}

	public List<Map<String, String>> selectCommuListSearchTags(int cPage, int numPerPage, String commuSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		commuSearchText="%"+commuSearchText+"%";
		return sqlSession.selectList("commu.selectCommuListSearchTags",commuSearchText,rows);
	}

	public int selectCommuTotalContentsTag(String commuSearchText) {
		commuSearchText="%"+commuSearchText+"%";
		return sqlSession.selectOne("commu.selectCommuTotalContentsTags",commuSearchText);
	}

	public int selectQATotalContentsTag(String qaSearchText) {
		qaSearchText="%"+qaSearchText+"%";
		return sqlSession.selectOne("commu.selectQATotalContentsTags",qaSearchText);
	}

	public List<Map<String, String>> selectQAListSearchTags(int qacPage, int numPerPage, String qaSearchText) {
		RowBounds rows = new RowBounds((qacPage-1)*numPerPage,numPerPage);
		qaSearchText="%"+qaSearchText+"%";
		return sqlSession.selectList("commu.selectQAListSearchTags",qaSearchText,rows);
	}

	public int updateCommu(Commu commu) {
		return sqlSession.update("commu.updateCommu",commu);
	}

	public int updateAttachment(Attachment a) {
		return sqlSession.update("commu.updateAttachment",a);
	}

}
