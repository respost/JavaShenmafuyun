package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Order;

public interface OrderBiz {
	/**
	 * 查询订单
	 * @param status 查询条件 
	 * @return
	 */
	List<Order> findAllOrder(String status,int pageIndex, int pageSize);
	/**
	 * 查询全部订单条数
	 * @return
	 */
	int findAllOrderCount(String status);
	/**
	 * 删除订单
	 * @param id 根据ID删除
	 * @return
	 */
	int deleteOrder(int id);
	

}
