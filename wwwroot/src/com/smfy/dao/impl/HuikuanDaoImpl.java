package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.HuikuanDao;
import com.smfy.entity.Huikuan;


public class HuikuanDaoImpl extends BaseDao implements HuikuanDao {
private Connection conn;
private PreparedStatement ps;
private ResultSet rs;
	@Override
	public List<com.smfy.entity.Huikuan> findAllHuikuan(String tj,int pageIndex,int pageSize) {
		// TODO Auto-generated method stub
		List<Huikuan> hkList=new ArrayList<Huikuan>();
		try {
			conn=getConn();
			String sql="SELECT id,number,(SELECT `name` FROM user_list WHERE user_list.id=userId)AS userName,money,`date`,(SELECT `name` FROM bank WHERE bank.id=bankId)AS bankName,cardUser,cardNum,bankAddress,`mode`,`status`  FROM huikuan ";
			if(tj!=null){
				sql+=tj;
			}
			sql+=" LIMIT ?,?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (pageIndex-1)*pageSize);
			ps.setInt(2, pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				Huikuan hk=new Huikuan();
				hk.setId(rs.getInt("id"));
				hk.setNumber(rs.getString("number"));
				hk.setUserName(rs.getString("userName"));
				hk.setMoney(rs.getFloat("money"));
				hk.setDate(rs.getDate("date"));
				hk.setBankName(rs.getString("bankName"));
				hk.setCardUser(rs.getString("cardUser"));
				hk.setCardUser(rs.getString("cardUser"));
				hk.setBankAddress(rs.getString("bankAddress"));
				hk.setMode(rs.getInt("mode"));
				hk.setStatus(rs.getInt("status"));
				hkList.add(hk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return hkList;
	}
	@Override
	public int delHuikuan(Huikuan huikuan) {
		// TODO Auto-generated method stub
		String sql="DELETE	FROM huikuan WHERE id=?";
		return myExecuteUpdate(sql, huikuan.getId());
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
			String sql="SELECT COUNT(*) AS num FROM huikuan ";
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
