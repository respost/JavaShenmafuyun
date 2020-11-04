package com.smfy.biz;

import java.util.List;

import com.smfy.entity.User;

public interface UserBiz {
	/**
	 * 会员登录
	 * @param user 会员对象
	 * @return
	 */
	User userLogin(User user); 
	/**
	 * 使用手机动态登录
	 * @param phone 手机号码
	 * @return
	 */
	User phoneLogin(String phone);
	/**
	 * 检测用户名是否存在
	 * @param name 用户名
	 * @return
	 */
	User checkUserName(String name);
	/**
	 * 修改状态（在线，离线，启用，停用）
	 * @param user
	 * @return
	 */
	int updateUserStatus(User user);
	/**
	 * 查询用户
	 * @param tj 条件
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<User> findAllUser(String tj,int pageIndex,int pageSize);
	/**
	 * 查询用户数量
	 * @param tj 条件
	 * @return
	 */
	int findAllUserCount(String tj);
	/**
	 * 删除会员
	 * @param id根据ID
	 * @return
	 */
	int deleteUser(int id);		
	/**
	 * 会员注册
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * 修改会员
	 * @param user
	 * @return
	 */
	int updateUser(User user);
	/**
	 * 查询会员
	 * @param tj 条件
	 * @return
	 */
	User findUser(String tj);
	/**
	 * 绑定银行卡
	 * @param user
	 * @return
	 */
	int bindBank(User user);
	/**
	 * 修改用户密码
	 * @param user
	 * @return
	 */
	int updatePwd(User user);
	/**
	 * 修改会员头像
	 * @param user
	 * @return
	 */
	int updateHeadPic(User user);
}
