package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.CunkuanDao;
import com.smfy.entity.Cunkuan;

public class CunkuanDaoImpl extends BaseDao implements CunkuanDao {
private Connection conn;
private PreparedStatement ps;
private ResultSet rs;
@Override
public List<Cunkuan> findAllCunkuan(String tj,int pageIndex,int pageSize) {
	// TODO Auto-generated method stub
	List<Cunkuan> ckList=new ArrayList<Cunkuan>();	
	try {
		conn=getConn();
		String sql="SELECT id,number,(SELECT `name` FROM user_list WHERE user_list.id=userId)AS `name`,money,`date`,`mode`,`status` FROM cunkuan ";
		if(tj!=null){
			sql+=tj;
		}
		sql+=" LIMIT ?,?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, (pageIndex-1)*pageSize);
		ps.setInt(2, pageSize);
		rs=ps.executeQuery();
		while(rs.next()){
			Cunkuan ck=new Cunkuan();
			ck.setId(rs.getInt("id"));
			ck.setNumber(rs.getString("number"));
			ck.setName(rs.getString("name"));
			ck.setMoney(rs.getFloat("money"));
			ck.setDate(rs.getDate("date"));
			ck.setMode(rs.getInt("mode"));
			ck.setStatus(rs.getInt("status"));
			ckList.add(ck);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		closeAll(conn, ps, rs);
	}
	return ckList;
}
@Override
public int delCunkuan(Cunkuan cunkuan) {
	String sql="DELETE	FROM cunkuan WHERE id=?";
	return myExecuteUpdate(sql, cunkuan.getId());
}
@Override
public int findAllCount(String tj) {
	// TODO Auto-generated method stub
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	int count=0;
	
	try {
		conn=getConn();
		String sql="SELECT COUNT(*) AS num FROM cunkuan ";
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



}
