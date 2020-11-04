package com.smfy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
	private static String driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://127.0.0.1:3306/zy_db";
	private static String user="root";
	private static String password="root";
			
	//加载驱动
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//连接数据库
	public Connection getConn(){
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(url,user,password);
		}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return conn;
	}
	//关闭连接
	public void closeAll(Connection conn,PreparedStatement ps,ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(conn!=null){
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//增、删、改查方法
	public int myExecuteUpdate(String sql,Object...objects){
		int result=0;
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			//连接数据库
			conn=getConn();
			ps=conn.prepareStatement(sql);
			//设置参数
			if(objects!=null&&objects.length>0){
				for (int i = 0; i < objects.length; i++) {
					ps.setObject(i+1, objects[i]);
				}
			}
			//接收结果集
			result=ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			closeAll(conn, ps, null);
		}
		return result;
	}
}

