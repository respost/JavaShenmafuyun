package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.MentDao;
import com.smfy.entity.Ment;

public class MentDaoImpl extends BaseDao implements MentDao {

	@Override
	public int addMent(Ment ment) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO ment (cid,content,uid) VALUE(?,?,?)";
		return myExecuteUpdate(sql, ment.getCid(),ment.getContent(),ment.getUid());
	}

	@Override
	public int delMent(Ment ment) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM ment WHERE id=?";
		return myExecuteUpdate(sql, ment.getId());
	}

	@Override
	public int dpMent(Ment ment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Ment> findAllMent(String tj,int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Ment> lists=new ArrayList<Ment>();
		try {
			conn=getConn();//连接数据库
			String sql="SELECT *,(SELECT title FROM code_list WHERE cid=id) AS title,(SELECT `name` FROM user_list WHERE uid=id) AS userName,(SELECT nick FROM user_list WHERE uid=id) AS userNick,(SELECT picPath FROM user_list WHERE uid=id) AS userPic FROM ment ";
			if(tj!=null){
				sql+=tj;
			}
			sql+=" LIMIT ?,?";
			ps=conn.prepareStatement(sql);
			//设置参数
			ps.setInt(1, (pageIndex-1)*pageSize);
			ps.setInt(2, pageSize);
			//接收结果集
			rs=ps.executeQuery();
			while(rs.next()) {
				Ment ment=new  Ment();
				ment.setId(rs.getInt("id"));
				ment.setCid(rs.getInt("cid"));
				ment.setContent(rs.getString("content"));
				ment.setMentDate(rs.getTimestamp("mentDate"));
				ment.setReply(rs.getString("reply"));
				ment.setReDate(rs.getDate("reDate"));
				ment.setUid(rs.getInt("uid"));
				ment.setDpCount(rs.getInt("dpCount"));
				ment.setStatus(rs.getInt("status"));
				ment.setTitle(rs.getString("title"));
				ment.setUserName(rs.getString("userName"));
				ment.setUserNick(rs.getString("userNick"));
				ment.setUserPic(rs.getString("userPic"));
				lists.add(ment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return lists;
	}

	@Override
	public int reMent(Ment ment) {
		// TODO Auto-generated method stub
		String sql="UPDATE ment SET reply=?,reDate=? WHERE id=?";
		return myExecuteUpdate(sql, ment.getReply(),ment.getReDate(),ment.getId());
	}

	@Override
	public int findAllMentCount(String tj) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT COUNT(*) as num FROM ment ";
			if(tj!=null){
				sql+=tj;
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

	@Override
	public int updateMnet(Ment ment) {
		// TODO Auto-generated method stub
		String sql="UPDATE ment SET `status`=? WHERE id=?";
		return myExecuteUpdate(sql, ment.getStatus(),ment.getId());
	}

}
