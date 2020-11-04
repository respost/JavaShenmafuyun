<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<title>修改用户</title>
</head>
<body>
<article class="page-container">
	<form action="javascript:void(0)" method="post" class="form form-horizontal" id="form-member-add">
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>会员账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  readonly="readonly" id="username" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" required="required" id="password">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>会员名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="nick" >
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>帐号余额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" required="required" id="money">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>积分：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  required="required" id="points">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>VIP等级：</label>
			<div class="formControls col-xs-8 col-sm-9 w8"> <span class="select-box">
				<select id="userGroup" class="select">
					<option value="1">普通会员</option>
		            <option value="2">VIP1</option>
		            <option value="3">VIP2</option>
		            <option value="4">VIP3</option>
		            <option value="5">VIP4</option>
		            <option value="6">VIP5</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>QQ：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="qq">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="@" id="email">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>真实姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="realName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>银行名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="bankName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>银行卡号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="bankCard" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>支行地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  id="bankAddress">
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
		var tj=" where id<>0";//默认条件
		var userId="";//用户ID
		$(function(){			
			var id=GetQueryString("id");
			if(id!=null&&id!=""){
				tj+=" and id="+id;
				var json={"tj":tj};
				$.getJSON("../../../User_Find_Servlet",json,function(data){
					userId=data.id;
					$("#username").val(data.name);
					$("#password").val(data.password);
					$("#nick").val(data.nick);
					$("#money").val(data.money);
					$("#points").val(data.points);
					$("#phone").val(data.phone);
					$("#qq").val(data.qq);
					$("#email").val(data.email);
					$("#realName").val(data.realName);
					$("#bankName").val(data.bankName);
					$("#bankCard").val(data.bankCard);
					$("#bankAddress").val(data.bankAddress);
					//会员分组
					var grourId=data.groupId;
					$("#userGroup").find("option[value = '"+grourId+"']").attr("selected","selected");
				});
		
			} ;
		});
		//修改
		$("[type=button]").click(function(){
			if(userId!=""){
				var password=$("#password").val();
				if(password==null||password==""){
					layer.msg('密码不能为空!',{icon:5,time:1000});
					return;
				}
				var nick=$("#nick").val();
				var money=$("#money").val();
				if(money==null||money==""){
					layer.msg('余额不能为空!',{icon:5,time:1000});
					return;
				}
				var points=$("#points").val();
				if(points==null||points==""){
					layer.msg('积分不能为空!',{icon:5,time:1000});
					return;
				}
				var groupId=$("#userGroup").val();
				var phone=$("#phone").val();
				var qq=$("#qq").val();
				var email=$("#email").val();
				var realName=$("#realName").val();
				var bankName=$("#bankName").val();
				var bankCard=$("#bankCard").val();
				var bankAddress=$("#bankAddress").val();
				var json={"id":userId,"password":password,"nick":nick,"money":money,"points":points,"groupId":groupId,"phone":phone,"qq":qq,"email":email,"realName":realName,"bankName":bankName,"bankCard":bankCard,"bankAddress":bankAddress};
				$.post("../../../User_Update_Servlet",json,function(data){
					if(data=="ok"){
						layer.msg('修改成功!',{icon:1,time:1000});
						setTimeout(closeBox, 1000);
					}else{
						layer.msg('修改失败!',{icon:5,time:1000});
					}
				});
			}

		});
		//关闭弹出层
		function closeBox(){	
			var uname=GetQueryString("name");
			if(uname=="vip"){//VIP
				parent.window.location.href='user_vip.jsp';
			}else{
				parent.window.location.href='user_list.jsp';
			}
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		};

</script> 
</body>
</html>