<%@page import="com.smfy.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="common/css/sapar.css" />
<link rel="stylesheet" href="static/css/index.css" />
<link rel="stylesheet" type="text/css" href="static/thirdParty/layer/theme/default/layer.css">

<title>后台管理系统</title>
</head>

<body>
<div id="container">
<!--top-->
	<div id="hd">
    	<div class="hd-wrap clearfix">
        	<div class="top-light"></div>
            <h1 class="logo"></h1>
            <ul class="main-nav clearfix">
                <li class="current" data-src="static/system/index.html"><a href="javascript:;">首页</a></li>
                <li data-src="static/source/index.html"><a href="javascript:;">源码</a></li>
				<li data-src="static/order/index.html"><a href="javascript:;">订单</a></li>
				<li data-src="static/user/index.html"><a href="javascript:;">会员</a></li>
				<li data-src="static/finance/index.html"><a href="javascript:;">财务</a></li>
                <li data-src="static/msg/index.html"><a href="javascript:;">消息</a></li>
                <li data-src="static/data/index.html"><a href="javascript:;">数据</a></li>

            </ul>
            <div class="notice clearfix">
                <ul class="clearfix">
                    <li class="current"><a href="javascript:;">V1.0管理系统正式上线！</a></li>
                    <li><a href="javascript:;">关于程序升级通知</a></li>
                    <li><a href="javascript:;">支付接口需引入第三方</a></li>
                </ul>
                <div class="notice-btn">
                    <a href="javascript:;" class="prev"></a>
                    <a href="javascript:;" class="next"></a>
                </div>
            </div>
            <div class="toolbar">
                <div class="login-info clearfix">
                    <div class="welcome clearfix"><span>欢迎您，</span><a href="javascript:;" class="user-name">${admin.name }</a></div>
                    <div class="login-msg clearfix">
                        <a href="javascript:;" class="msg-txt">消息</a>
                        <a href="javascript:;" class="msg-num">10</a>
                    </div>
                </div>
                <div class="tool clearfix">
                    <a class="tips" href="javascript:;">合作须知</a>
                    <a class="tips" href="javascript:;">版本建议</a>
                    <a class="help-btn" href="javascript:;" >帮助</a>
                    <a class="quit-btn" id="exit" href="javascript:;">退出</a>
                </div>
            </div>          
        </div>
    </div>
	<div class="exitDialog">
	<div class="dialog-content">
    	<div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
        	<p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
            
            <div class="buttons">
                <input type="button" class="button long2 ok" value="确定" />
                <input type="button" class="button long2 normal" value="取消" />
            </div>
        </div>
        
    </div>
	</div>
<!--right-->
<div id="bd">
    	<div class="wrap clearfix">
			<iframe src="static/system/index.html" id="iframe" width="100%" height="100%" frameborder="0"></iframe>
		</div>
 </div>
<!--foot-->
    <div id="ft" class="clearfix">
    	<div class="ft-left">
		<em>&copy;2017</em><span>后台管理系统</span><em>Management System</em>
        </div>
        <div class="ft-right">
            <span>Automation</span>
            <em>2.0</em>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="common/js/jquery.js"></script>
<script type="text/javascript" src="common/js/sapar.js"></script>
<script type="text/javascript" src="static/js/index.js"></script>
<script type="text/javascript" src="static/thirdParty/layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		$("#exit").click(function(){
			layer.confirm('确认要退出 吗？',function(index){
				location.href="loginOut.jsp";			
			});
		});		
	});

</script>
</html>
