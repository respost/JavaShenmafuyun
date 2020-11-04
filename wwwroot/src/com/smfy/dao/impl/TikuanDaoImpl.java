package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.TikuanDao;
import com.smfy.entity.Tikuan;

public class TikuanDaoImpl extends BaseDao implements TikuanDao {
private Connection conn;
private PreparedStatement ps;
private ResultSet rs;
	@Override
	public List<Tikuan> findAllTikuan(String tj,int pageIndex,int pageSize) {
		// TODO Auto-generated method stub
		List<Tikuan> tkList=new ArrayList<Tikuan>();
		try {
			conn=getConn();
			String sql="SELECT id,number,(SELECT `name` FROM user_list WHERE user_list.id=userId )AS userName,money,fee,`date`,(SELECT `name` FROM bank WHERE bank.id=bankId)AS bankName,cardUser,cardNum,bankAddress,`status` FROM tikuan ";
			if(tj!=null){
				sql+=tj;
			}
			sql+=" LIMIT ?,?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (pageIndex-1)*pageSize);
			ps.setInt(2, pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				Tikuan tk=new Tikuan();
				tk.setId(rs.getInt("id"));
				tk.setNumber(rs.getString("number"));
				tk.setUserName(rs.getString("userName"));
				tk.setMoney(rs.getFloat("money"));
				tk.setFee(rs.getFloat("fee"));
				tk.setDate(rs.getDate("date"));
				tk.setBankName(rs.getString("bankName"));
				tk.setCardUser(rs.getString("cardUser"));
				tk.setCardNum(rs.getString("cardNum"));
				tk.setBankAddress(rs.getString("bankAddress"));
				tk.setStatus(rs.getInt("status"));
				tkList.add(tk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return tkList;
	}
	@Override
	public int delTikuan(Tikuan tikuan) {
		// TODO Auto-generated method stub
		String sql="DELETE	FROM tikuan WHERE id=?";
		return myExecuteUpdate(sql, tikuan.getId());
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
			String sql="SELECT COUNT(*) AS num FROM tikuan ";
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
