package com.kh.animall.index.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.index.model.vo.IndexProduct;
import com.kh.animall.index.model.vo.ProductImages;

public interface IndexService {

	List<IndexProduct> selectProductList();

	int insertProduct(IndexProduct indexProduct, MultipartFile[] upFiles, HttpServletRequest req);

	List<ProductImages> selectProductImagesList(int pno);

	int deleteProduct(int pno);

	Map<String, Object> productUpdateList(int pno);

	int updateProduct(IndexProduct indexProduct, MultipartFile[] upFiles, HttpServletRequest req, int pno);

	List<IndexProduct> recSelectProductList();

	List<IndexProduct> eventSelectProductList();

	List<IndexProduct> instaSelectProductList();

}
