package com.kh.animall.users.cart.model.service;

import java.util.List;

import com.kh.animall.users.cart.model.vo.Cart;
import com.kh.animall.users.member.model.vo.Member;
public interface CartService {
	List<Cart> selectCartList(int mno); //장바구니 목록
	int insertCart(Cart cart); //장바구니 추가
    int deleteCart(int cno); //장바구니 개별 삭제
    int deleteCartAll(int mno); //장바구니 일괄 삭제(비우기)
    int updateCart(Cart cart); //장바구니에 있는 물품 추가할 때 
    int sumMoney(int mno); //장바구니 금액 합계
    int countCart(int mno, int pno); //장바구니 상품 개수
    int modifyCart(Cart cart); //장바구니 화면에서 수량 변경
}
