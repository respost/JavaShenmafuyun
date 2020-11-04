// JavaScript Document
	var isphone=true;
	$(document).ready(function(){
		//注册方式
		$("#dl-phone").show();//默认显示手机
		$("#dl-email").hide();
		$("#regbox form .tab li").hover(function(){
			$(this).children("h5").addClass("h5_current").removeClass("h5_default");
			$(this).siblings().children("h5").addClass("h5_default").removeClass("h5_current");
			if($(this).attr("name")=="li-phone"){
				isphone=true;
				$("#dl-phone").show();
				$("#dl-email").hide();
			}else{
				isphone=false;
				$("#dl-phone").hide();
				$("#dl-email").show();
			}
		});
		//1.失去焦点时，开始检测
	    $("#phone").blur(checkPhone);
		$("#email").blur(checkEmail);
		$("#pwd").blur(checkPwd);
		$("#repwd").blur(checkRepwd);
		$("#qq").blur(checkqq);
		$("#agree").blur(checkAgree);
	});
	//2.点击注册按钮
	$("#regBtn").click(function(){
		var flag=true;
		if(isphone==true){
			if(!checkPhone()) flag=false;
		}else{
			if(!checkEmail()) flag=false;
		}	
		if(!checkPwd()) flag=false;
		if(!checkRepwd()) flag=false;	
		if(!checkqq()) flag=false;
		if(!checkAgree()) flag=false;
		if(flag){	
			var phone=$("#phone").val();
			var email=$("#email").val();
			var password=$("#pwd").val();			
			var qq=$("#qq").val();			
			var code=$("#code").val();
			if(code==null||code==""){				
				layer.msg('请输入验证码！', {icon: 5});
				return;
			} 
			var name="";//登录账号
			
			if(isphone==true){
				name=phone;
			}else{
				name=email;
			}
				
			var json={"name":name,"password":password,"phone":phone,"qq":qq,"email":email,"code":code};
			$.post("User_Add_Servlet",json,function(data){
				if(data=="vcError"){
					layer.msg('验证码错误！', {icon: 5});
				}else if(data=="ok"){
					//刷新验证码，防攻击
					$("#veryfyCode").attr("src","VeryfServlet?c="+Math.random());
					//清空输入框
					$("#name").val("");		
					$("#pwd").val("");
					$("#repwd").val("");
					$("#phone").val("");
					$("#qq").val("");
					$("#email").val("");
					$("#code").val("");				
					//询问是否自动登录
					layer.confirm('注册成功，是否自动登录？', {
					  btn: ['好的','取消'] //按钮
					}, function(){
						//-------------------------------自动登录 开始--------------------------------//
						var login={"userName":name,"userPwd":password};	
						$.post("User_Login_Setvlet",login,function(data){	
						var user = $.parseJSON(data);	
							if(user!=null){
								//加载层
								layer.load(0, {shade: false}); //0代表加载的风格，支持0-2																		
									if(user!=null){	
										 backIndex();
										 closeLayer();		
									}																				
							 }
						});
						//-------------------------------自动登录 结束--------------------------------//
					}, function(){
						layer.closeAll();
					});
					
				}else{
					layer.msg('注册失败！', {icon: 2});
				}
				
			});
		}
	});	
	//关闭弹出层
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		parent.layer.close(index);//关闭弹出框
	}
	//验证用户名
	function checkName(){
		var name=$("#name").val().trim();
		var regName=/^\w{4,20}$/;
		if(regName.test(name)==false){
			$("#name_promt").show();
			$("#name_promt").addClass("regwrong").removeClass("regok");
			$("#name_promt").html("请输入有效的帐号(4-20位字母、数字或下划线组合)");
			return false;
		}else{		
			//检测用户名是否已被注册
			var jg=false;
			$.ajax({  
		          type : "post",  
		          url : "User_Check_Servlet",  
		          data : "name=" + name,  
		          async : false, //让ajax同步 
		          success : function(data){  
		        	  if(data=="error"){
							$("#name_promt").show();
							$("#name_promt").addClass("regwrong").removeClass("regok");
							$("#name_promt").html("账号已被注册");
							jg=false;
						}else{
							$("#name_promt").show();
							$("#name_promt").addClass("regok").removeClass("regwrong");
							$("#name_promt").html("恭喜,输入正确！");
							jg= true;
						}
		          }  
		     });
			return jg;
		}
	}
	//验证邮箱
	function checkEmail(){
		var email=$("#email").val().trim();
		var regEmail=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
		if(regEmail.test(email)==false){
			$("#email_promt").show();
			$("#email_promt").addClass("regwrong").removeClass("regok");
			$("#email_promt").html("邮箱格式不正确，例如：smfy@qq.com");
			return false;
		}else{
			//检测邮箱是否已被注册
			var jg=false;
			$.ajax({  
		          type : "post",  
		          url : "User_Check_Servlet",  
		          data : "name=" + email,  
		          async : false, //让ajax同步 
		          success : function(data){  
		        	  if(data=="error"){
		        		  $("#email_promt").show();
		      			$("#email_promt").addClass("regwrong").removeClass("regok");
		      			$("#email_promt").html("邮箱已被占用！");
							jg=false;
						}else{
							$("#email_promt").show();
							$("#email_promt").addClass("regok").removeClass("regwrong");
							$("#email_promt").html("恭喜,输入正确！");
							$("#regStep li:eq(1)").addClass("active").siblings().removeClass("active");
							jg= true;
						}
		          }  
		     });
			return jg;
		}
	}
	//验证密码
	function checkPwd(){
		var pwd=$("#pwd").val().trim();
		var regPwd=/^[0-9a-zA-Z]{6,20}$/;
		if(regPwd.test(pwd)==false){
			$("#pwd_promt").show();
			$("#pwd_promt").addClass("regwrong").removeClass("regok");
			$("#pwd_promt").html("密码由英文字母和数字组成的6-20位字符");
			return false;
		}else{
			$("#pwd_promt").show();
			$("#pwd_promt").addClass("regok").removeClass("regwrong");
			$("#pwd_promt").html("恭喜,输入正确！")
			return true;
		}
	}
	//确认密码
	function checkRepwd(){
		var pwd=$("#pwd").val().trim();		
		var repwd=$("#repwd").val().trim();
		if(pwd==""){
			$("#repwd_prompt").html("");
			return false;
		}
		if(repwd!=pwd){
			$("#repwd_promt").show();
			$("#repwd_promt").addClass("regwrong").removeClass("regok");
			$("#repwd_promt").html("输入的密码不一致");
			return false;
		}else{
			$("#repwd_promt").show();
			$("#repwd_promt").addClass("regok").removeClass("regwrong");
			$("#repwd_promt").html("恭喜,输入正确！")
			return true;
		}
	}
	//验证手机
	function checkPhone(){
		var phone=$("#phone").val().trim();
		var regPhone=/^1[0-9]{10}$/;	
		if(regPhone.test(phone)==false){
			$("#phone_promt").show();
			$("#phone_promt").addClass("regwrong").removeClass("regok");
			$("#phone_promt").html("手机号码只能是1开头的11位数字");
			return false;
		}else{
			//检测手机号码是否已被注册
			var jg=false;
			$.ajax({  
		          type : "post",  
		          url : "User_Check_Servlet",  
		          data : "name=" + phone,  
		          async : false, //让ajax同步 
		          success : function(data){  
		        	  if(data=="error"){
		      			$("#phone_promt").show();
		    			$("#phone_promt").addClass("regwrong").removeClass("regok");
		    			$("#phone_promt").html("手机号码已被注册！");
							jg=false;
						}else{
							$("#phone_promt").show();
							$("#phone_promt").addClass("regok").removeClass("regwrong");
							$("#phone_promt").html("恭喜,输入正确！");
							jg= true;
						}
		          }  
		     });
			return jg;
		}
	}
	//验证QQ
	function checkqq(){
		var qq=$("#qq").val().trim();
		var regqq=/^[0-9]{4,}$/;	
		if(regqq.test(qq)==false){
			$("#qq_promt").show();
			$("#qq_promt").addClass("regwrong").removeClass("regok");
			$("#qq_promt").html("QQ号码要求4位以上数字");
			return false;
		}else{
			$("#qq_promt").show();
			$("#qq_promt").addClass("regok").removeClass("regwrong");
			$("#qq_promt").html("恭喜,输入正确！");
			return true;
		}
	}
	//验证同意条款
	function checkAgree(){
		var agree=$("#agree:checked").val();
		if(agree==null){
			$("#agree_promt").show();
			$("#agree_promt").addClass("regwrong").removeClass("regok");
			$("#agree_promt").html("请选择同意条款");
			return false;
		}else{
			$("#agree_promt").hide();
			return true;
		}
	}			
	
