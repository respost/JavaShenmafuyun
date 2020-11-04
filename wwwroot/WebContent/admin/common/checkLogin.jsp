<%@page import="com.smfy.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%	
		//获取session会话中保存的管理员对象
		Admin admin=(Admin)session.getAttribute("admin");
		if(admin==null){			
	%>
	<script type="text/javascript">alert("请先登录!")</script>
	<script type="text/javascript"> location.href="index.html";</script>		
    <%  
		} 			
	%>