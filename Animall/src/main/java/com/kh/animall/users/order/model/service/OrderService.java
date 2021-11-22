package com.kh.animall.users.order.model.service;

import java.util.List;

import com.kh.animall.users.order.model.vo.Order;
import com.kh.animall.users.order.model.vo.OrderDetail;

public interface OrderService {

	List<Order> selectOrderList(int mno);
	public int orderInfo(Order order) throws Exception;
    public int orderDetail(OrderDetail orderDetail) throws Exception;
    int deleteCartAll(int mno); //장바구니 일괄 삭제(비우기)
}
