package com.smfy.dao;

import java.util.List;

import com.smfy.entity.Role;

public interface RoleDao {
	/**
	 * 查询
	 * @param role
	 * @return
	 */
	List<Role>findAllRole();
	
	/**
	 * 删除
	 * @param 
	 * @return
	 */
	int deleRole(int id);
	
	/**
	 * 查询共有多少数据
	 * @param 
	 * @return
	 */
	/*List<Role>findAllRoless();*/

	
	

}
