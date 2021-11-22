package com.kh.animall.index.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.animall.index.model.vo.IndexProduct;
import com.kh.animall.index.model.vo.ProductImages;

public interface IndexDAO {

	List<IndexProduct> selectProductList();

	int insertProduct(IndexProduct indexProduct);

	int insertProductImg(ProductImages productImages);

	List<ProductImages> selectProductImagesList(int pno);

	int deleteProduct(int pno);

	Map<String, Object> productUpdateList(int pno);

	IndexProduct productUpdate(int pno);

	ProductImages productImagesList(int pno);

	int productUpdateEnd(IndexProduct ip);

	int productImagesUpdateEnd(ProductImages pi);

	List<IndexProduct> recSelectProductList();

	List<IndexProduct> eventSelectProductList();

	List<IndexProduct> instaSelectProductList();

	

	
}
