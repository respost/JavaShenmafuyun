<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<link rel="stylesheet" href="../../common/css/title.css" />

  <!-- Stylesheets -->
  <link href="../thirdParty/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link href="../thirdParty/bootstrap/css/font-awesome.css" rel="stylesheet"> 
  <!-- Main stylesheet -->
  <link href="../thirdParty/bootstrap/css/style.css" rel="stylesheet">
  <!--图标-->
  <link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
  <link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
  <link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
  <link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">


 
<title>订单列表</title>
<style>
/*新图标样式*/
.newIco{width:20px;height:20px;padding:0;}
.text-c td input{margin-top:5px;}
</style>
</head>
<body>
<div id="saper-container">
            <div class="subfiled clearfix" >
              <h2><span id="orderTitle">订单列表</span></h2>
            </div>

<!--插入内容 start-->
  
  	<div class="text-c" style="margin-top:20px;">
	 <span class="select-box inline">
		日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 输入订单号" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜订单</button>
	</span> 
	</div>

<div class="widget">

                <div class="widget-head">

                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>

                  <div class="widget-content">

                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr class="text-c">
						  <th width="15"><input type="checkbox" name="" value=""></th>
						  <th>ID</th>
                          <th>订单号</th>
                          <th>下单时间</th>
                          <th>金额</th>
                          <th>源码标题</th>
                          <th>购买者</th>
                          <th>状态</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>                                                  

                      </tbody>
                    </table>

                    <div class="widget-foot">

                     
                        <ul class="pagination pull-right">
                        <!-- 
                         <li><a href="#">上一页</a></li>
                          <li><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
						  <li><a href="#">…</a></li>
						  <li><a href="#">8</a></li>
                          <li><a href="#">下一页</a></li>
                          -->
						  
                        </ul>
                     
                      <div class="clearfix"></div> 

                    </div>

                  </div>

                </div>
<!-- JS -->
<script src="../thirdParty/bootstrap/js/jquery.js"></script> <!-- jQuery -->
<script src="../thirdParty/bootstrap/js/custom.js"></script> <!-- Custom codes -->	
<script type="text/javascript" src="../thirdParty/My97DatePicker/WdatePicker.js"></script><!--日期功能-->
<script type="text/javascript" src="../thirdParty/js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/js/H-ui.min.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script  type="text/javascript">
//全局变量
 var status="all";//默认
 var pageSize=5;//每页显示5条
 
 $(function(){	 	
	 	status=GetQueryString("stu");
	 	if(status=='0'){
	 		$("#orderTitle").text("待付款订单");
	 	}else if(status=='1'){
	 		$("#orderTitle").text("已成功订单");
	 	}else if(status=='2'){
	 		$("#orderTitle").text("已取消订单");
	 	}else{
	 		$("#orderTitle").text("订单列表");
	 	}
	 	getOrderList();		
 });
//获取订单列表
function getOrderList(pageIndex){
	if(pageIndex==null||pageIndex==""){
		pageIndex=1;//默认页码
	}
	
    var json={"status":status,"pageIndex":pageIndex,"pageSize":pageSize};
	$.getJSON("../../../Order_List_Servlet",json,function(data){
		 var html="";
		for(var i=0;i<data.orderList.length;i++){			
			html+='<tr class="text-c">';
			html+='<td><input type="checkbox" value="" name="" ></td>';
			html+=' <td>'+data.orderList[i].id+'</td>';
			html+='<td>'+data.orderList[i].orderNum+'</td>';
			data.orderList[i].date=new Date().format("yyyy-MM-dd hh:mm:ss");
			html+='<td>' +data.orderList[i].date+'</td>';
			html+='<td>'+data.orderList[i].money+'</td>';
			html+='<td>'+data.orderList[i].title+'</td>';
			html+='<td>'+data.orderList[i].userName+'</td>';
			if(data.orderList[i].status==0){
				html+='<td><span class="label label-warning">待付款</span></td>';
			}else if(data.orderList[i].status==1){
				html+='<td><span class="label label-success">已成功</span></td>';
			}else if(data.orderList[i].status==2){
				html+='<td><span class="label label-danger">已取消</span></td>';
			}					
			html+='<td>';
			//html+='<button class="btn btn-xs btn-warning newIco" style="margin-right:5px;"><i class="Hui-iconfont">&#xe6df;</i></button>';
			html+='<button class="btn btn-xs btn-danger newIco Del" did="'+data.orderList[i].id+'"><i class="Hui-iconfont">&#xe6e2;</i> </button>';                      
			html+='</td>';
			html+='</tr> ';					
		}			
		$("tbody").html(html);
		 //分页
		 var page="";
		 page+='<p align="center">';
		 page+='当前页数:['+pageIndex+'/'+data.allPage+']&nbsp; ';
		 if(pageIndex>1){
			page+='	<a href="javascript:void(0)" onclick="getOrderList(1)">首页</a>'; 
			page+='	<a href="javascript:void(0)" onclick="getOrderList('+(data.pageIndex-1)+')">上一页</a>';
		 }
		 if(pageIndex<data.allPage){
			page+='	<a javascript:void(0)" onclick="getOrderList('+(data.pageIndex+1)+')">下一页</a> ';
			page+='	<a javascript:void(0)" onclick="getOrderList('+data.allPage+')">末页</a>';
		 }
			page+='</p>';
		$(".pagination").html(page);	
		 //删除
		$(".Del").click(function(){	
			var id=$(this).attr("did");
			layer.confirm('确认要删除吗？',function(index){				
				var json={"id":id};
				$.post("../../../Order_Del_Servlet",json,function(data){
					if(data=="ok"){
						layer.msg('已删除!',{icon:1,time:1000});
						location.href="order_list.jsp?stu="+status;
					}else{
						layer.msg('删除失败!',{icon:5,time:1000});
					}
				});
					
			}); 
		}); 
	
		 
	});	 
}

</script>
<!--插入内容 end--> 	
</div>  
</body>
</html>