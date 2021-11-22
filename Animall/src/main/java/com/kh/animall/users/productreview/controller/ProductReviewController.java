package com.kh.animall.users.productreview.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.users.productreview.model.service.ProductReviewService;
import com.kh.animall.users.productreview.model.vo.ProductReview;
import com.kh.animall.users.productreview.model.vo.ProductReviewImage;

@Controller
public class ProductReviewController {
	@Autowired
	
	ProductReviewService prService;
	
	@RequestMapping("/productreview/productReviewInsert.do")
	public String productReviewInsert(ProductReview preview, Model model, HttpServletRequest req,
									 @RequestParam(value="rimage", required=false) MultipartFile upFile) {
		
		Integer rrating = preview.getRrating();
		
		System.out.println("productreview-테스트 : " + preview);
		System.out.println("rrating 타입 확인 : " + rrating.getClass().getName());
		
		ProductReview pr = new ProductReview();
		
		pr.setRno(preview.getRno());
		pr.setPno(preview.getPno());
		pr.setMno(preview.getMno());
		pr.setRrating(rrating);
		pr.setRcontent(preview.getRcontent());
		pr.setPrimgno(preview.getPrimgno());
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/productReviewUpFiles");
		
		String imgpath = saveDirectory + "/";
				
		ProductReviewImage pri = new ProductReviewImage();

		if(upFile.isEmpty() != true) {
			String originName = upFile.getOriginalFilename();
			
			//확장자 추출
			String afterdot = originName.substring(originName.lastIndexOf(".") + 1);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random()*100);
			
			String changeName =
					sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + afterdot;
		
		
			try {
				upFile.transferTo(new File(saveDirectory + "/" + changeName));
			} catch (IllegalStateException | IOException e) {

				e.printStackTrace();
			}
			
			pri.setOriginname(originName);
			pri.setChangename(changeName);
			pri.setImgpath(imgpath);		
		}
		
		int result = prService.insertProductReview(pr, pri);
		
		System.out.println("result" + result);
		
		String loc = "/product/productSelectOne.do?pno="+preview.getPno();
		String msg = "";
		
		if(result > 0) {
			msg = "리뷰 등록";
		}
		else {
			msg = "상품 수정 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/productreview/productReviewDelete.do")
	public String productReviewDelete(@RequestParam int rno,
									  Model model,
									  HttpServletRequest req) {
		
		String saveDir = req.getServletContext().getRealPath("/resources/productReviewUpFiles");
		
		ProductReview pr = prService.selectProductReview(rno);
		
		ProductReviewImage pri = prService.selectProductReviewImage(pr.getPrimgno());
		
		System.out.println("rno는? :" + rno);
		//System.out.println("productReviewSelectOne은? : " + pr);
		System.out.println("pri : " + pri);
		
		int result1 = prService.deleteProductReview(rno);

		int result2 = prService.deleteProductReviewImage(pr.getPrimgno());
		
		
		String loc = "/product/productSelectOne.do?pno="+pr.getPno();
		String msg = "";
		
		if(result1 > 0 && result2 > 0) {
			new File(saveDir + "/" + pri.getChangename()).delete();
			msg="리뷰 삭제 완료";
		}
		else {
			msg = "리뷰 삭제 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
}
