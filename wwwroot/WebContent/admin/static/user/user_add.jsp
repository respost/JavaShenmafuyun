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
<title>添加用户</title>
</head>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员帐号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" required="required" id="username">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  required="required"  id="password">
			</div>
		</div>		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>VIP等级：</label>
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
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript">

	$(".btn").click(function(){		
		var name=$("#username").val();
		if(name==null||name==""){
			layer.msg('账号不能为空!',{icon:2,time:1000});
			return;
		}
		var password=$("#password").val();
		if(password==null||password==""){
			layer.msg('密码不能为空!',{icon:2,time:1000});
			return;
		}
		var groupId=$("#userGroup").val();
	  	var id=0;
		var json={"name":name,"password":password,"groupId":groupId,"id":id};
		$.post("../../../User_Update_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('新增成功!',{icon:1,time:1000});
				setTimeout(closeBox, 1000);
				
			}else{
				layer.msg('新增失败!',{icon:5,time:1000});
			}
		});	
	});


function closeBox(){
	parent.window.location.href='user_list.jsp';
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}
</script> 
</body>
</html>