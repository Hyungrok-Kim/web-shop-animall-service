package com.kh.animall.users.cart.model.dao;

import java.util.List;

import com.kh.animall.users.cart.model.vo.Cart;
import com.kh.animall.users.member.model.vo.Member;

public interface CartDAO {
	
	List<Cart> selectCartList(int mno); //장바구니 목록
	
	int insertCart(Cart cart); //장바구니 추가
	
    int deleteCart(int cno); //장바구니 개별 삭제
    
    int deleteCartAll(int mno); //장바구니 일괄 삭제(비우기)
    
    int updateCart(Cart cart); //장바구니 수정(있는 상품 +1)
    
    int sumMoney(int mno); //장바구니 금액 합계
    
    int countCart(int mno, int pno); //장바구니 상품 개수
  
    int modifyCart(Cart cart); //장바구니 수정(수량 변경)


}
