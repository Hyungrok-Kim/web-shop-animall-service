package com.kh.animall.users.productinquiry.model.service;

import com.kh.animall.users.productinquiry.model.vo.ProductInquiry;

public interface ProductInquiryService {

	int insertProductInquiry(ProductInquiry pi);

	int deleteProductInquiry(int pinqno);

	ProductInquiry selectProductInquiry(int pinqno);

	int insertAnswerInquiry(ProductInquiry pi);

}
