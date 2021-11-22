package com.kh.animall.users.stylist.model.dao;

import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.stylist.model.vo.MyStylist;

public interface StylistDAO {

	public MyStylist selectOneStylist(int mno);
	public int insertStylist(MyStylist mystylist);
	public int updateStylist(MyStylist mystylist);
	public int deleteStylist(MyStylist mystylist);
	public int updateMemberType(int mno);
	public int updatePremium(int mno);
	public Member selectOneMember(String styname);
}
