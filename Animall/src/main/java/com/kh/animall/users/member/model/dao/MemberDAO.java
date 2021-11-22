package com.kh.animall.users.member.model.dao;

import java.util.HashMap;

import com.kh.animall.users.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(Member member);

	Member selectOneMember(String id);

	int updateMember(Member member);

	int deleteMember(int mno);
	
	// 아이디 중복 검사
	int idCheck(String id);

	// 아이디 찾기
	String find_id(String email);
		
	// 비밀번호 변경
	public int update_pw(Member member) throws Exception;
}
