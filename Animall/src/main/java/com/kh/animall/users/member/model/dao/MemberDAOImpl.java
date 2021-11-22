package com.kh.animall.users.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.member.model.vo.Member;

import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	@Override
	public Member selectOneMember(String id) {
		
		return sqlSession.selectOne("memberMapper.loginMember", id);
	}

	@Override
	public int updateMember(Member member) {
	      return sqlSession.update("memberMapper.updateMember", member);
	}

    @Override
	public int deleteMember(int mno) {
	      return sqlSession.delete("memberMapper.deleteMember", mno);
	}
	
	@Override
	public int idCheck(String id) {
	
	return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	@Override
	public String find_id(String email) {
		// 
		return sqlSession.selectOne("memberMapper.find_id", email);
	}
		 			
	
	// 비밀번호변경
	@Transactional
	public int update_pw(Member member) throws Exception{
		return sqlSession.update("memberMapper.update_pw", member);
	}

}
