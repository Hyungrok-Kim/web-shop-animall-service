package com.kh.animall.users.stylist.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.stylist.model.vo.MyStylist;

@Repository
public class StylistDAOImpl implements StylistDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public MyStylist selectOneStylist(int mno) {
		
		return sqlSession.selectOne("stylistMapper.selectOneStylist", mno);
	}

	@Override
	public int insertStylist(MyStylist mystylist) {
		
		return sqlSession.insert("stylistMapper.insertStylist", mystylist);
	}

	@Override
	public int updateStylist(MyStylist mystylist) {
		
		return sqlSession.update("stylistMapper.updateStylist", mystylist);
	}

	@Override
	public int deleteStylist(MyStylist mystylist) {
		
		return sqlSession.update("stylistMapper.deleteStylist", mystylist);
	}

	@Override
	public int updateMemberType(int mno) {
		
		return sqlSession.update("stylistMapper.updateMemberType", mno);
	}

	@Override
	public int updatePremium(int mno) {
		
		return sqlSession.update("stylistMapper.updatePremium", mno);
	}

	@Override
	public Member selectOneMember(String styname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("stylistMapper.selectOneMember", styname);
	}
	
	
	
}
