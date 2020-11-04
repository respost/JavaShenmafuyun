<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	//String name=request.getParameter("name");
	//name=new String(name.getBytes("iso-8859-1"),"utf-8");
	String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");//处理中文乱码
	String disc=request.getParameter("disc");
	String groupId="";
	String groupName="";
	String groupDisc="";
	if(id!=null&&id!=""){
		groupId=id;
	}
	if(name!=null&&name!=""){
		groupName=name;
	}
	if(disc!=null&&disc!=""){
		groupDisc=disc;
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
  <!-- Stylesheets -->
  <link href="../thirdParty/bootstrap/css/bootstrap.css" rel="stylesheet"> 
    <!-- Font awesome icon -->
  <link href="../thirdParty/bootstrap/css/font-awesome.css" rel="stylesheet"> 
<title>添加分组</title>
</head>
<body>
<table class="table table-bordered table-hover m10">
 		<input type="hidden" value="<%=groupId %>"  id="groupId"/>
    <tr>
        <td class="tableleft">分组名称：</td>
        <td><input type="text" value="<%=groupName %>" id="groupName" size="25"/></td>      
    </tr>
	<tr>
        <td class="tableleft">折扣比例：</td>
        <td><input type="text" value="<%=groupDisc %>" id="groupDisc" size="25"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button class="btn btn-primary"  type="button" id="bc">保 存</button><button type="button" style="margin-left:45px;" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script>
    $(function () {  	
		$('#backid').click(function(){
		 parent.window.location.href="user_group.jsp";//刷新父窗口
		 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		 parent.layer.close(index);//关闭弹出框
		 });
		
		$("#bc").click(function(){
			var id=$("#groupId").val();
			var name=$("#groupName").val();
			var disc=$("#groupDisc").val();
			var gid=0;
			if(id!=""){
				gid=id;
			}
			var json={"gid":gid,"name":name,"disc":disc};
			$.post("../../../UserGroup_Add_Servlet",json,function(data){
				if(data=="ok"){
					if(id==""){
						layer.msg('新增成功!',{icon:1,time:1000});
					}else{
						layer.msg('新增成功!',{icon:1,time:1000});
					}
					closeBox();
				}else if(data=="error"){
					if(id==""){
						layer.msg('新增成功!',{icon:5,time:1000});
					}else{
						layer.msg('新增成功!',{icon:5,time:1000});
					}
					
				}
			});
			
		});
		function closeBox(){
			parent.window.location.href='user_group.jsp';
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}

    });
</script>
</body>
</html>