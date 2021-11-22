package com.kh.animall.users.productinquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.productinquiry.model.vo.ProductInquiry;

@Repository
public class ProductInquiryDAOImpl implements ProductInquiryDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertProductInquiry(ProductInquiry pi) {
		return sqlSession.insert("productInquiryMapper.insertProductInquiry", pi);
	}

	@Override
	public int deleteProductInquiry(int pinqno) {
		return sqlSession.delete("productInquiryMapper.deleteProductInquiry", pinqno);
	}

	@Override
	public ProductInquiry selectProductInquiry(int pinqno) {
		return sqlSession.selectOne("productInquiryMapper.selectProductInquiry", pinqno);
	}

	@Override
	public int insertAnswerInquiry(ProductInquiry pi) {
		return sqlSession.update("productInquiryMapper.insertAnswerInquiry", pi);
	}

}
