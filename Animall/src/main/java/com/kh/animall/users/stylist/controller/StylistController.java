package com.kh.animall.users.stylist.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.order.model.service.OrderService;
import com.kh.animall.users.order.model.vo.Order;
import com.kh.animall.users.stylist.model.service.StylistService;
import com.kh.animall.users.stylist.model.vo.MyStylist;

@Controller
public class StylistController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	StylistService stylistService;
	
	@RequestMapping("stylist/stylistForm.do")
	public String stylistForm() {
		return "users/stylist/StylistForm";
	}
	
	@RequestMapping("stylist/stylistFormEnd.do")
	public String stylistFormEnd(MyStylist mystylist, HttpServletRequest req, Model model, HttpSession session,
			                     @RequestParam(value="certImgFile", required=false) MultipartFile certImg) {
		
		//Member m = stylistService.selectOneMember(stylist.getStyname());
		
		//stylist.setMno(m.getMno());
		
		String saveDirectory
	      = req.getServletContext().getRealPath("/resources/stylistUpload");
		if( certImg.isEmpty() == false ) { 
				// 파일이 비어있지 않다면 --> 첨부파일을 추가했다면 다음을 실행해라
				
				// 2. 파일명 재생성
				String originName = certImg.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				try {
					certImg.transferTo(new File(saveDirectory + "/" + changeName));
					
					mystylist.setCertImg(changeName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
		}
		
		System.out.println("stylist:" + mystylist);

		int result = stylistService.insertStylist(mystylist);
		
		String loc = "/mypage/memberInfo.do";
		String msg = "";
		
		if ( result > 0 ) {
			msg = "미용사 신청 완료!";
			stylistService.updateMemberType(mystylist.getMno());
			Member member = (Member)session.getAttribute("member");
			member.setMtype("STY");
			
			session.setAttribute("member", member);
			
			session.setAttribute("stylist", stylistService.selectOneStylist(member.getMno()));
		} else {
			msg = "미용사 신청 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("stylist/stylistView.do")
	public String stylistView(Model model, HttpSession session) {
		
		List<Order> list = orderService.selectOrder(((Member)session.getAttribute("member")).getMno());
		
		model.addAttribute("list", list);
		model.addAttribute("tabIndex", 2);
		return "/mypage/memberInfo";
	}
	
	@RequestMapping("stylist/premiumUpgrade.do")
	@ResponseBody
	public String stylistPremium(int buyer_no, HttpSession session) {

		int result = stylistService.updatePremium(buyer_no);
		
		session.setAttribute("stylist", stylistService.selectOneStylist(buyer_no));
		
		return "결제 성공!";
	}
	
	@RequestMapping("stylist/stylistUpdateEnd.do")
	public String stylistUpdateEnd(MyStylist stylist, HttpServletRequest req, Model model, HttpSession session,
			                     @RequestParam("certImgFile") MultipartFile certImg) {
		String saveDirectory
	      = req.getServletContext().getRealPath("/resources/stylistUpload");
		if( certImg.isEmpty() == false ) { 
				
				String originName = certImg.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				try {
					certImg.transferTo(new File(saveDirectory + "/" + changeName));
					
					stylist.setCertImg(changeName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
		}

		int result = stylistService.updateStylist(stylist);
		
		String loc = "/mypage/memberInfo.do";
		String msg = "";
		
		if ( result > 0 ) {
			msg = "미용사 변경 완료!";

			session.setAttribute("stylist", stylistService.selectOneStylist(stylist.getMno()));
			
		} else {
			msg = "미용사 변경 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 단순 파일 이름 변경용 메소드 
	public String fileNameChanger(String oldFileName) {
	
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);
	
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}

}
