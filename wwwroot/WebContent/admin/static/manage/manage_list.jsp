<%@page import="com.smfy.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<link rel="stylesheet" href="../../common/css/title.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<title>管理员</title>
</head>
<body>
<div id="saper-container">
            <div class="subfiled clearfix" >
                <h2><span>管理员列表</span></h2>
            </div>
<!--插入内容 start-->
<div class="page-container">
	<div class="text-c"> 
		<input type="text" class="input-text" style="width:250px;text-indent: 5px;" placeholder="输入管理员账号" id="adminName" >
		<button type="submit" class="btn btn-success" id="selectBtn" ><i class="Hui-iconfont">&#xe665;</i> 搜一下</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a></span></div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">ID</th>
				<th width="150">登录名</th>
				<th width="90">手机</th>
				<th width="150">邮箱</th>
				<th>权限</th>
				<th width="130">最近登录时间</th>
				<th width="100">是否已启用</th>
				<th width="100">操作</th>
			</tr>
			
		</thead>
		<tbody>

		</tbody>
	</table>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/My97DatePicker/WdatePicker.js"></script><!--日期功能-->
<script type="text/javascript" src="../thirdParty/js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/js/H-ui.min.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
	var tj=" WHERE id<>0 ";//查询条件 
	//创建集合，保存管理员对象
	 var arr = new Array();
	$(function(){
		getAdminList();
	});
	//账号查询
	$("#selectBtn").click(function(){
		 var adminName=$("#adminName").val();
		 tj="WHERE id<>0";//初始化
		 if(adminName!=""&&adminName!=null){
			 tj+=" and name like '%"+adminName+"%'";//模糊查询	
		 }
		 getAdminList();
	});
	//获取管理员列表
	function getAdminList(){
		$.getJSON("../../../Admin_List_Servlet",{"tj":tj},function(data){		
			var html="";
			for ( var i = 0; i < data.length; i++) {
				
				arr[data[i].id] = {admin: data[i] };//增加对象到集合中，用对象的id作为数组下标
				
				html+='<tr class="text-c">';
				html+='<td><input type="checkbox" value="2" name=""></td>';
				html+='<td>'+data[i].id+'</td>';
				html+='<td>'+data[i].name+'</td>';
				html+='<td>'+data[i].phone+'</td>';
				html+='<td>'+data[i].email+'</td>';
				html+='<td>'+data[i].roleName+'</td>';
				if(data[i].loginDate==null){
					html+='<td></td>';
				}else{
					data[i].loginDate=new Date(data[i].loginDate).format("yyyy-MM-dd hh:mm:ss");
					html+='<td>'+data[i].loginDate+'</td>';	
				}				
				if(data[i].status==1){
					html+='<td class="td-status"><span class="label label-danger radius">已停用</span></td>';
				}else{
					html+='<td class="td-status"><span class="label label-success radius">已启用</span></td>';
				}			
				html+='<td class="td-manage">';
				if(data[i].status==1){
					html+='<a onClick="admin_start('+data[i].id+')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>';
				}else{
					html+='<a onClick="admin_stop('+data[i].id+')"  href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>';
				}
				html+='<a title="编辑" href="javascript:;" onclick="admin_edit('+data[i].id+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> ';
				html+='<a title="删除" href="javascript:;" onclick="admin_del('+data[i].id+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
				html+='</td>';
				html+='</tr>'; 
			}
			$("tbody").html(html);
		});
	}


/*管理员-增加*/
function admin_add(){
			layer.open({
			  type: 2,
			  title:'添加管理员',
			  area: ['800px', '500px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'manage_add.jsp?id=0'
			});

}
/*管理员-删除*/
function admin_del(id){
	var loginId=${admin.id};
	if(id==loginId){
		layer.msg('当前账号正在使用中!',{icon: 4,time:1000});
		return;
	}
	layer.confirm('确认要删除吗？',function(index){
		var json={"id":id};
		$.post("../../../Admin_Del_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('已删除!',{icon:1,time:1000});
				getAdminList();
			}else{
				layer.msg('删除失败!',{icon:5,time:1000});
			}
		});
			
	});
}

/*管理员-编辑*/
function admin_edit(id){
			var name=arr[id]['admin'].name;
			var password=arr[id]['admin'].password;
			var phone=arr[id]['admin'].phone;
			var email=arr[id]['admin'].email;
			var roleId=arr[id]['admin'].roleId;	
			layer.open({
				type: 2,
				title:'编辑管理员',
				area: ['800px', '500px'],
				fixed: false, //不固定
				maxmin: true,
				content: 'manage_add.jsp?id='+id+'&name='+name+'&password='+password+'&phone='+phone+'&email='+email+'&roleId='+roleId
			});	
}
/*管理员-停用*/
function admin_stop(id){
	var loginId=${admin.id};
	if(id==loginId){
		layer.msg('当前账号正在使用中!',{icon: 4,time:1000});
		return;
	}
	layer.confirm('确认要停用吗？',function(index){
		var status=1;
		var json={"id":id,"status":status};
		$.post("../../../Admin_Update_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('已停用!',{icon: 5,time:1000});
				getAdminList();
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
		});
	});
}

/*管理员-启用*/
function admin_start(id){
	var loginId=${admin.id};
	if(id==loginId){
		layer.msg('当前账号正在使用中!',{icon: 4,time:1000});
		return;
	}
	layer.confirm('确认要启用吗？',function(index){
		var status=0;
		var json={"id":id,"status":status};
		$.post("../../../Admin_Update_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('已启用!',{icon: 6,time:1000});
				getAdminList();
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
		});
	});

}

</script>
<!--插入内容 end--> 
</div>  
</body>
</html>