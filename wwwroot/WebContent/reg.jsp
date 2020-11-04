<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="config/website.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>会员注册 - <%=web_name %></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/reg.css">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<style>
#regbox form .tab{height:35px;line-height:35px; margin-top:20px;}
#regbox form .tab li{ width:50%; float:left; cursor:pointer;}
#regbox form .tab li h5{ height:30px; text-align:center;line-height:30px;font-weight:normal;}
.h5_default{border-bottom:2px #CCCCCC solid;}
.h5_current{ border-bottom:2px #09F solid;}
</style>
</head>
<body>
<jsp:include page="top.jsp"/>
<!--注册页-->
<div id="regflash"></div>
<!--regStep Start -->
<div id="regStep">
   <ul>
      <li class="active">
      		<i class="icon"></i>
      		<em>1</em><span>填写基本信息</span>	
      </li>
      <li>
      		<i class="icon"></i>
       		<em>2</em><span>邮箱验证</span>
       </li>
       <li>
			<em>3</em><span>注册成功</span>            
       </li>
    </ul>
</div>
<!--regStep End -->
<div id="regbox">
		<h1><span class="regicon"></span>注册会员<span class="login">已有账号？<a id="gotoLogin">立即登录</a></span></h1>

		<form  method="post" action="javascript:void(0)"> 
			<ul class="tab">
       		<li name="li-phone">
            <h5 class="h5_current">手机注册</h5>
        	</li>
       		<li name="li-email">
            <h5 class="h5_default">邮箱注册</h5>
        	</li>
           </ul>
              <dl id="dl-phone">
				<dt>手机号码：</dt>
    			<dd><input id="phone" type="text" value=""  placeholder="11位手机号码" /><p id="phone_promt"></p></dd>
			</dl>
            
              <dl id="dl-email">
				<dt>Email：</dt>
    		<dd><input id="email" type="text" value="" placeholder="登录邮箱，同时用于接收重要文件" /><ul class="list"></ul><p id="email_promt"></p></dd>
			</dl>      

			<dl>
				<dt>密码：</dt>
    			<dd><input id="pwd" class="maxPwd" type="password" value="123456" placeholder="6-20位字符，可由英文、数字及标点符号组成" required/><p id="pwd_promt"></p></dd>
			</dl>
			<dl>
				<dt>确认密码：</dt>
   				 <dd><input id="repwd" type="password" value="123456" placeholder="请再次输入登录密码" required/><p id="repwd_promt"></p></dd>
			</dl>

             <dl>
				<dt>联系Q Q：</dt>
    			<dd><input id="qq" type="text" value="46576576" placeholder="方便我们与您联系" required/><p id="qq_promt"></p></dd>
			</dl>
			 <dl>
				<dt>验证码：</dt>
    			<dd class="codedd"><input type="text" placeholder="请输入验证码" id="code"  maxlength="5" ><img src="VeryfServlet" id="veryfyCode" alt="验证码"  title="点击刷新" /><p id="agree_promt"></p></dd>
			</dl>
             <dl class="agree">
				<dt>&nbsp;</dt>
    			<dd><input id="agree" type="checkbox" />我仔细阅读并同意网站<a href="#">《服务条款》</a>与<a href="#">《免责声明》</a></dd>
			</dl>
            <dl class="btn">
				<dt>&nbsp;</dt>
    			<dd><input id="regBtn" type="submit" value="立即注册"/></dd>
			</dl>
		</form> 
</div>
<jsp:include page="foot.jsp"/>
<!--JavaScript jQuery start-->
<script type="text/javascript" src="jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/reg.js"></script>
<script type="text/javascript" src="js/email.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">   
	$(function(){
		//验证码
		$("#veryfyCode").click(function(){	
			$(this).attr("src","VeryfServlet?a="+Math.random());
		});
		$("#code").focus(function(){		
			$("#veryfyCode").attr("src","VeryfServlet?b="+Math.random());
		});
	});
//点击登录
$("#gotoLogin").click(function(){
	
	//iframe层-禁滚动条
	layer.open({
	  type: 2,
	  title:'会员登录',
	  area: ['533px', '400px'],
	  skin: 'layui-layer-rim', //加上边框
	  content: ['login.html?page=reg', 'no']
	}); 
});
//跳回首页
function backIndex(){
	location.href="index.jsp";
}

</script>
<!--JavaScript jQuery end-->
</body>
</body>
</html>