package com.kh.animall.users.productinquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.animall.users.productinquiry.model.service.ProductInquiryService;
import com.kh.animall.users.productinquiry.model.vo.ProductInquiry;

@Controller
public class ProductInquiryController {
	
	@Autowired
	ProductInquiryService piService;
	
	@RequestMapping("/productinquiry/productInquiry.do")
	public String productInquiryInsert(ProductInquiry pi, Model model) {
		
		System.out.println("Inquiry 잘 받아옵니까? : " + pi);
		System.out.println("Inquiry에서 pno 잘 받아옵니까? :" + pi.getPno());
		
		int result = piService.insertProductInquiry(pi);
		
		System.out.println("pi result :" + result);
		
		String loc="/product/productSelectOne.do?pno="+pi.getPno();
		String msg= "";
		
		if(result > 0) {
			msg = "상품 문의 완료";
		}
		else {
			msg = "상품 문의 실패";
		}
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg", msg);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/productinquiry/productInquiryDelete.do")
	public String productInquiryDelete(@RequestParam int pinqno, Model model) {
		
		ProductInquiry pi = piService.selectProductInquiry(pinqno);
		
		int result = piService.deleteProductInquiry(pinqno);
		
		String loc="/product/productSelectOne.do?pno="+pi.getPno();
		String msg = "";
		
		if(result > 0) {
			msg="제품 문의 삭제 완료";
		}
		else {
			msg="제품 문의 삭제 실패";
		}
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg",msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/productinquiry/inquiryAnswerInsert.do")
	public String inquiryAnswerInsert(@RequestParam String inquiryAnswer,
									  @RequestParam int pinqno,
									  Model model) {
		
		System.out.println("inquiryAnswer쪽 pinqno :" + pinqno);
		System.out.println("inquiryAnswer쪽 inquiryAnswer:" + inquiryAnswer);
		
		ProductInquiry pi = piService.selectProductInquiry(pinqno);
		
		System.out.println("inquiryAnswer쪽 pi :" + pi);
		
		pi.setPianswer(inquiryAnswer);
		
		int result = piService.insertAnswerInquiry(pi);
		
		String loc="/product/productSelectOne.do?pno="+pi.getPno();
		String msg="";
		
		if(result > 0) {
			msg="제품 문의 답변 완료";
		}
		else {
			msg="제품 문의 답변 실패";
		}
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg",msg);
		return "common/msg";
	}
}
