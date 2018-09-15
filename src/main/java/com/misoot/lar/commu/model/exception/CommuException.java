package com.misoot.lar.commu.model.exception;

public class CommuException extends RuntimeException {
	public CommuException(){
		super();
	}
	public CommuException(String msg){
		super("게시판 기능 에러 발생!"+msg);
	}
}
