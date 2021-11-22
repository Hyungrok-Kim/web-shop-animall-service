package com.kh.animall.users.stylist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.stylist.model.dao.StylistDAO;
import com.kh.animall.users.stylist.model.vo.MyStylist;

@Service
public class StylistServiceImpl implements StylistService {

	@Autowired
	StylistDAO stylistDAO;
	
	@Override
	public MyStylist selectOneStylist(int mno) {
		
		return stylistDAO.selectOneStylist(mno);
	}

	@Override
	public int insertStylist(MyStylist mystylist) {
		
		return stylistDAO.insertStylist(mystylist);
	}

	@Override
	public int updateStylist(MyStylist mystylist) {
		
		return stylistDAO.updateStylist(mystylist);
	}

	@Override
	public int deleteStylist(MyStylist mystylist) {
		
		return stylistDAO.deleteStylist(mystylist);
	}

	@Override
	public int updateMemberType(int mno) {
		return stylistDAO.updateMemberType(mno);
	}

	@Override
	public int updatePremium(int mno) {
		// TODO Auto-generated method stub
		return stylistDAO.updatePremium(mno);
	}

	@Override
	public Member selectOneMember(String styname) {
		return stylistDAO.selectOneMember(styname);
	}

	

}
