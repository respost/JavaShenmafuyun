package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Huikuan;

public interface HuikuanBiz {

	/**
	 * 查询全部汇款
	 * @param tj
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<Huikuan>findAllHuikuan(String tj,int pageIndex,int pageSize);
	/**
	 * 查询数据总数
	 * @param tj 条件
	 * @return
	 */
	int findAllCount(String tj);
	
	/**
	 * 删除汇款订单
	 * @param huikuan
	 * @return
	 */
	int delHuikuan(Huikuan huikuan);
}
