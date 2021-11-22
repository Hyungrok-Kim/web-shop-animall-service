package com.kh.animall.users.productreview.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.productreview.model.vo.ProductReview;
import com.kh.animall.users.productreview.model.vo.ProductReviewImage;

@Repository
public class ProductReviewDAOImpl implements ProductReviewDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertProductReview(ProductReview pr) {
		return sqlSession.insert("productReviewMapper.insertProductReview", pr);
	}

	@Override
	public int insertProductReviewImage(ProductReviewImage pri) {
		return sqlSession.insert("productReviewMapper.insertReviewImage", pri);
	}

	@Override
	public ProductReview selectProductReview(int rno) {
		return sqlSession.selectOne("productReviewMapper.selectProductReview", rno);
	}

	@Override
	public int deleteProductReview(int rno) {
		return sqlSession.delete("productReviewMapper.deleteProductReview", rno);
	}

	@Override
	public int deleteProductReviewImage(int primgno) {
		return sqlSession.delete("productReviewMapper.deleteProductReviewImage", primgno);
	}

	@Override
	public ProductReviewImage selectProductReviewImage(int primgno) {
		return sqlSession.selectOne("productReviewMapper.selectProductReviewImage", primgno);
	}

}
