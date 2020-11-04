package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.AdminBiz;
import com.smfy.dao.impl.AdminDaoImpl;
import com.smfy.entity.Admin;

public class AdminBizImpl implements AdminBiz {

	@Override
	public Admin adminLogin(Admin admin) {
		// TODO Auto-generated method stub
		return new AdminDaoImpl().adminLogin(admin);
	}

	@Override
	public List<Admin> findAlladmin(String tj) {
		// TODO Auto-generated method stub
		return new AdminDaoImpl().findAlladmin(tj);
	}

	@Override
	public int addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return new AdminDaoImpl().addAdmin(admin);
	}

	@Override
	public int delAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return new AdminDaoImpl().delAdmin(admin);
	}

	@Override
	public int UpdateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return new AdminDaoImpl().UpdateAdmin(admin);
	}

	@Override
	public int updateAdminStatus(Admin admin) {
		// TODO Auto-generated method stub
		return new AdminDaoImpl().updateAdminStatus(admin);
	}


}
