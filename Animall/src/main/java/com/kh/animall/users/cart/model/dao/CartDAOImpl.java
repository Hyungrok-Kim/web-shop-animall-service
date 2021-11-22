package com.kh.animall.users.cart.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.cart.model.vo.Cart;
import com.kh.animall.users.member.model.vo.Member;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Cart> selectCartList(int mno) {
		
		return sqlSession.selectList("cartMapper.selectCartList", mno);
	}

	@Override
	public int insertCart(Cart cart) {
		//cart에 저장된 값 받아 sql 세션에 저장하고 mapper의 cart.insert로 이동
	return	sqlSession.insert("cartMapper.insertCart", cart);
	}

	@Override
	public int deleteCart(int cno) {
		return sqlSession.delete("cartMapper.deleteCart", cno);
		
	}

	@Override
	public int deleteCartAll(int mno) {
		return sqlSession.delete("cartMapper.deleteCartAll", mno);
		
	}

	@Override
	public int updateCart(Cart cart) {
		return sqlSession.update("cartMapper.updateCart", cart);
		
		
	}

	@Override
	public int sumMoney(int mno) {
		sqlSession.selectOne("cartMapper.sumMoney", mno);
		return sqlSession.selectOne("cartMapper.sumMoney", mno);
	}

	@Override
	public int countCart(int mno, int pno) {
		Map<String, Object> cntmap = new HashMap<String, Object>();
	 cntmap.put("pno", pno);
	 cntmap.put("mno", mno);
		return sqlSession.selectOne("cartMapper.countCart", cntmap);
	}



	@Override
	public int modifyCart(Cart cart) {
		return sqlSession.update("cartMapper.modifyCart", cart);
		
	}

}
