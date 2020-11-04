package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.AdminDao;
import com.smfy.dao.BaseDao;
import com.smfy.entity.Admin;

public class AdminDaoImpl extends BaseDao implements AdminDao {
	
	@Override
	public Admin adminLogin(Admin admin) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Admin item=null; 	
		try {
			conn=getConn();
			String sql="SELECT * FROM admin WHERE `name`=? AND password=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, admin.getName());
			ps.setString(2, admin.getPassword());
			rs=ps.executeQuery();
			if(rs.next()){
				 item=new Admin();
				 item.setId(rs.getInt("id"));
				 item.setName(rs.getString("name"));
				 item.setPassword(rs.getString("password"));
				 item.setPhone(rs.getString("phone"));
				 item.setEmail(rs.getString("email"));
				 item.setRoleId(rs.getInt("roleId"));
				 item.setLoginDate(rs.getTimestamp("loginDate"));
				 item.setIp(rs.getString("ip"));
				 item.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return item;
	}
	@Override
	public List<Admin> findAlladmin(String tj) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Admin> adminList=new ArrayList<Admin>();
		try {
			conn=getConn();
			String sql="SELECT *,(SELECT `name` FROM role WHERE roleId=id )AS roleName,(SELECT `desc` FROM role WHERE roleId=id )AS remarks  FROM admin ";
			if(tj!=null){
				sql+=tj;
			}
			ps=conn.prepareStatement(sql);			
			rs=ps.executeQuery();
			while(rs.next()){
				Admin admin=new Admin();
				admin.setId(rs.getInt("id"));
				admin.setName(rs.getString("name"));
				admin.setPassword(rs.getString("password"));
				admin.setPhone(rs.getString("phone"));
				admin.setEmail(rs.getString("email"));
				admin.setRoleId(rs.getInt("roleId"));
				admin.setRoleName(rs.getString("roleName"));				
				admin.setLoginDate(rs.getTimestamp("loginDate"));
				admin.setIp(rs.getString("ip"));
				admin.setIslogin(rs.getInt("islogin"));
				admin.setStatus(rs.getInt("status"));
				admin.setRemarks(rs.getString("remarks"));
				admin.setPicPath(rs.getString("picPath"));
				adminList.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return adminList;
	}
	
	@Override
	
	public int addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int ret=0;
		try {
			conn=getConn();
			ps=conn.prepareStatement("INSERT INTO admin(`name`,`password`,phone,email,roleId) VALUES(?,?,?,?,?)");
			ps.setString(1, admin.getName());
			ps.setString(2, admin.getPassword());
			ps.setString(3, admin.getPhone());
			ps.setString(4, admin.getEmail());
			ps.setInt(5, admin.getRoleId());
			ret=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return ret;
	}
	@Override
	public int delAdmin(Admin admin) {
		// TODO Auto-generated method stub	
		String sql="DELETE FROM admin WHERE id=?";
		return myExecuteUpdate(sql, admin.getId());
	}
	@Override
	public int UpdateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		String sql="UPDATE admin SET `name`=?,`password`=?,phone=?,email=?,roleId=? WHERE id=?";
		return myExecuteUpdate(sql, admin.getName(),admin.getPassword(),admin.getPhone(),admin.getEmail(),admin.getRoleId(),admin.getId());
	}
	@Override
	public int updateAdminStatus(Admin admin) {
		// TODO Auto-generated method stub
		String sql="UPDATE admin SET islogin=?,`status`=?,loginDate=? WHERE id=?";
		return myExecuteUpdate(sql,admin.getIslogin(),admin.getStatus(),admin.getLoginDate(),admin.getId() );
	}		

}
