package com.kh.animall.users.productreview.model.service;

import com.kh.animall.users.productreview.model.vo.ProductReview;
import com.kh.animall.users.productreview.model.vo.ProductReviewImage;

public interface ProductReviewService {

	int insertProductReview(ProductReview preview, ProductReviewImage pri);

	ProductReview selectProductReview(int rno);

	int deleteProductReview(int rno);

	int deleteProductReviewImage(int primgno);

	ProductReviewImage selectProductReviewImage(int primgno);

}
