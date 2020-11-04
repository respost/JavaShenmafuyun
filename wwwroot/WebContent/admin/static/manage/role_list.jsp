<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<link rel="stylesheet" href="../../common/css/title.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
<title>角色管理</title>
</head>
<body>
<c:import url="../../../Role_List_Servlet"></c:import>

<div id="saper-container">
            <div class="subfiled clearfix" >
                <h2><span>角色列表</span></h2>
            </div>
<!--插入内容 start-->
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','role_add.html','800')"><i class="Hui-iconfont">&#xe600;</i> 添加角色</a> </span>
	
	 <span class="r">共有数据：<strong>56</strong> 条</span>
	 
	  </div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">角色管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="40">ID</th>
				<th width="200">角色名</th>
				<th>用户列表</th>
				<th width="300">描述</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${roleList}" var="ro">
			<tr class="text-c">
				<td><input type="checkbox" value="${ro.id}" name="ro"></td>
				<td>${ro.id}</td>
				<td>${ro.name}</td>
				<td><a href="#">${ro.rights}</a></td>
				<td>${ro.desc}</td>
				<td class="f-14"><a title="编辑" href="javascript:;" onclick="admin_role_edit('角色编辑','role_add.html','1','800','600')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:void(0);" did="${ro.id}"  class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript" src="../thirdParty/js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../thirdParty/js/H-ui.admin.js"></script>
<script type="text/javascript" src="../thirdParty/js/jquery.dataTables.min.js"></script><!--包含“从当前数据中检索：”内容-->
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript">

/*管理员-角色-添加*/
function admin_role_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-编辑*/
function admin_role_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-删除*/
/* function admin_role_del(obj,id){
	   layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		   $.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});   	 
		
	});  
} */

	$("[title='删除']").click(function(){		
		var id=$(this).attr("did");
		var json={"id":id};
		if(confirm("确定要删除吗？")){
			$.post("../../../Role_Del_Servlet",json,function(data){
				if(data=="ok"){
					alert("删除成功！");
					location.href="role_list.jsp";
				}else{
					alert("删除失败！");
				}
			});
		}
	});


</script>
<!--插入内容 end--> 
</div>  
</body>
</html>