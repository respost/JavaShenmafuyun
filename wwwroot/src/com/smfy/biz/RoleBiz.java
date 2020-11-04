package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Role;

public interface RoleBiz {
	/**
	 * ²éÑ¯
	 * @param role
	 * @return
	 */
	List<Role>findAllRole();
	
	/**
	 * É¾³ý
	 * @param 
	 * @return
	 */
	int deleRole(int id);
	


}
