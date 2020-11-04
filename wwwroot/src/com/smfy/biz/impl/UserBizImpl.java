package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.UserBiz;
import com.smfy.dao.impl.UserDaoImpl;
import com.smfy.entity.User;

public class UserBizImpl implements UserBiz {

	@Override
	public User userLogin(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().userLogin(user);
	}


	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().deleteUser(id);
	}


	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().addUser(user);
	}

	@Override
	public List<User> findAllUser(String tj, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().findAllUser(tj, pageIndex, pageSize);
	}

	@Override
	public int findAllUserCount(String tj) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().findAllUserCount(tj);
	}

	@Override
	public int updateUserStatus(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().updateUserStatus(user);
	}


	@Override
	public User checkUserName(String name) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().checkUserName(name);
	}


	@Override
	public User phoneLogin(String phone) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().phoneLogin(phone);
	}


	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().updateUser(user);
	}


	@Override
	public User findUser(String tj) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().findUser(tj);
	}


	@Override
	public int bindBank(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().bindBank(user);
	}


	@Override
	public int updatePwd(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().updatePwd(user);
	}


	@Override
	public int updateHeadPic(User user) {
		// TODO Auto-generated method stub
		return new UserDaoImpl().updateHeadPic(user);
	}

}
