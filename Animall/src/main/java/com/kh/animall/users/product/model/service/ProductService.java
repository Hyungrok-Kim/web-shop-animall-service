package com.kh.animall.users.product.model.service;

import java.util.List;

import com.kh.animall.users.product.model.vo.Product;
import com.kh.animall.users.product.model.vo.ProductImage;
import com.kh.animall.users.product.model.vo.ProductListView;
import com.kh.animall.users.product.model.vo.ProductReviewView;
import com.kh.animall.users.product.model.vo.ProductSearch;
import com.kh.animall.users.productinquiry.model.vo.ProductInquiryList;

public interface ProductService {

	List<ProductListView> selectProductList(String ptype);

	int insertProduct(Product product, List<ProductImage> imageList);

	Product selectOneProduct(int pno);

	List<ProductImage> selectProductImageList(int pno);

	int deleteProduct(int pno);

	int deleteProductImage(int pno);

	int updateProduct(Product originProduct);

	List<ProductReviewView> selectProductReviewList(int pno);

	int selectRating1(int pno);

	int selectRating2(int pno);

	int selectRating3(int pno);
	
	int selectRating4(int pno);
	
	int selectRating5(int pno);

	List<ProductInquiryList> selectProductInquiryList(int pno);

	List<ProductListView> searchProductList(ProductSearch ps);


}
