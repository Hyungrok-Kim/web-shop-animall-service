package com.kh.animall.users.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.animall.users.cart.model.dao.CartDAO;
import com.kh.animall.users.order.model.dao.OrderDAO;
import com.kh.animall.users.order.model.vo.Order;
import com.kh.animall.users.order.model.vo.OrderDetail;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired 
	OrderDAO orderDAO; 
	CartDAO cartDAO;
	@Override
	public List<Order> selectOrderList(int mno) {
		// TODO Auto-generated method stub
		return orderDAO.selectOrderList(mno);
	}

	@Override
	public int orderInfo(Order order) throws Exception {
		
		return orderDAO.orderInfo(order);
		
	}

	@Override
	public int orderDetail(OrderDetail orderDetail) throws Exception {
		return orderDAO.orderDetail(orderDetail);
		
	}
	@Override
	public int deleteCartAll(int mno) {
		return cartDAO.deleteCartAll(mno);
		
	}
}
