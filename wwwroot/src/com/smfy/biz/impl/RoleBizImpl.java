package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.RoleBiz;
import com.smfy.dao.impl.RoleDaoImpl;
import com.smfy.entity.Role;

public class RoleBizImpl implements RoleBiz {

	@Override
	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		return new RoleDaoImpl().findAllRole();
	}

	@Override
	public int deleRole(int id) {
		// TODO Auto-generated method stub
		return new RoleDaoImpl().deleRole(id);
	}

	/*@Override
	public List<Role> findAllRoless() {
		// TODO Auto-generated method stub
		return new RoleDaoImpl().findAllRoless();
	}*/


}
