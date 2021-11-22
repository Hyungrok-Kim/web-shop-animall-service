package com.kh.animall.users.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.order.model.vo.Order;
import com.kh.animall.users.order.model.vo.OrderDetail;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int orderInfo(Order order) {
		return sqlSession.insert("orderMapper.orderInfo", order);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int orderDetail(OrderDetail orderDetail) {
		return sqlSession.insert("orderMapper.orderDetail", orderDetail);
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Order> selectOrderList(int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("orderMapper.selectOrderList", mno);
	}

}
