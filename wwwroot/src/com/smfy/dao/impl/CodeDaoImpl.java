package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.CodeDao;
import com.smfy.entity.Code;


public class CodeDaoImpl extends BaseDao implements CodeDao {

	@Override
	public int AddCode(Code code) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO code_list(adminId,title,typeId,price,sort,acs,origin,`update`,keywords,summary,content,downUrl,extPwd,decomPwd,tbPath,filePath,status) VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return myExecuteUpdate(sql, code.getAdminId(),code.getTitle(),code.getTypeId(),code.getPrice(),code.getSort(),code.getAcs(),code.getOrigin(),code.getUpdate(),code.getKeywords(),code.getSummary(),code.getContent(),code.getDownUrl(),code.getExtPwd(),code.getDecomPwd(),code.getTbPath(),code.getFilePath(),code.getStatus());
	}
	@Override
	public int editCode(Code code) {
		// TODO Auto-generated method stub
		String sql="UPDATE code_list SET adminId=?,title=?,typeId=?,price=?,sort=?,acs=?,origin=?,`update`=?,keywords=?,summary=?,content=?,downUrl=?,extPwd=?,decomPwd=?,tbPath=?,filePath=?,`status`=?  WHERE id=?";
		return myExecuteUpdate(sql, code.getAdminId(),code.getTitle(),code.getTypeId(),code.getPrice(),code.getSort(),code.getAcs(),code.getOrigin(),code.getUpdate(),code.getKeywords(),code.getSummary(),code.getContent(),code.getDownUrl(),code.getExtPwd(),code.getDecomPwd(),code.getTbPath(),code.getFilePath(),code.getStatus(),code.getId());
	}
	@Override
	public List<Code> findAllCode(String tj,int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Code> lists=new ArrayList<Code>();		
		try {
			conn=getConn();//连接数据库
			String sql="SELECT * ,(SELECT `name` FROM code_type WHERE typeId=id) AS typeName,(SELECT `name` FROM admin WHERE adminId=id) AS adminName,(SELECT picPath FROM admin WHERE adminId=id) AS adminPic,(SELECT NAME FROM user_list WHERE userId=id) AS userName,(SELECT nick FROM user_list WHERE userId=id) AS userNick ,(SELECT picPath FROM user_list WHERE userId=id) AS userPic FROM code_list ";
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
				Code code=new Code();
				code.setId(rs.getInt("id"));
				code.setTitle(rs.getString("title"));
				code.setTypeId(rs.getInt("typeId"));
				code.setTypeName(rs.getString("typeName"));
				code.setPrice(rs.getFloat("price"));				
				code.setAdminName(rs.getString("adminName"));
			    code.setAdminPic(rs.getString("adminPic"));
				code.setUserName(rs.getString("userName"));
				code.setUserNick(rs.getString("userNick"));
				code.setUserPic(rs.getString("userPic"));
				code.setOrigin(rs.getString("origin"));
				code.setUpdate(rs.getDate("update"));
				code.setKeywords(rs.getString("keywords"));
				code.setSummary(rs.getString("summary"));
				code.setContent(rs.getString("content"));
				code.setSort(rs.getInt("sort"));
				code.setStatus(rs.getInt("status"));
				code.setAcs(rs.getInt("acs"));
				code.setLookCount(rs.getInt("lookCount"));
				code.setMentCount(rs.getInt("mentCount"));
				code.setDownCount(rs.getInt("downCount"));
				code.setDpCount(rs.getInt("dpCount"));
				code.setDownUrl(rs.getString("downUrl"));
				code.setExtPwd(rs.getString("extPwd"));
				code.setDecomPwd(rs.getString("decomPwd"));
				code.setTbPath(rs.getString("tbPath"));
				code.setFilePath(rs.getString("filePath"));			
				lists.add(code);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return lists;
	}

	@Override
	public int findAllCodeCount(String tj) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT COUNT(*) as num FROM code_list ";
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
	public Code findCodeInfo(String tj) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Code code=null;
		try {
			conn=getConn();//连接数据库
			String sql="SELECT * ,(SELECT `name` FROM code_type WHERE typeId=id) AS typeName,(SELECT ico FROM code_type WHERE typeId=id) AS typeIco,(SELECT `name` FROM admin WHERE adminId=id) AS adminName,(SELECT picPath FROM admin WHERE adminId=id) AS adminPic,(SELECT NAME FROM user_list WHERE userId=id) AS userName,(SELECT nick FROM user_list WHERE userId=id) AS userNick ,(SELECT picPath FROM user_list WHERE userId=id) AS userPic FROM code_list  ";
			if(tj!=null){
				sql+=tj;
			}
			ps=conn.prepareStatement(sql);
			//接收结果集
			rs=ps.executeQuery();
			while(rs.next()) {
				code=new Code();
				code.setId(rs.getInt("id"));
				code.setTitle(rs.getString("title"));
				code.setTypeId(rs.getInt("typeId"));
				code.setTypeName(rs.getString("typeName"));
				code.setTypeIco(rs.getString("typeIco"));
				code.setPrice(rs.getFloat("price"));				
				code.setAdminName(rs.getString("adminName"));
			    code.setAdminPic(rs.getString("adminPic"));
				code.setUserName(rs.getString("userName"));
				code.setUserNick(rs.getString("userNick"));
				code.setUserPic(rs.getString("userPic"));
				code.setOrigin(rs.getString("origin"));
				code.setUpdate(rs.getDate("update"));
				code.setKeywords(rs.getString("keywords"));
				code.setSummary(rs.getString("summary"));
				code.setContent(rs.getString("content"));
				code.setSort(rs.getInt("sort"));
				code.setStatus(rs.getInt("status"));
				code.setAcs(rs.getInt("acs"));
				code.setLookCount(rs.getInt("lookCount"));
				code.setMentCount(rs.getInt("mentCount"));
				code.setDownCount(rs.getInt("downCount"));
				code.setDpCount(rs.getInt("dpCount"));
				code.setDownUrl(rs.getString("downUrl"));
				code.setExtPwd(rs.getString("extPwd"));
				code.setDecomPwd(rs.getString("decomPwd"));
				code.setTbPath(rs.getString("tbPath"));
				code.setFilePath(rs.getString("filePath"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return code;
	}
	@Override
	public int updateCodeStatus(Code code) {
		// TODO Auto-generated method stub
		String sql="UPDATE code_list SET STATUS=? WHERE id=?";
		return myExecuteUpdate(sql, code.getStatus(),code.getId());
	}
	@Override
	public int delCode(Code code) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM code_list WHERE id=?";
		return myExecuteUpdate(sql, code.getId());
	}

}
