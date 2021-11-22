package com.kh.animall.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.admin.model.vo.MemberBoard;
import com.kh.animall.admin.model.vo.Notice;

@Repository
public class AdminDAOImpl implements AdminDAO {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMapper.selectMemberList", null, rows);
	}

	@Override
	public int selectMemberTotalContents() {
		
		return sqlSession.selectOne("adminMapper.selectMemberTotalContents");
	}

	@Override
	public void memberDelete(int num) {
		
		sqlSession.delete("adminMapper.memberDelete", num);
	}

	@Override
	public void memberWarnY(int mno) {
		
		sqlSession.delete("adminMapper.memberWarnY", mno);
	}

	@Override
	public void memberWarnN(int mno) {
		
		sqlSession.delete("adminMapper.memberWarnN", mno);
	}

	@Override
	public List<Map<String, String>> selectStylistList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMapper.selectStylistList", null, rows);
	}

	@Override
	public int selectStylistTotalContents() {
		
		return sqlSession.selectOne("adminMapper.selectStylistTotalContents");
	}

	@Override
	public void stylistDelete(int num) {
		
		sqlSession.delete("adminMapper.stylistDelete", num);
	}

	@Override
	public List<MemberBoard> memberSearch(String searchOption, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("adminMapper.memberSearch", map);
	}

	@Override
	public int searchMemberTotalContents(String searchOption, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("adminMapper.searchMemberTotalContents", map);
	}

	@Override
	public List<Map<String, String>> adminMemberList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMapper.adminMemberList", null, rows);
	}

	@Override
	public void noticeWrite(Notice notice) {
		
		sqlSession.insert("adminMapper.noticeWrite", notice);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMapper.selectNoticeList", null, rows);
	}

	@Override
	public int noticeTotalContents() {
		
		return sqlSession.selectOne("adminMapper.noticeTotalContents");
	}
	
}
