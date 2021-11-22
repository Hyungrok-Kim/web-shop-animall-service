package com.kh.animall.users.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.animall.users.cart.model.dao.CartDAO;
import com.kh.animall.users.cart.model.vo.Cart;
import com.kh.animall.users.member.model.vo.Member;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	@Override
	public List<Cart> selectCartList(int mno) {
		
		return cartDAO.selectCartList(mno);
	}

	@Override
	public int insertCart(Cart cart) {
		return cartDAO.insertCart(cart);
		 
		
	}

	@Override
	public int deleteCart(int cno) {
		return cartDAO.deleteCart(cno);
		
	}

	@Override
	public int deleteCartAll(int mno) {
		return cartDAO.deleteCartAll(mno);
		
	}

	@Override
	public int updateCart(Cart cart) {
		return cartDAO.updateCart(cart);
		
	}

	@Override
	public int sumMoney(int mno) {
		
		return cartDAO.sumMoney(mno);
	}

	@Override
	public int countCart(int mno, int pno) {
		// TODO Auto-generated method stub
		return cartDAO.countCart(mno, pno);
	}


	@Override
	public int modifyCart(Cart cart) {
		return cartDAO.modifyCart(cart);
		
	}

}
