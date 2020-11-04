package com.smfy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smfy.dao.BaseDao;
import com.smfy.dao.CodeTypeDao;
import com.smfy.entity.CodeType;

public class CodeTypeDaoImpl extends BaseDao implements CodeTypeDao {

	@Override
	public List<CodeType> findAllCodeType() {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<CodeType> typeList=new ArrayList<CodeType>();
		try {
			conn=getConn();//连接数据库
			String sql="SELECT * FROM code_type";
			ps=conn.prepareStatement(sql);
			//接收结果集
			rs=ps.executeQuery();
			while(rs.next()) {
			CodeType codeType=new CodeType();
			codeType.setId(rs.getInt("id"));
			codeType.setName(rs.getString("name"));
			codeType.setIco(rs.getString("ico"));
			typeList.add(codeType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(conn, ps, rs);//关闭资源
		}
		return typeList;
	}

	@Override
	public int addCodeType(CodeType codeType) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO code_type (`name`,ico) VALUES(?,?)";
		return myExecuteUpdate(sql, codeType.getName(),codeType.getIco());
	}

	@Override
	public int delCodeType(CodeType codeType) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM  code_type WHERE id=?";
		return myExecuteUpdate(sql, codeType.getId());
	}

	@Override
	public int updateCodeType(CodeType codeType) {
		// TODO Auto-generated method stub
		String sql="UPDATE code_type SET `name`=?,ico=? WHERE id=?";
		return myExecuteUpdate(sql, codeType.getName(),codeType.getIco(),codeType.getId());
	}

}
