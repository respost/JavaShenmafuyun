package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.OrderBiz;
import com.smfy.dao.impl.OrderDaoImpl;
import com.smfy.entity.Order;

public class OrderBizImpl implements OrderBiz {

	@Override
	public List<Order> findAllOrder(String status,int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		return new OrderDaoImpl().findAllOrder(status,pageIndex, pageSize);
	}

	@Override
	public int deleteOrder(int id) {
		// TODO Auto-generated method stub
		return new OrderDaoImpl().deleteOrder(id);
	}

	@Override
	public int findAllOrderCount(String status) {
		// TODO Auto-generated method stub
		return new OrderDaoImpl().findAllOrderCount(status);
	}



}
