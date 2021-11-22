package com.kh.animall.users.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.animall.users.product.model.service.ProductService;
import com.kh.animall.users.product.model.vo.Product;
import com.kh.animall.users.product.model.vo.ProductImage;
import com.kh.animall.users.product.model.vo.ProductListView;
import com.kh.animall.users.product.model.vo.ProductReviewView;
import com.kh.animall.users.product.model.vo.ProductSearch;
import com.kh.animall.users.productinquiry.model.vo.ProductInquiryList;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/productMoreList.do")
	@ResponseBody
	public void selectProductMoreList(@RequestParam String ptype,
									  @RequestParam String keyword,
									  Model model,
									HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8"); 
		
		List<ProductListView> plist = new ArrayList<>();
		
		//plist = productService.selectProductList(ptype);
		
		if(keyword != null) {
			ProductSearch ps = new ProductSearch();
			
			ps.setPtype(ptype);
			ps.setKeyword(keyword);
			
			plist = productService.searchProductList(ps);
			
		}else {
			
			plist = productService.selectProductList(ptype);
			
		}
		
		
		System.out.println("keyword 보고 싶다 : " + keyword);
		
		System.out.println("json plist를 보고싶다 :" + plist);
		
		JSONArray jsonplist = new JSONArray();
		
		for(ProductListView plv : plist) {
			JSONObject jsonplv = new JSONObject();
			
			jsonplv.put("pno", plv.getPno());
			jsonplv.put("pname", plv.getPname());
			jsonplv.put("pprice", plv.getPprice());
			jsonplv.put("pcontent", plv.getPcontent());
			jsonplv.put("changename", plv.getChangename());
			
			jsonplist.add(jsonplv);
			
		}
		
		System.out.println("jsonplist :" + jsonplist);
		
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonplist.toJSONString());

	}
	
	@RequestMapping("/product/productList.do")
	public String selectProductList(@RequestParam String ptype, Model model) {
	
		List<ProductListView> plist = new ArrayList<>();
		
		plist = productService.selectProductList(ptype);
		
		System.out.println("plist : " + plist);
		
		model.addAttribute("plist", plist);
		model.addAttribute("ptype", ptype);
		
		return "users/product/productList";
	}
	
	@RequestMapping("/product/productSearch.do")
	public String productSearch(@RequestParam String ptype, 
								@RequestParam String keyword,
								Model model) {
		
		List<ProductListView> plist = new ArrayList<>();
		
		System.out.println("ptype : " + ptype);
		System.out.println("keyword :" + keyword);
		
		ProductSearch ps = new ProductSearch();
		
		ps.setPtype(ptype);
		ps.setKeyword(keyword);
		
		plist = productService.searchProductList(ps);
		
		model.addAttribute("plist", plist);
		model.addAttribute("ptype", ptype);
		model.addAttribute("keyword", keyword);
		
		return "users/product/productList";
	}
	
	@RequestMapping("/product/productInsertForm.do")
	public String productInsertForm(@RequestParam String ptype, Model model) {
		System.out.println("ptype:" + ptype);
		model.addAttribute("ptype", ptype);
		return "users/product/productInsertForm";
	}
	
	
	@RequestMapping("/product/productFormEnd.do")
	public String insertProduct(Product product , Model model, HttpServletRequest req,
								@RequestParam(value="pimage", required=false) MultipartFile[] upFiles) {
		
		System.out.println("product-테스트 :" + product);
		System.out.println("ptype:" + product.getPtype());
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/productUpFiles");
		
		String imgpath = saveDirectory + "/";
		
		List<ProductImage> imageList = new ArrayList<ProductImage>();
		
		for(MultipartFile f : upFiles) {
			
			if(f.isEmpty() != true) {
				
				String originName = f.getOriginalFilename();
				
				//확장자 추출
				String afterdot = originName.substring(originName.lastIndexOf(".") + 1);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd = (int)(Math.random()*100);
				
				String changeName =
						sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + afterdot;
				
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				ProductImage pi = new ProductImage();
				pi.setOriginname(originName);
				pi.setChangename(changeName);
				pi.setImgpath(imgpath);
			
				
				imageList.add(pi);
				
				
			}
			
		}
		
		int result = productService.insertProduct(product, imageList);
		
		System.out.println("result" + result);
		
		String loc = "/product/productList.do?ptype="+product.getPtype();
		String msg = "";
		
		if(result > 0) {
			msg = "상품 등록 완료";
		}
		else {
			msg = "상품 등록 실패";
		}
		
		model.addAttribute("loc",loc);
		model.addAttribute("msg",msg);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/product/productSelectOne.do")
	public String productSelectOne(@RequestParam int pno, Model model) {
		
		Product product = productService.selectOneProduct(pno);
		
		System.out.println("selectOne에서의 product :" + product);
		
		List<ProductImage> imageList = productService.selectProductImageList(pno);
		
		List<ProductReviewView> prv = productService.selectProductReviewList(pno); 
		
		List<ProductInquiryList> piList = productService.selectProductInquiryList(pno);
		
		System.out.println("productReviewList입니다 :" + prv);
		
		System.out.println("imageList에서의 imageList : " + imageList);
		
		System.out.println("productInquiryList입니다. :" + piList);
		
		int rating1 = productService.selectRating1(pno);
		int rating2 = productService.selectRating2(pno);
		int rating3 = productService.selectRating3(pno);
		int rating4 = productService.selectRating4(pno);
		int rating5 = productService.selectRating5(pno);
		
		model.addAttribute("product", product);
		model.addAttribute("imageList", imageList);
		model.addAttribute("prv", prv);
		model.addAttribute("rating1", rating1);
		model.addAttribute("rating2", rating2);
		model.addAttribute("rating3", rating3);
		model.addAttribute("rating4", rating4);
		model.addAttribute("rating5", rating5);
		model.addAttribute("piList", piList);
		
		return "/users/product/productDetail";
	}
	
	@RequestMapping("/product/productGoUpdate.do")
	public String productGoUpdate(@RequestParam int pno, Model model) {
		Product product = productService.selectOneProduct(pno);
		System.out.println("productUpdate에서의 product : " + product);
		
		List<ProductImage> imageList = productService.selectProductImageList(pno);
		System.out.println("productUpdate에서의 imageList : " + imageList );
		
		
		model.addAttribute("product", product);
		model.addAttribute("imageList", imageList);
		return "users/product/productGoUpdate";
		
	}
	
	@RequestMapping("/product/productEndUpdate.do")
	public String productEndUpdate(Product product, Model model) {
		
		int pno = product.getPno();
		System.out.println("pno:"+pno);
		
		Product originProduct = productService.selectOneProduct(pno);
		System.out.println("originProduct : " + originProduct);
		
		originProduct.setPname(product.getPname());
		originProduct.setPcontent(product.getPcontent());
		originProduct.setPprice(product.getPprice());
		originProduct.setPguide(product.getPguide());
	
		int result = productService.updateProduct(originProduct);
		
		String loc = "/product/productSelectOne.do?pno="+pno;
		String msg = "";
		
		if(result > 0) {
			msg = "상품 수정 성공";
		}
		else {
			msg = "상품 수정 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	
	@RequestMapping("/product/productDelete.do")
	public String productDelete(
								@RequestParam String ptype,
								@RequestParam int pno, 
								HttpServletRequest req,
								Model model) {

		System.out.println("RequestParam으로 받은 ptype :" + ptype);
		
		String saveDir = req.getServletContext().getRealPath("/resources/productUpFiles");
		
		List<ProductImage> deleteList = productService.selectProductImageList(pno);
		
		System.out.println("Delete에서의 imageList : " + deleteList);
		
		int result2 = productService.deleteProductImage(pno);
		int result1 = productService.deleteProduct(pno);

		
		String loc = "/product/productList.do?ptype="+ptype;
		String msg = "";
		
		if(result1 > 0 && result2 > 0) {
			msg = "제품 삭제 완료";
			
			for(ProductImage pi : deleteList) {
				new File(saveDir + "/" + pi.getChangename()).delete();
			}
		}
		else {
			msg = "제품 삭제 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg",msg);
		
		return "common/msg";
		
	}
	
	

}
