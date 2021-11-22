package com.kh.animall.users.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.animall.common.ProductException;
import com.kh.animall.users.product.model.dao.ProductDAO;
import com.kh.animall.users.product.model.vo.Product;
import com.kh.animall.users.product.model.vo.ProductImage;
import com.kh.animall.users.product.model.vo.ProductListView;
import com.kh.animall.users.product.model.vo.ProductReviewView;
import com.kh.animall.users.product.model.vo.ProductSearch;
import com.kh.animall.users.productinquiry.model.vo.ProductInquiryList;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<ProductListView> selectProductList(String ptype) {
		
		return productDAO.selectProductList(ptype);
	}

	@Override
	public int insertProduct(Product product, List<ProductImage> imageList) {
		int result1 = productDAO.insertProduct(product);
		
		System.out.println("서비스에서의 result1 : " + result1);
		
		if(result1 == 0) throw new ProductException();	
		
		
		if(imageList.size() > 0) {
			for(int i = 0; i < imageList.size(); i++) {	
				
				if(i == 0) {
					imageList.get(i).setImglevel(0);
				}
				else {
					imageList.get(i).setImglevel(1);
				}
				
				int result2 = productDAO.insertProductImage(imageList.get(i));
				
				System.out.println("서비스에서의 result2 :" + result2);
				
				if(result2 == 0) throw new ProductException("첨부 파일 없음.");
				
			}
		}
		
		return result1;
	}

	@Override
	public Product selectOneProduct(int pno) {
		return productDAO.selectOneProduct(pno);
	}

	@Override
	public List<ProductImage> selectProductImageList(int pno) {

		return productDAO.selectProductImageList(pno);
	}

	@Override
	public int deleteProduct(int pno) {
		return productDAO.deleteProduct(pno);
	}

	@Override
	public int deleteProductImage(int pno) {
		return productDAO.deleteProductImage(pno);
	}

	@Override
	public int updateProduct(Product originProduct) {
		return productDAO.updateProduct(originProduct);
	}

	@Override
	public List<ProductReviewView> selectProductReviewList(int pno) {
		
		return productDAO.selectProductReviewList(pno);
	}

	@Override
	public int selectRating1(int pno) {
		return productDAO.selectRating1(pno);
	}

	@Override
	public int selectRating2(int pno) {
		
		return productDAO.selectRating2(pno);
	}
	
	@Override
	public int selectRating3(int pno) {
		return productDAO.selectRating3(pno);
	}
	
	@Override
	public int selectRating4(int pno) {
		return productDAO.selectRating4(pno);
	}
	
	@Override
	public int selectRating5(int pno) {
		return productDAO.selectRating5(pno);
	}

	@Override
	public List<ProductInquiryList> selectProductInquiryList(int pno) {
		return productDAO.selectProductInquiryList(pno);
	}

	@Override
	public List<ProductListView> searchProductList(ProductSearch ps) {
		return productDAO.searchProductList(ps);
	}






	
	


}
