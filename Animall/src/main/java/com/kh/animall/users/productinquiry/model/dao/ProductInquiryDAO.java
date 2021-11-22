package com.kh.animall.users.productinquiry.model.dao;

import com.kh.animall.users.productinquiry.model.vo.ProductInquiry;

public interface ProductInquiryDAO {

	int insertProductInquiry(ProductInquiry pi);

	int deleteProductInquiry(int pinqno);

	ProductInquiry selectProductInquiry(int pinqno);

	int insertAnswerInquiry(ProductInquiry pi);

}
