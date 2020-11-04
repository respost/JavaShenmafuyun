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
<title>VIP会员</title>
<style>
/*新图标样式*/
.newIco{width:20px;height:20px;padding:0;}
.text-c td input{margin-top:5px;}
</style>
</head>

<body>
<div id="saper-container">
			<div class="subfiled clearfix">
                <h2><span>VIP列表<span></h2>
            </div>

<!--插入内容 start-->
  
  		<div class="text-c" style="margin-top:20px;">
	 <span class="select-box inline">
		<select id="vipSelect" class="select">
			<option value="0">全部VIP</option>
            <option value="1">VIP1</option>
            <option value="2">VIP2</option>
            <option value="3">VIP3</option>
            <option value="4">VIP4</option>
            <option value="5">VIP5</option>
		</select>
	</span>
		<input type="text" id="userName" placeholder=" 输入VIP会员账号" style="width:250px" class="input-text">
		<button id="selectBtn" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜VIP会员</button>
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
                          <th>会员账号</th>
                          <th>会员名称</th>
                          <th>账号余额</th>
						  <th>积分</th>
                          <th>手机号码</th>
                          <th>Q Q</th>
						  <th>电子邮箱</th>
						  <th>会员到期时间</th>						 
						  <th>登录地址</th> 
						  <th>VIP等级</th>               
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
<script type="text/javascript">
//全局变量
var pageSize=10;//每页显示10条
var tj=" WHERE groupId<>1 ";//查询条件,1是普通会员，不为1则为vip会员 	 
$(function(){
	tj+=" ORDER BY `regDate` desc";
 	getUserList();		
});
//账号查询
$("#selectBtn").click(function(){
	 var userName=$("#userName").val();
	 var startTime=$("#datemin").val();
	 var endTime=$("#datemax").val();
	 tj="WHERE groupId<>1";//初始化
	 if(userName!=""&&userName!=null){
		 tj+=" and name like '%"+userName+"%'";//模糊查询	
	 }
	 getUserList();
});
//分类查询
var selectId=0;
$("#vipSelect").change(function () {  
	selectId = $(this).children('option:selected').val();
	if(selectId==1){
   		tj=" WHERE groupId=2 ";//vip1
   	}else if(selectId==2){
   		tj=" WHERE groupId=3 ";//vip2
   	}else if(selectId==3){
   		tj=" WHERE groupId=4 ";//vip3
   	}else if(selectId==4){
   		tj=" WHERE groupId=5 ";//vip4
   	}else if(selectId==5){
   		tj=" WHERE groupId=6 ";//vip5
   	}
	tj+=" ORDER BY `regDate` desc";
	getUserList();		
    
}); 
function getUserList(pageIndex){
	if(pageIndex==null||pageIndex==""){
		pageIndex=1;//默认页码
	}
	 var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
	$.getJSON("../../../User_List_Servlet",json,function(data){
			var html="";
			for(var i = 0 ;i < data.userList.length ; i++){
				html+='<tr class="text-c">';
				html+='<td><input  type="checkbox" value="" name="" ></td>';
				html+='<td>'+data.userList[i].id+'</td>';
				html+='<td>'+data.userList[i].name+'</td>';
				if(data.userList[i].nick!=null){
					html+='<td>'+data.userList[i].nick+'</td>';
				}else{
					html+='<td></td>';
				}	
				html+='<td>'+data.userList[i].money+'</td>';
				html+='<td>'+data.userList[i].points+'</td>';
				if(data.userList[i].phone!=null){
					html+='<td>'+data.userList[i].phone+'</td>';
				}else{
					html+='<td></td>';
				}	
				if(data.userList[i].qq!=null){
					html+='<td>'+data.userList[i].qq+'</td>';
				}else{
					html+='<td></td>';
				}
				if(data.userList[i].email!=null){
					html+='<td>'+data.userList[i].email+'</td>';
				}else{
					html+='<td></td>';
				}
				if(data.userList[i].vipExp!=null){
					data.userList[i].vipExp=new Date(data.userList[i].vipExp).format("yyyy-MM-dd hh:mm:ss");
					html+='<td>'+data.userList[i].vipExp+'</td>';	
				}else{
					html+='<td></td>';
				}
							
				if(data.userList[i].ip!=null){
					html+='<td>'+data.userList[i].ip+'</td>';
				}else{
					html+='<td>未知</td>';
				}	
				html+='<td><span class="label label-danger">'+data.userList[i].groupName+'</span></td>';   
				html+='<td>';
				html+='<button class="btn btn-xs btn-warning newIco bj"onclick="member_edit('+data.userList[i].id+')"><i class="Hui-iconfont">&#xe6df;</i></button>&nbsp;&nbsp;';
				html+='<button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>';
				html+='</td>';
				html+='</tr>';								
			}
			$("tbody").html(html);
			
			/* $(".bj").click(function(){
				alert(data.userList[i].id);
				//location.href="user_add.jsp?id="+data.userList[i].id;
			}); */
			//分页
			  var page="";
			 page+='<p align="center">';
			 page+='当前页数:['+pageIndex+'/'+data.allPage+']&nbsp; ';
			 if(pageIndex>1){
				page+='	<a href="javascript:void(0)" onclick="getUserList(1)">首页</a>'; 
				page+='	<a href="javascript:void(0)" onclick="getUserList('+(data.pageIndex-1)+')">上一页</a>';
			 }
			 if(pageIndex<data.allPage){
				page+='	<a javascript:void(0)" onclick="getUserList('+(data.pageIndex+1)+')">下一页</a> ';
				page+='	<a javascript:void(0)" onclick="getUserList('+data.allPage+')">末页</a>';
			 }
				page+='</p>';
			$(".pagination").html(page); 
		});
	};

		
	function member_edit(id){
		layer.open({
		  type: 2,
		  title:'编辑',
		  area: ['800px', '500px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: 'user_update.jsp?name=vip&id='+id
		}); 
}		

</script>
<!--插入内容 end--> 	
</div>  
</body>
</html>