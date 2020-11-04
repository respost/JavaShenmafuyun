<%@page import="com.smfy.entity.Admin"%>
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
<title>添加管理员</title>
</head>
<body>



<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add" action="#" method="post">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  id="name" >
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" autocomplete="off"  placeholder="请输入密码" id="password" >
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  id="phone" >
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" placeholder="@"  id="email">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">角色：</label>
		<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
			<select class="select" id="role" size="1">
				<option value="1">超级管理员</option>
				<option value="2">普通管理员</option>
			</select>
			</span> </div>
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
<script type="text/javascript" src="../js/common.js"></script> 
<script type="text/javascript">
$(function(){
	var id=GetQueryString("id");
	if(id!=0){
		//获取管理员信息
		$("#name").val(GetQueryString("name"));
		$("#password").val(GetQueryString("password"));
		$("#phone").val(GetQueryString("phone"));
		$("#email").val(GetQueryString("email"));
		//角色
		var roleId=GetQueryString("roleId");
		$("#role").find("option[value = '"+roleId+"']").attr("selected","selected");
	}
	$("[type=button]").click(function(){
		var id=GetQueryString("id");
		if(id==0){//添加
			var name=$("#name").val();
			if(name==null||name==""){
				layer.msg('账号不能为空!',{icon: 5,time:1000});
				return;
			}
			var password=$("#password").val();
			if(password==null||password==""){
				layer.msg('密码不能为空!',{icon: 5,time:1000});
				return;
			}
			var phone=$("#phone").val();
			var email=$("#email").val();
			var role=$("#role").val();
			var json={"id":id,"name":name,"password":password,"phone":phone,"email":email,"role":role};
			$.post("../../../Admin_Add_servlet",json,function(data){
				if(data=="ok"){
					layer.msg('添加成功!',{icon: 1,time:1000});
					setTimeout(closeBox, 1000);
				}else if(data=="error"){
					layer.msg('添加失败!',{icon: 5,time:1000});
				}
			});
		
		}else{//编辑
			var id=GetQueryString("id");
			var name=$("#name").val();
			if(name==null||name==""){
				layer.msg('账号不能为空!',{icon: 5,time:1000});
				return;
			}
			var password=$("#password").val();
			if(password==null||password==""){
				layer.msg('密码不能为空!',{icon: 5,time:1000});
				return;
			}
			var phone=$("#phone").val();
			var email=$("#email").val();
			var role=$("#role").val();
			var json={"id":id,"name":name,"password":password,"phone":phone,"email":email,"role":role};
			$.post("../../../Admin_Add_servlet",json,function(data){
				if(data=="ok"){
					layer.msg('修改成功!',{icon: 1,time:1000});
					setTimeout(closeBox, 1000);
				}else{
					layer.msg('修改失败!',{icon: 5,time:1000});
				}
			})
			
		}
	});	
	
});
function closeBox(){
	parent.window.location.href='manage_list.jsp';
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>