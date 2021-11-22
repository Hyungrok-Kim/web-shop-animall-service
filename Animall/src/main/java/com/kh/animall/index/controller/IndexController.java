package com.kh.animall.index.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.index.model.service.IndexService;
import com.kh.animall.index.model.vo.IndexProduct;
import com.kh.animall.index.model.vo.ProductImages;

@Controller
public class IndexController {

	@Autowired
	IndexService indexService;

	@RequestMapping({ "/", "/index/Load.do" })
//	@Get, PostMapping 으로 받는게 불가하다.
//	Welcome file에 .jsp를 붙이면 DispatcherServlet를 거치지 않는 반면
//	.do를 붙이면 DispatcherServlet을 거쳐 "/"로 보내주기에
//	처음에 있던 HomeController에서 /를 가져와 매핑한 것.
	public String selectProductList(Model model) {

		List<IndexProduct> productList = indexService.selectProductList();
		System.out.println("productList" + productList);
		model.addAttribute("productList", productList);

		List<IndexProduct> recProductList = indexService.recSelectProductList();
		System.out.println("recProductList" + recProductList);
		model.addAttribute("recProductList", recProductList);

		List<IndexProduct> eventProductList = indexService.eventSelectProductList();
		System.out.println("eventProductList" + eventProductList);
		model.addAttribute("eventProductList", eventProductList);

		List<IndexProduct> instaProductList = indexService.instaSelectProductList();
		System.out.println("instaProductList" + instaProductList);
		model.addAttribute("instaProductList", instaProductList);

		return "index";
	}

	// indexProduct로 가격, 제품명을 받아오고
	// MulitipartFile로 파일을 받아옴
	@RequestMapping("/index/ProductInsert.do")
	public String insertProduct(IndexProduct indexProduct, Model model, HttpServletRequest req,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles) {

		int result = indexService.insertProduct(indexProduct, upFiles, req);

		String loc = "/index/Load.do";
		String msg = "";
		if (result > 0) {
			msg = "상품 등록 성공";
		} else {
			msg = "상품 등록 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/index/ProductDelete.do")
	public String boardDelete(@RequestParam int pno, HttpServletRequest req, Model model) {

		String saveDir = req.getServletContext().getRealPath("/resources/boardUpload");

		List<ProductImages> delList = indexService.selectProductImagesList(pno);

		for (ProductImages a : delList) {

			new File(saveDir + "/" + a.getChangename()).delete();

		}

		int result = indexService.deleteProduct(pno);

		String loc = "/index/Load.do";
		String msg = "";

		if (result > 0) {
			msg = "게시글 삭제 완료!";
		} else {
			msg = "게시글 삭제 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/index/productUpdateList.do")
	@ResponseBody
	public Map<String, Object> productUpdateList(@RequestParam int pno) {
		System.out.println(pno);
		return indexService.productUpdateList(pno);

	}

	@RequestMapping("/index/ProductUpdate.do")
	public String productUpdate(IndexProduct indexProduct, Model model, HttpServletRequest req,
			@RequestParam(value = "upFile2", required = false, defaultValue = "null") MultipartFile[] upFiles) {

		int pno = indexProduct.getPno();

		System.out.println(indexProduct);
		System.out.println("upFiles : " + upFiles);

		int result = indexService.updateProduct(indexProduct, upFiles, req, pno);

		String loc = "/index/Load.do";
		String msg = "";

		if (result > 0) {
			msg = "게시글 수정 완료!";
		} else {
			msg = "게시글 수정 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

}
