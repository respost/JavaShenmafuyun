package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Cunkuan;

public interface CunkuanBiz {

	/**
	 * 查询所有存款
	 * @param tj
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<Cunkuan>findAllCunkuan(String tj,int pageIndex,int pageSize);	
	/**
	 * 查询数据总数
	 * @param tj 条件
	 * @return
	 */
	int findAllCount(String tj);
	/**
	 * 删除存款订单
	 * @param cunkuan
	 * @return
	 */
	int delCunkuan(Cunkuan cunkuan);
}
