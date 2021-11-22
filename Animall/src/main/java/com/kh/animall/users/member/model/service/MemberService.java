package com.kh.animall.users.member.model.service;

import com.kh.animall.users.member.model.vo.Member;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	
	int insertMember(Member member);
	
	Member selectOneMember(String id);
	
	int updateMember(Member member);
			
	int deleteMember(int mno);
		
	int idCheck(String id) throws Exception;
	
	String find_id(HttpServletResponse response, String email) throws Exception;
		
	//비밀번호찾기
	public void find_pw(HttpServletResponse response, Member member) throws Exception;
}
