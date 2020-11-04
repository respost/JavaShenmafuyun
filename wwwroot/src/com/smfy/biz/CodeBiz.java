package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Code;

public interface CodeBiz {
	/**
	 * 添加源码
	 * @param code 源码对象
	 * @return
	 */
	int AddCode(Code code);
	/**
	 * 修改源码
	 * @param code 源码对象
	 * @return
	 */
	int editCode(Code code);
	/**
	 * 修改源码状态
	 * @param code 源码对象
	 * @return
	 */
	int updateCodeStatus(Code code);
	/**
	 * 删除源码
	 * @param code 源码对象
	 * @return
	 */
	int delCode(Code code);
	/**
	 * 查找源码列表
	 * @param tj 查询条件
	 * @param pageIndex 第几页
	 * @param pageSize 每页显示多少条数据
	 * @return
	 */
	List<Code> findAllCode(String tj,int pageIndex,int pageSize);
	/**
	 * 查找全部源码条数
	 * @return
	 */
	int findAllCodeCount(String tj);
	/**
	 * 条件查找单个源码
	 * @param tj 查询的条件，比如ID、标题关键字
	 * @return
	 */
	Code findCodeInfo(String tj);
}
