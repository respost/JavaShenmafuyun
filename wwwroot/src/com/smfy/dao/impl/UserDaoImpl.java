package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.UserDao;
import com.smfy.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public User userLogin(User user) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User item=null;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT * FROM user_list WHERE NAME=? AND PASSWORD=?";
			ps=conn.prepareStatement(sql);
			//设置ps参数
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			//接收结果集
			rs=ps.executeQuery();
			if (rs.next()) {
				item=new User();//创建用户对象
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));
				item.setNick(rs.getString("nick"));
				item.setMoney(rs.getFloat("money"));
				item.setPoints(rs.getInt("points"));
				item.setAvail(rs.getFloat("avail"));
				item.setVipExp(rs.getDate("vipExp"));
				item.setVipRv(rs.getFloat("vipRv"));
				item.setPhone(rs.getString("phone"));
				item.setQq(rs.getString("qq"));
				item.setEmail(rs.getString("email"));
				item.setGroupId(rs.getInt("groupId"));
				item.setRealName(rs.getString("realName"));
				item.setBankName(rs.getString("bankName"));
				item.setBankCard(rs.getString("bankCard"));
				item.setBankAddress(rs.getString("bankAddress"));
				item.setRegDate(rs.getTimestamp("regDate"));
				item.setLoginDate(rs.getDate("loginDate"));
				item.setIp(rs.getString("ip"));
				item.setIslogin(rs.getInt("islogin"));
				item.setStatus(rs.getInt("status"));
				item.setPicPath(rs.getString("picPath"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return item;
	}
	@Override
	public List<User> findAllUser(String tj,int pageIndex,int pageSize) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<User> userList=new ArrayList<User>();
		try {
		conn=getConn();
		String sql="SELECT *,(SELECT `name` FROM user_group WHERE groupId=id ) AS groupName FROM user_list ";
		if(tj!=null){
			sql+=tj;
		}
		sql+=" LIMIT ?,?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, (pageIndex-1)*pageSize);
		ps.setInt(2, pageSize);
		rs=ps.executeQuery();
		while(rs.next()){
			User item=new User();//创建用户对象
			item.setId(rs.getInt("id"));
			item.setName(rs.getString("name"));
			item.setPassword(rs.getString("password"));
			item.setNick(rs.getString("nick"));
			item.setMoney(rs.getFloat("money"));
			item.setPoints(rs.getInt("points"));
			item.setAvail(rs.getFloat("avail"));
			item.setVipExp(rs.getDate("vipExp"));
			item.setVipRv(rs.getFloat("vipRv"));
			item.setPhone(rs.getString("phone"));
			item.setQq(rs.getString("qq"));
			item.setEmail(rs.getString("email"));
			item.setGroupId(rs.getInt("groupId"));
			item.setGroupName(rs.getString("groupName"));
			item.setRealName(rs.getString("realName"));
			item.setBankName(rs.getString("bankName"));
			item.setBankCard(rs.getString("bankCard"));
			item.setBankAddress(rs.getString("bankAddress"));
			item.setRegDate(rs.getTimestamp("regDate"));
			item.setLoginDate(rs.getDate("loginDate"));
			item.setIp(rs.getString("ip"));
			item.setIslogin(rs.getInt("islogin"));
			item.setStatus(rs.getInt("status"));
			item.setPicPath(rs.getString("picPath"));
			userList.add(item);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		closeAll(conn, ps, rs);//关闭资源
	}
		return userList;
	}

	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		String sql="DELETE	FROM user_list WHERE id=?";
		return myExecuteUpdate(sql, id);
		
	}

	@Override
	public int findAllUserCount(String tj) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int count=0;
		
		try {
			conn=getConn();
			String sql="SELECT COUNT(*) AS num FROM user_list ";
			if(tj!=null){
				sql+=tj;
			}
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			closeAll(conn, ps, rs);
		}
		return count;
	}

	@Override
	public int updateUserStatus(User user) {
		// TODO Auto-generated method stub
		String sql="UPDATE user_list SET islogin=?,`status`=?,loginDate=? WHERE id=?";
		return myExecuteUpdate(sql, user.getIslogin(),user.getStatus(),user.getLoginDate(),user.getId());
	}

	@Override
	public User checkUserName(String name) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT * FROM user_list WHERE NAME=?";
			ps=conn.prepareStatement(sql);
			//设置ps参数
			ps.setString(1, name);
			//接收结果集
			rs=ps.executeQuery();
			if (rs.next()) {
				user=new User();//创建用户对象
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return user;
	}
	
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO user_list(`name`,`password`,phone,qq,email)VALUES (?,?,?,?,?)";
		return myExecuteUpdate(sql,user.getName(),user.getPassword(),user.getPhone(),user.getQq(),user.getEmail());
	}
	@Override
	public User phoneLogin(String phone) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT * FROM user_list WHERE NAME=?";
			ps=conn.prepareStatement(sql);
			//设置ps参数
			ps.setString(1, phone);
			//接收结果集
			rs=ps.executeQuery();
			if (rs.next()) {
				user=new User();//创建用户对象
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setIslogin(rs.getInt("islogin"));
				user.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return user;
	}
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		String sql="UPDATE user_list SET `password`=?, nick=?,money=?,points=?,groupId=?,phone=?,qq=?,email=?,realName=?,bankName=?,bankCard=?,bankAddress=? WHERE id=?";
		return myExecuteUpdate(sql, user.getPassword(),user.getNick(),user.getMoney(),user.getPoints(),user.getGroupId(),user.getPhone(),user.getQq(),user.getEmail(),user.getRealName(),user.getBankName(),user.getBankCard(),user.getBankAddress(),user.getId());
	}
	@Override
	public User findUser(String tj) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try {
			conn=getConn();
			String sql="SELECT * FROM user_list  ";
			if(tj!=null){
				sql+=tj;
			}
			ps=conn.prepareStatement(sql);			
			rs=ps.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setNick(rs.getString("nick"));
				user.setMoney(rs.getFloat("money"));
				user.setPoints(rs.getInt("points"));
				user.setPhone(rs.getString("phone"));
				user.setQq(rs.getString("qq"));
				user.setEmail(rs.getString("email"));
				user.setGroupId(rs.getInt("groupId"));
				user.setRealName(rs.getString("realName"));
				user.setBankName(rs.getString("bankName"));
				user.setBankCard(rs.getString("bankCard"));
				user.setBankAddress(rs.getString("bankAddress"));
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public int bindBank(User user) {
		// TODO Auto-generated method stub
		String sql="UPDATE user_list SET bankName=?,realName=?,bankCard=?,bankAddress=? WHERE id=?";
		return myExecuteUpdate(sql, user.getBankName(),user.getRealName(),user.getBankCard(),user.getBankAddress(),user.getId());
	}
	@Override
	public int updatePwd(User user) {
		// TODO Auto-generated method stub
		String sql="UPDATE user_list SET `password`=? WHERE id=?";
		return myExecuteUpdate(sql, user.getPassword(),user.getId());
	}
	@Override
	public int updateHeadPic(User user) {
		// TODO Auto-generated method stub
		String sql="UPDATE user_list SET picPath=? WHERE id=?";
		return myExecuteUpdate(sql, user.getPicPath(),user.getId());
	}
}
