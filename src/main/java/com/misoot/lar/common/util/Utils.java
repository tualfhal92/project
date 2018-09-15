package com.misoot.lar.common.util;

import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;

public class Utils {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	public static String getLecPageBar(int totalContents, int cPage, int numPerPage,String category,String LecSearchText, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage+'&category="+category+"&LecSearchText="+LecSearchText+"';";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	public static String mypageLcPageBar(int totalContents, int lcPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		lcPage = lcPage==0?1:lcPage;

		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);

		int pageNo = ((lcPage - 1)/pageBarSize) * pageBarSize +1;

		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(lcPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}

		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";

		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='lcPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	public static String mypagelcPageBar(int totalContents, int lcPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		lcPage = lcPage==0?1:lcPage;

		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);

		int pageNo = ((lcPage - 1)/pageBarSize) * pageBarSize +1;

		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_LCpaging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(lcPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_LCpaging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}

		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_LCpaging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";

		pageBar += "<script>";
		pageBar += "function fn_LCpaging(lcPage,numPerPage){";
		pageBar += "location.href='"+url+"?lcPage='+lcPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	public static String mypagewcPageBar(int totalContents, int wcPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		wcPage = wcPage==0?1:wcPage;

		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);

		int pageNo = ((wcPage - 1)/pageBarSize) * pageBarSize +1;

		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_WCpaging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(wcPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_WCpaging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}

		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' >다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_WCpaging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";

		pageBar += "<script>";
		pageBar += "function fn_WCpaging(wcPage,numPerPage){";
		pageBar += "location.href='"+url+"?wcPage='+wcPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	public static String mypageQnAcPageBar(int totalContents, int qnaPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5;
		qnaPage = qnaPage==0?1:qnaPage;

		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);

		int pageNo = ((qnaPage - 1)/pageBarSize) * pageBarSize +1;

		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_QnApaging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(qnaPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_QnApaging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}

		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_QnApaging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";

		pageBar += "<script>";
		pageBar += "function fn_QnApaging(qnaPage,numPerPage){";
		pageBar += "location.href='"+url+"?qnaPage='+qnaPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	public String convertClobToString(Clob clob) {
		Reader reader = null;
		StringBuilder sb = null;

		try {
			reader = clob.getCharacterStream();
			int c = -1;
			sb = new StringBuilder();

			while ((c = reader.read()) != -1) {
				sb.append(((char) c));
			}
		} catch (IOException | SQLException e1) {
			e1.printStackTrace();
		} finally {
			try {
				if (reader != null) reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
}
