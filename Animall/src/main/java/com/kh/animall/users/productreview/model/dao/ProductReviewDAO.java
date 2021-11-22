package com.kh.animall.users.productreview.model.dao;

import com.kh.animall.users.productreview.model.vo.ProductReview;
import com.kh.animall.users.productreview.model.vo.ProductReviewImage;

public interface ProductReviewDAO {

	int insertProductReview(ProductReview preview);

	int insertProductReviewImage(ProductReviewImage pri);

	ProductReview selectProductReview(int rno);

	int deleteProductReview(int rno);

	int deleteProductReviewImage(int primgno);

	ProductReviewImage selectProductReviewImage(int primgno);

}
