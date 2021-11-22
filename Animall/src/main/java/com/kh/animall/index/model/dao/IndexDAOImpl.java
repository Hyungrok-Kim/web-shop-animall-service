package com.kh.animall.index.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.index.model.vo.IndexProduct;
import com.kh.animall.index.model.vo.ProductImages;

@Repository
public class IndexDAOImpl implements IndexDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<IndexProduct> selectProductList() {
		
		return sqlSession.selectList("indexMapper.selectProductList");
	}
	
	@Override
	public List<IndexProduct> recSelectProductList() {
		
		return sqlSession.selectList("indexMapper.recSelectProductList");
	}

	@Override
	public List<IndexProduct> eventSelectProductList() {
		
		return sqlSession.selectList("indexMapper.eventSelectProductList");
	}

	@Override
	public List<IndexProduct> instaSelectProductList() {
		
		return sqlSession.selectList("indexMapper.instaSelectProductList");
	}
	

	@Override
	public int insertProduct(IndexProduct indexProduct) {
		return sqlSession.insert("indexMapper.insertProduct", indexProduct);
		
	}

	@Override
	public int insertProductImg(ProductImages productImages) {
		return sqlSession.insert("indexMapper.insertProductImg", productImages);
		
	}

	@Override
	public List<ProductImages> selectProductImagesList(int pno) {
		
		return sqlSession.selectList("indexMapper.selectProductImageList", pno);
	}

	@Override
	public int deleteProduct(int pno) {
		
		return sqlSession.delete("indexMapper.deleteProduct", pno);
	}

	@Override
	public Map<String, Object> productUpdateList(int pno) {
		
		return sqlSession.selectOne("indexMapper.productUpdateList", pno);
	}

	@Override
	public IndexProduct productUpdate(int pno) {
		
		return sqlSession.selectOne("indexMapper.productList", pno);
	}

	@Override
	public ProductImages productImagesList(int pno) {
		
		return sqlSession.selectOne("indexMapper.productImagesList", pno);
	}

	@Override
	public int productUpdateEnd(IndexProduct ip) {
		
		return sqlSession.update("indexMapper.productUpdateEnd", ip);
	}

	@Override
	public int productImagesUpdateEnd(ProductImages pi) {
		
		return sqlSession.update("indexMapper.productImagesUpdateEnd", pi);
	}

	
	



}
