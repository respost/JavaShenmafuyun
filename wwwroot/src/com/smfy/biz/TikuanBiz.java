package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Tikuan;

public interface TikuanBiz {

	/**
	 * 查找所有提款
	 * @param tj
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<Tikuan> findAllTikuan(String tj,int pageIndex,int pageSize);
	/**
	 * 查询数据总数
	 * @param tj 条件
	 * @return
	 */
	int findAllCount(String tj);
	/**
	 * 删除提款订单
	 * @param tikuan
	 * @return
	 */
	int delTikuan(Tikuan tikuan);
}
