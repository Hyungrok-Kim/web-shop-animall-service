package com.kh.animall.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.animall.admin.model.service.AdminService;
import com.kh.animall.admin.model.vo.MemberBoard;
import com.kh.animall.admin.model.vo.Notice;
import com.kh.animall.common.util.Utils;

@Controller
public class AdminPageController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/adminPage.do")
	public void adminPage() {}
	
	@RequestMapping("/admin/member/memberAdmin.do")
	public String memberAdmin(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
				int numPerPage = 10; 
				
				List<Map<String, String>> memberList = adminService.selectMemberList(cPage, numPerPage);
				
				// 2. 전체 게시글 수 (페이지 처리를 위함)
				int totalContents = adminService.selectMemberTotalContents();
				
				// 3. 페이지 계산된 HTML 구하기
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberAdmin.do");
				
				System.out.println("memberList"+memberList);
				model.addAttribute("memberList",memberList);
				model.addAttribute("totalContents", totalContents);
				model.addAttribute("numPerPage", numPerPage);
				model.addAttribute("pageBar", pageBar);
				
				return "admin/member/memberAdmin";
	}
	
	@RequestMapping("/admin/stylist/stylistAdmin.do")
	public String stylistAdmin(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
				int numPerPage = 10; 
				
				List<Map<String, String>> stylistList = adminService.selectStylistList(cPage, numPerPage);
				
				// 2. 전체 게시글 수 (페이지 처리를 위함)
				int totalContents = adminService.selectStylistTotalContents();
				
				// 3. 페이지 계산된 HTML 구하기
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "stylistAdmin.do");
				
				System.out.println("stylistList"+stylistList);
				model.addAttribute("stylistList",stylistList);
				model.addAttribute("totalContents", totalContents);
				model.addAttribute("numPerPage", numPerPage);
				model.addAttribute("pageBar", pageBar);
				
				return "admin/stylist/stylistAdmin";
	}
	
	@RequestMapping("/admin/inquiry/inquiryAdmin.do")
	public void inquiryAdmin() {}
	
	@RequestMapping("/admin/admit/admitAdmin.do")
	public void admitAdmin() {}
	
	@RequestMapping("/admin/notice/noticeAdmin.do")
	public String noticeAdmin(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; 
		
		List<Map<String, String>> noticeList = adminService.selectNoticeList(cPage, numPerPage);
		
		System.out.println("noticeList : " + noticeList );
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = adminService.noticeTotalContents(); 
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberAdmin.do");
		
		System.out.println("noticeList"+noticeList);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/notice/noticeAdmin";
			
		}
	
	@RequestMapping("/admin/memberDelete.do")
	public String memberDelete(
			@RequestParam(value="mno",required=true) List<Integer> mno) {
		
		
		for(int num : mno) {
			
			adminService.memberDelete(num);
			
		}
		
		return "redirect:/admin/member/memberAdmin.do";
	}
	
	
	@RequestMapping("/admin/memberWarn.do")
	public void memberWarnY(@RequestParam int mno, int val) {
		System.out.println(mno);
		System.out.println(val);
		if(val == 1) {
		adminService.memberWarnY(mno);
		}
		else if(val == 2) {
		adminService.memberWarnN(mno);	
		}
	}
	
	@RequestMapping("/admin/stylistDelete.do")
	public String stylistDelete(
			@RequestParam(value="styno",required=true) List<Integer> mno) {
		
		
		for(int num : mno) {
			
			adminService.stylistDelete(num);
			
		}
		
		return "redirect:/admin/stylist/stylistAdmin.do";
	}
	
	@RequestMapping("/admin/memberSearch.do")
	public ModelAndView memberSearch(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam String searchOption, 
			@RequestParam String keyword, Model model) {
		
		int numPerPage = 10; 
		
		int totalContents = adminService.searchMemberTotalContents(searchOption, keyword);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberAdmin.do");
		
		List<MemberBoard> list = adminService.memberSearch(searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		model.addAttribute("pageBar", pageBar);
		map.put("numPerPage", numPerPage);
		map.put("totalContents", totalContents);
		map.put("list",list);
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		mav.addObject("map", map);
		mav.setViewName("admin/member/memberAdmin");
		
		return mav;
	}
	
	
	@RequestMapping("/admin/member/adminMember.do")
	public String adminMember(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; 
		
		List<Map<String, String>> memberList = adminService.selectMemberList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = adminService.selectMemberTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberAdmin.do");
		
		System.out.println("memberList"+memberList);
		model.addAttribute("memberList",memberList);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/member/adminMember";
			
		}
	
	@RequestMapping("/admin/notice/noticeWrite.do")
	public String noticeWrite(Notice notice) {
		
		System.out.println(notice);
		
		adminService.noticeWrite(notice);
		
		return "redirect:/admin/notice/noticeAdmin.do";
	}
	
	
	
}
	
