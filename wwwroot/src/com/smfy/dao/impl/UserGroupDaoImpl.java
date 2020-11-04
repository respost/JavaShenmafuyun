package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.UserGroupDao;
import com.smfy.entity.UserGroup;

public class UserGroupDaoImpl extends BaseDao implements UserGroupDao {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	@Override
	public List<UserGroup> finAllGroup() {
		// TODO Auto-generated method stub
		List<UserGroup>groupList=new ArrayList<UserGroup>();
		try {
			conn=getConn();
			ps=conn.prepareStatement("SELECT*FROM user_group");
			rs=ps.executeQuery();
			while (rs.next()) {
				UserGroup userGroup=new UserGroup();
				userGroup.setId(rs.getInt("id"));
				userGroup.setName(rs.getString("name"));
				userGroup.setDisc(rs.getString("disc"));
				groupList.add(userGroup);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return groupList;
	}
	@Override
	public int deleUserGroup(int id) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM user_group WHERE id=?";
		return myExecuteUpdate(sql, id);
	}
	@Override
	public int addUserGroup(UserGroup userGroup) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO user_group (`name`,disc) VALUES (?,?)";
		return myExecuteUpdate(sql, userGroup.getName(),userGroup.getDisc());
	}
	@Override
	public int updateUserGroup(UserGroup userGroup) {
		// TODO Auto-generated method stub
		String sql="UPDATE user_group SET `name`=?,`disc`=? WHERE id=?";
		return myExecuteUpdate(sql, userGroup.getName(),userGroup.getDisc(),userGroup.getId());
	}




}
