package com.smfy.dao;

import java.util.List;

import com.smfy.entity.Ment;

public interface MentDao {
	/**
	 * 添加评论
	 * @param ment 对象
	 * @return
	 */
	int addMent(Ment ment);
	/**
	 * 删除评论
	 * @param ment 对象
	 * @return
	 */
	int delMent(Ment ment);
	/**
	 * 回复评论
	 * @param ment 对象
	 * @return
	 */
	int reMent(Ment ment);
	/**
	 * 修改评论  stasus=1为审核通过
	 * @param ment 对象
	 * @return
	 */
	int updateMnet(Ment ment);
	/**
	 * 给评论点赞
	 * @param ment 通过评论对象的id
	 * @return
	 */
	int dpMent(Ment ment);
	/**
	 * 根据条件查找相关评论
	 * @param tj 查询条件，比如源码id
	 * @return
	 */
	List<Ment> findAllMent(String tj,int pageIndex, int pageSize);
	/**
	 * 查找全部评论条数
	 * @return
	 */
	int findAllMentCount(String tj);
}
