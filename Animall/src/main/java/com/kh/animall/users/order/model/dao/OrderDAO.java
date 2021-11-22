package com.kh.animall.users.order.model.dao;

import java.util.List;

import com.kh.animall.users.order.model.vo.Order;
import com.kh.animall.users.order.model.vo.OrderDetail;

public interface OrderDAO {

	int orderInfo(Order order);

	int orderDetail(OrderDetail orderDetail);

	List<Order> selectOrderList(int mno);

}
