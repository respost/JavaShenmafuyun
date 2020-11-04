package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.smfy.dao.BaseDao;
import com.smfy.dao.OrderDao;
import com.smfy.entity.Order;

public class OrderDaoImpl extends BaseDao implements OrderDao {
private Connection conn;
private PreparedStatement ps;
private ResultSet rs;
	@Override
	public List<Order> findAllOrder(String status, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<Order> orderList=new ArrayList<Order>();
		try {
			conn=getConn();
			String sql="SELECT id,orderNum,`date`,money,(SELECT title FROM code_list WHERE code_list.id=codeId ) AS title,(SELECT `name` FROM user_list WHERE user_list.id=userId ) AS userName,`status`FROM `order` ";
			if(status.equals("0")){//待付款
				sql+=" WHERE STATUS=0 ORDER BY `date` DESC";
			}else if(status.equals("1")){//成功
				sql+=" WHERE STATUS=1 ORDER BY `date` DESC";
			}else if(status.equals("2")){//取消
				sql+=" WHERE STATUS=2 ORDER BY `date` DESC";
			}else{
				sql+=" ORDER BY `date` DESC";
			}
			sql+=" LIMIT ?,?";
			ps=conn.prepareStatement(sql);
			//设置参数
			ps.setInt(1, (pageIndex-1)*pageSize);
			ps.setInt(2, pageSize);
			
			rs=ps.executeQuery();
			while(rs.next()){
				Order order=new Order();
				order.setId(rs.getInt("id"));
				order.setOrderNum(rs.getString("orderNum"));
				order.setDate(rs.getDate("date"));
				order.setMoney(rs.getFloat("money"));
				order.setTitle(rs.getString("title"));
				order.setUserName(rs.getString("userName"));
				order.setStatus(rs.getInt("status"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);
		}
		return orderList;
	}
	@Override
	public int deleteOrder(int id) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM `order` WHERE id=?";
		return myExecuteUpdate(sql, id);
	}

	@Override
	public int findAllOrderCount(String status) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT COUNT(*) as num FROM `order` ";
			if(status.equals("0")){//待付款
				sql+=" WHERE STATUS=0";
			}else if(status.equals("1")){//成功
				sql+=" WHERE STATUS=1";
			}else if(status.equals("2")){//取消
				sql+=" WHERE STATUS=2";
			}
			ps=conn.prepareStatement(sql);
			//接收结果集
			rs=ps.executeQuery();
			while(rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return count;
	}



}
