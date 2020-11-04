package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.UserGroupBiz;
import com.smfy.dao.impl.UserGroupDaoImpl;
import com.smfy.entity.UserGroup;

public class UserGroupBizImpl implements UserGroupBiz {

	@Override
	public List<UserGroup> finAllGroup() {
		// TODO Auto-generated method stub
		return  new UserGroupDaoImpl().finAllGroup();
	}

	@Override
	public int deleUserGroup(int id) {
		// TODO Auto-generated method stub
		return new UserGroupDaoImpl().deleUserGroup(id);
	}

	@Override
	public int addUserGroup(UserGroup userGroup) {
		// TODO Auto-generated method stub
		return new UserGroupDaoImpl().addUserGroup(userGroup);
	}

	@Override
	public int updateUserGroup(UserGroup userGroup) {
		// TODO Auto-generated method stub
		return new UserGroupDaoImpl().updateUserGroup(userGroup);
	}

}
