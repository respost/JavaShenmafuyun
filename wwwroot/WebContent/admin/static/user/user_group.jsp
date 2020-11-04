<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>会员分组</title>
<style>
.definewidth{
	width:96%;
	margin:auto;		
}
.m10{
	margin-top:10px;
}
/*新图标样式*/
.newIco{width:20px;height:20px;padding:0;}
</style>
</head>
<body>
<c:import url="../../../UserGroup_List_Servlet"></c:import>
<div id="saper-container">
            <div class="allTitle" >
                <h2>会员分组</h2>
            </div>
<!--插入内容 start-->
<div class="definewidth m10" style="text-align:right;">
<button type="button" class="btn btn-success" id="addnew">新增分组</button>
</div>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>序号</th>
        <th>组名</th>
		<th>折扣比例</th>
        <th>管理操作</th>
    </tr>
    </thead>
         <c:forEach items="${groupList}" var="gr">
			<tr>
                <td>${gr.id}</td>
                <td>${gr.name}</td>
				<td>${gr.disc}</td>
                <td> 
                    <button onclick="edit('${gr.id}','${gr.name}','${gr.disc}')" class="btn btn-xs btn-warning newIco" ><i class="Hui-iconfont">&#xe6df;</i></button>
                    <button onclick="del(${gr.id})" class="btn btn-xs btn-danger newIco" ><i class="Hui-iconfont">&#xe6e2;</i> </button>                        
				</td>
            </tr>
           </c:forEach>

</table>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {       
		$('#addnew').click(function(){		
			layer.open({
			  type: 2,
			  title:'添加分组',
			  area: ['500px', '200px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'group_add.jsp?id=&name=&disc='
			});
		 });

    });
    //删除
    function del(id){
    	if(confirm("确定要删除吗？")){
			var json={"id":id};
			$.post("../../../UserGroup_Del_Servlet",json,function(data){
				if(data=="ok"){
					alert("删除成功");
					location.href="user_group.jsp";
				}
			});
		}
    }
    //修改
    function edit(id,name,disc){
    	layer.open({
			  type: 2,
			  title:'修改分组',
			  area: ['500px', '200px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'group_add.jsp?id='+id+'&name='+name+'&disc='+disc
			});
    }
</script>
<!--插入内容 end--> 
</div> 
</body>
</html>