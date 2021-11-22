package com.kh.animall.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.animall.admin.model.dao.AdminDAO;
import com.kh.animall.admin.model.vo.MemberBoard;
import com.kh.animall.admin.model.vo.Notice;

@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		
		return adminDAO.selectMemberList(cPage, numPerPage);
	}

	@Override
	public int selectMemberTotalContents() {
		
		return adminDAO.selectMemberTotalContents();
	}

	@Override
	public void memberDelete(int num) {
		
		adminDAO.memberDelete(num);
	}

	@Override
	public void memberWarnY(int mno) {

		adminDAO.memberWarnY(mno);
		
	}

	@Override
	public void memberWarnN(int mno) {
		
		adminDAO.memberWarnN(mno);
		
	}

	@Override
	public List<Map<String, String>> selectStylistList(int cPage, int numPerPage) {
		
		return adminDAO.selectStylistList(cPage, numPerPage);
	}

	@Override
	public int selectStylistTotalContents() {
		
		return adminDAO.selectStylistTotalContents();
	}

	@Override
	public void stylistDelete(int num) {
		
		adminDAO.stylistDelete(num);
	}

	@Override
	public List<MemberBoard> memberSearch(String searchOption, String keyword) {
		
		return adminDAO.memberSearch(searchOption, keyword);
	}

	@Override
	public int searchMemberTotalContents(String searchOption, String keyword) {
		
		return adminDAO.searchMemberTotalContents(searchOption, keyword);
	}

	@Override
	public List<Map<String, String>> adminMemberList(int cPage, int numPerPage) {
		
		return adminDAO.adminMemberList(cPage, numPerPage);
	}

	@Override
	public void noticeWrite(Notice notice) {
		
		adminDAO.noticeWrite(notice);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return adminDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int noticeTotalContents() {
		
		return adminDAO.noticeTotalContents();
	}
	
}
