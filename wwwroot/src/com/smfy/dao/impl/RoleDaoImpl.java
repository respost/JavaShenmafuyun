package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.RoleDao;
import com.smfy.entity.Role;

public class RoleDaoImpl extends BaseDao implements RoleDao {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Role> findAllRole() {
		// TODO Auto-generated method stub
		List<Role>roleList=new ArrayList<Role>();
		try {
			conn=getConn();
			ps=conn.prepareStatement("SELECT*FROM role");
			rs=ps.executeQuery();
			while (rs.next()) {
				Role role=new Role();
				role.setId(rs.getInt("id"));
				role.setName(rs.getString("name"));
				role.setRights(rs.getString("rights"));
				role.setDesc(rs.getString("desc"));
				roleList.add(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		
		return roleList;
	}
	@Override
	public int deleRole(int id) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM role WHERE id=?";
		return myExecuteUpdate(sql, id);
	}

/*	@Override
	public List<Role> findAllRoless() {
		// TODO Auto-generated method stub
		List<Role>roles=new ArrayList<Role>();
		try {
			conn=getConn();
			ps=conn.prepareStatement("SELECT COUNT(*)AS conn FROM role");
			rs=ps.executeQuery();
			while (rs.next()) {
				Role roless=new Role();
				roless.setConn(rs.getInt("conn"));
				roles.add(roless);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return roles;
	}*/




}
