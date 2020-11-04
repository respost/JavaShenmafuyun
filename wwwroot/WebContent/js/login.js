// JavaScript Document
	//全局变量
	var sms="";//发送到用户手机上的验证码
$(document).ready(function() {
	//登录窗口样式
	$("#login_right ul li div").eq(0).show();//默认显示第一个
	$("#login_right ul li").hover(function(){
		$(this).children("h5").addClass("h5_current").removeClass("h5_default");
		$(this).siblings().children("h5").addClass("h5_default").removeClass("h5_current");
		$(this).children("div").show();
		$(this).siblings().children("div").hide();
	});
});   
	//按下回车
	/*$(document).keyup(function(event){
		if(event.keyCode=="13"){//13表示回车键的代码
			userLogin();
		}
	});*/
	//发送短信
	function sendSms(){
		var phone=$("#UserPhone").val();
		if(phone==""||phone==null){
			layer.msg('请输入手机号码', {icon: 5});
			return;
		}		
		$("#sendSms").css("color","#ccc");
		$("#sendSms").attr("disabled","disabled");//禁用发送按钮
		var oclock=document.getElementById("sendSms");
		//修改对象内部文本，每隔一秒-1，直到0弹出提示
		var i=60;
		//每隔一秒执行
		var tid=setInterval(function(){
			i--;	
			oclock.innerHTML=i+"秒后重发";
			if(i==0){
				$("#sendSms").text("发送动态密码");
				$("#sendSms").css("color","#09F");
				$("#sendSms").removeAttr("disabled");//启用发送按钮
			clearInterval(tid);	
			}
		},1000)
		//开始发送
		$.post("SMS_Send_Setvlet",{"phone":phone},function(data){
			if(data=="error"){
				layer.msg('系统出错了！', {icon: 5});
			}else{				
				sms=data;//接收返回的动态密码
			}
		});
	}
	//动态登录按钮
	$("#sends_submit").click(function(){
		sendLogin();								
	});
	//用户登录按钮
	$("#login_submit").click(function(){
		userLogin();								
	});
	//动态登录方法
	function sendLogin(){
		var Userphone=$("#UserPhone").val();
		var sendsPwd=$("#sendsPwd").val();
		if(sendsPwd!=sms){
			layer.msg('动态密码错误，请重新输入！', {icon: 5});
			$("#sendsPwd").focus();
		}else{//动态密码正确，去登录
			$.post("User_Phone_Servlet",{"phone":Userphone},callBack);
		}
	}
	//用户登录方法
	function userLogin(){
		var userName=$("#userName").val();
		var userPwd=$("#userPwd").val();
		var json={"userName":userName,"userPwd":userPwd};	
		$.post("User_Login_Setvlet",json,callBack);
	}
	//登录成功返回的方法
	function callBack(data){
		if(data=="error"){
			layer.msg('用户名或密码错误！', {icon: 5});
		}else if(data=="stop"){
			layer.msg('账号异常，请联系管理员！', {icon: 5});
		}else {
			//加载层
			layer.load(0, {shade: false}); //0代表加载的风格，支持0-2								
			var user = $.parseJSON(data);					
			if(user!=null){
				//显示用户信息
				if(user.nick!=null&&user.nick!=""){
					$("#nick").html(user.nick);
				}else{
					$("#nick").html(user.name);
				}
				if(user.picPath!=null&&user.picPath!=""){
					$("#headPic").attr('src',user.picPath);
				}						
				//判断是在哪个页面登录
				var page=GetQueryString("page");
				if(page=="reg") {//如果是注册页，先跳回主页，再关掉弹出层				
					parent.backIndex();
					closeLayer();
				}else{//其他页面
					parent.location.reload();//父窗口刷新
					window.location.reload();//当前窗口刷新
					layer.msg('登录成功！', {icon: 1});
					closeLayer();
				}
			
			}
							
					
		 }
	}
	//用户退出
	function loginOut(){
		//询问框
		layer.confirm('确定要退出吗？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			  layer.msg('您已安全退出！', {icon: 1});
			  setTimeout(function(){
				  location.href="loginOut.jsp";
				 $("#nick").html("请先登录");
				 $("#drop-down").hide();
			  }, 1000);
		});
	}

	//获取url?传送过来的值
	function GetQueryString(name) { 
	  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	  var r = window.location.search.substr(1).match(reg); //获取url中"?"符后的字符串并正则匹配
	  var context = ""; 
	  if (r != null) 
	     context = r[2]; 
	  reg = null; 
	  r = null; 
	  return context == null || context == "" || context == "undefined" ? "" : context; 
	}
	//关闭弹出层
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);//关闭弹出框
	}
