package com.kh.animall.common.exception;

public class ProductException extends RuntimeException {
	
	public ProductException() {};
	
	public ProductException(String msg) {
		super("게시글 에러 : " + msg);
	}

}
