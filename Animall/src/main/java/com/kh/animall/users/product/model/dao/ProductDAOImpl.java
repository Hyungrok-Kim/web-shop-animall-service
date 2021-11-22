package com.kh.animall.users.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.product.model.vo.Product;
import com.kh.animall.users.product.model.vo.ProductImage;
import com.kh.animall.users.product.model.vo.ProductListView;
import com.kh.animall.users.product.model.vo.ProductReviewView;
import com.kh.animall.users.product.model.vo.ProductSearch;
import com.kh.animall.users.productinquiry.model.vo.ProductInquiryList;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductListView> selectProductList(String ptype) {
		
		return sqlSession.selectList("productMapper.selectProductList", ptype);
	}

	@Override
	public int insertProduct(Product product) {

		return sqlSession.insert("productMapper.insertProduct", product);
	}

	@Override
	public int insertProductImage(ProductImage pi) {
		
		return sqlSession.insert("productMapper.insertProductImage", pi);
	}

	@Override
	public Product selectOneProduct(int pno) {
		return sqlSession.selectOne("productMapper.selectOneProduct", pno);
	}

	@Override
	public List<ProductImage> selectProductImageList(int pno) {
		return sqlSession.selectList("productMapper.selectProductImageList", pno);
	}

	@Override
	public int deleteProduct(int pno) {
		return sqlSession.delete("productMapper.deleteProduct", pno);
	}

	@Override
	public int deleteProductImage(int pno) {
		return sqlSession.delete("productMapper.deleteProductImage", pno);
	}

	@Override
	public int updateProduct(Product originProduct) {
		return sqlSession.update("productMapper.updateProduct", originProduct);
	}

	@Override
	public List<ProductReviewView> selectProductReviewList(int pno) {

		return sqlSession.selectList("productMapper.selectProductReviewList", pno);
	}

	@Override
	public int selectRating1(int pno) {
		return sqlSession.selectOne("productMapper.selectRating1", pno);
	}

	@Override
	public int selectRating2(int pno) {
		return sqlSession.selectOne("productMapper.selectRating2", pno);
	}

	@Override
	public int selectRating3(int pno) {
		return sqlSession.selectOne("productMapper.selectRating3", pno);
	}

	@Override
	public int selectRating4(int pno) {
		return sqlSession.selectOne("productMapper.selectRating4", pno);
	}

	@Override
	public int selectRating5(int pno) {
		return sqlSession.selectOne("productMapper.selectRating5", pno);
	}

	@Override
	public List<ProductInquiryList> selectProductInquiryList(int pno) {
		return sqlSession.selectList("productMapper.selectProductInquiryList", pno);
	}

	@Override
	public List<ProductListView> searchProductList(ProductSearch ps) {
		return sqlSession.selectList("productMapper.searchProductList", ps);
	}



}
