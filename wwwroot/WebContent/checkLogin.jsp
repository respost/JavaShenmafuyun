<%@page import="com.smfy.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
	<% 
	//获取Session的值
	User loginUser=(User)session.getAttribute("user");
	if(loginUser==null){	
	%>
	<script type="text/javascript"> alert("请先登录");</script>
	<script type="text/javascript"> location.href="${ctp}/index.jsp";</script>
	<%
	}
	%>