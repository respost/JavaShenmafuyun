package com.smfy.biz;

import java.util.List;

import com.smfy.entity.Admin;

public interface AdminBiz {
	/**
	 * 管理登录
	 * @param admin 管理员对象
	 * @return
	 */
	Admin adminLogin(Admin admin);
	
	/**
	 * 查询所有管理员
	 * @return
	 */
	List<Admin> findAlladmin(String tj);
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	int addAdmin(Admin admin);
	
	/**
	 * 删除管理员
	* @param admin
	 * @return
	 */
	int delAdmin(Admin admin);
	
	/**
	 * 修改管理员
	 * @param admin
	 * @return
	 */
	int UpdateAdmin(Admin admin);
	/**
	 * 修改管理员状态（在线，离线，启用，停用）
	 * @param admin
	 * @return
	 */
	int updateAdminStatus(Admin admin);
}
