<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../../../CodeType_List_Servlet"></c:import>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="../../common/css/title.css" />

  <!-- Stylesheets -->
  <link href="../thirdParty/bootstrap/css/bootstrap.css" rel="stylesheet"> 
    <!-- Font awesome icon -->
  <link href="../thirdParty/bootstrap/css/font-awesome.css" rel="stylesheet"> 
  <!-- Main stylesheet -->
  <link href="css/style.css" rel="stylesheet">
    <!--图标-->
  <link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
    <!--layer-->
  <link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
 
<title>源码分类</title>
<style>
tr td{vertical-align: middle; line-height:60px;}
</style>
</head>
<body>
<div id="saper-container">
            <div class="allTitle" >
                <h2>源码分类</h2>
            </div>
<!--插入内容 start-->
<div class="definewidth m10" style="text-align:right;">
<button type="button" class="btn btn-success" id="addnew">新增类别</button>
</div>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>序号</th>
        <th>类名</th>
        <th>图标</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${codeTypeList }" var="ct">
			<tr>
                <td>${ct.id }</td>
                <td>${ct.name }</td>            
                <td><img src="../../../${ct.ico }" /></td>
                <td> 
                    <button onclick="edit('${ct.id }','${ct.name }','${ct.ico }')" class="btn btn-xs btn-warning"><i class="Hui-iconfont">&#xe6df;</i></button>
                    <button onclick="del(${ct.id })" class="btn btn-xs btn-danger"><i class="Hui-iconfont">&#xe6e2;</i> </button>                        
				</td>
            </tr>
     </c:forEach>     
</table>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script>
$(function(){
	//添加分类
	$('#addnew').click(function(){
		layer.open({
			type: 2,
			title:'添加分类',
			area: ['522px', '200px'],
			fixed: false, //不固定
			maxmin: true,
			content: 'type_add.jsp?id=&name=&ico='
		});			
	});
});
	//删除分类
	function del(did){
		layer.confirm('确认要删除吗？',function(index){
			var json={"did":did};
			$.post("../../../CodeType_Del_Servlet",json,function(data){
				
				if(data=="ok"){
					layer.msg('已删除!',{icon:1,time:1000});
					window.location.href="code_type.jsp";
				}else{
					alert("删除失败!");
				}
				
			});
		});
	};
	//编辑分类
	function edit(id,name,ico){
		layer.open({
			type: 2,
			title:'编辑分类',
			area: ['522px', '200px'],
			fixed: false, //不固定
			maxmin: true,
			content: 'type_add.jsp?id='+id+'&name='+name+'&ico='+ico
		});	
	}
</script>
<!--插入内容 end--> 
</div> 
</body>
</html>