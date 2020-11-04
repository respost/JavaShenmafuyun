<%@page import="com.smfy.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	//获取Session的值
	User user=(User)session.getAttribute("user");
	String topUserName="请先登录";
	String topPic="images/member.jpg";
	String topUserMenu="";
	//用户登录状态
	int status=user==null?0:1;
	if(user!=null){
		//获取对象的参数
		String nick=user.getNick();
		String name=user.getName();
		String picPath=user.getPicPath();
		if(nick!=null&&!nick.equals("")){
			topUserName=nick;
		}else{
			topUserName=name;
		}
		if(picPath!=null&&!picPath.equals("")){
			topPic=picPath;
		}
		topUserMenu="<img id='drop-down' src='images/drop-down.gif'>";
	}
	
	%>	


