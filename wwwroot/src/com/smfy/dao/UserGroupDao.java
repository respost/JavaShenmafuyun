package com.smfy.dao;

import java.util.List;

import com.smfy.entity.UserGroup;

public interface UserGroupDao {
	/**
	 * 查询
	 * @param UserGroup
	 * @return
	 */
	List<UserGroup>finAllGroup();
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	int deleUserGroup(int id);
	
	/**
	 * 新增分组
	 * @param 
	 * @return
	 */
	int addUserGroup(UserGroup userGroup);
	
	/**
	 * 修改分组
	 * @param 
	 * @return
	 */
	int updateUserGroup(UserGroup userGroup);

}
