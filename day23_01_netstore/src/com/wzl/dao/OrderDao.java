package com.wzl.dao;

import java.util.List;

import com.wzl.domain.Order;

public interface OrderDao {
	/**
	 * 保存订单的基本信息
	 * 还要保存订单关联的订单项信息
	 * @param o
	 */
	void save(Order o);
	/**
	 * 根据订单号查询订单
	 * @param ordernum
	 * @return 订单的基本信息
	 */
	Order findByNum(String ordernum);
	/**
	 * 根据客户ID查询订单，安照日期降序排列
	 * @param customerId
	 * @return
	 */
	List<Order> findByCustomer(String  customerId);
	/**
	 * 
	 * @param order
	 */
	void updateStatus(Order order);

}
