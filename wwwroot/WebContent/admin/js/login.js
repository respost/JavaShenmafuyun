// JavaScript Document
	//按下回车
	$(document).keyup(function(event){
		if(event.keyCode=="13"){//13表示回车键的代码
			adminLogin();
		}
	});
	//用户登录
	$("#admin_login").click(function(){
		adminLogin();								
	});
  
	//登录的方法
	function adminLogin(){
		var userName=$("#userName").val();
		var userPwd=$("#userPwd").val();
		var code=$("#code").val();
		var json={"userName":userName,"userPwd":userPwd,"code":code};	
		$.post("../Admin_Login_Servlet",json,function(data){
			if(data=="ok"){
				location.href="main.jsp";
			}else if(data=="vcError"){
				layer.msg('验证码错误！', {icon: 5});
			}else if(data=="error"){
				layer.msg('用户名或密码错误！', {icon: 5});
			}else if(data=="stop"){
				layer.msg('账号异常，请联系管理员！', {icon: 5});
			}else{
				layer.msg('连接失败！', {icon: 5});					
			 }
		});
	}
