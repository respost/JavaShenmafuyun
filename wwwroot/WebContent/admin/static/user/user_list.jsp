<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<link rel="stylesheet" href="../../common/css/title.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<title>会员管理</title>
</head>
<body>
<div id="saper-container">
			<div class="subfiled clearfix">
                <h2><span>会员列表</span></h2>
            </div>
<!--插入内容 start-->
<div class="page-container">
	<div class="text-c">
		 <span class="select-box inline">
		<select id="userSelect"  class="select">
			<option value="0">全部会员</option>
            <option value="1">在线会员</option>
            <option value="2">离线会员</option>
            <option value="3">启用会员</option>
            <option value="4">停用会员</option>
		</select>
		</span> 
		<input id="userName" type="text" class="input-text" style="width:250px;text-indent: 5px;" placeholder="输入会员账号" >
		<button id="selectBtn" type="submit" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','user_add.jsp','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有：<strong id="userCount">0</strong> 个会员</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="15"><input type="checkbox" name="" value=""></th>
				<th>ID</th>
				<th>会员账号</th>
				<th>会员名字</th>
				<th>账户余额</th>
				<th>积分</th>
				<th>手机号码</th>
				<th>Q Q</th>
				<th>电子邮箱</th>
				<th>最近登录时间</th>
				<th>登录地址</th>
				<!-- <th>注册时间</th> -->
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	                    <div class="widget-foot">

                     
                        <ul class="pagination pull-right" style="font-size: 13px;height: 45px;line-height: 45px;">
						  
                        </ul>
                     
                      <div class="clearfix"></div> 

                    </div>
	</div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/My97DatePicker/WdatePicker.js"></script><!--日期功能-->
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../thirdParty/js/H-ui.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
	//全局变量
	var pageSize=10;//每页显示10条
	var tj="WHERE id<>0 ";//查询条件 	
	$(function(){
		tj+=" ORDER BY `regDate` desc";
	 	getUserList();		
	});
	//账号查询
	$("#selectBtn").click(function(){
		 var userName=$("#userName").val();
		 var startTime=$("#datemin").val();
		 var endTime=$("#datemax").val();
		 tj="WHERE id<>0";//初始化
		 if(userName!=""&&userName!=null){
			 tj+=" and name like '%"+userName+"%'";//模糊查询	
		 }
		 getUserList();
	});
	//分类查询
	var selectId=0;
	$("#userSelect").change(function () {  
		selectId = $(this).children('option:selected').val();
		tj="WHERE id<>0 ";//初始化
		if(selectId==1){
	   		tj+=" and islogin=1 and `status`=0 ";//在线
	   	}else if(selectId==2){
	   		tj+=" and islogin=0 and `status`=0 ";//离线
	   	}else if(selectId==3){
	   		tj+=" and `status`=0";//启用
	   	}else if(selectId==4){
	   		tj+=" and `status`=1";//停用
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
		$("#userCount").text(data.count);//共多少条数据
		var html="";		
		for ( var i = 0; i < data.userList.length; i++) {
			html+='<tr class="text-c">';
			html+='<td><input type="checkbox" value="1" name=""></td>';
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
			
			if(data.userList[i].loginDate!=null){
				data.userList[i].loginDate=new Date(data.userList[i].loginDate).format("yyyy-MM-dd hh:mm:ss");
				html+='<td>'+data.userList[i].loginDate+'</td>';
			}else{
				html+='<td></td>';
			}
			
			if(data.userList[i].ip!=null){
				html+='<td>'+data.userList[i].ip+'</td>';
			}else{
				html+='<td></td>';
			}
			//data.userList[i].regDate=new Date(data.userList[i].regDate).format("yyyy-MM-dd hh:mm:ss");
			//html+='<td>'+data.userList[i].regDate+'</td>';
			if(data.userList[i].status==1){
				html+='<td class="td-status"><span class="label label-danger radius">停用</span></td>';
				html+='<td class="td-manage"><a style="text-decoration:none" onClick="member_start('+data.userList[i].id+','+pageIndex+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>';
			}else{
				if(data.userList[i].islogin==0){					
					html+='<td class="td-status"><span class="label label-defaunt radius">离线</span></td>';		
				}else if(data.userList[i].islogin==1){
					html+='<td class="td-status"><span class="label label-success radius">在线</span></td>';			
				}
				html+='<td class="td-manage"><a style="text-decoration:none" onClick="member_stop('+data.userList[i].id+','+pageIndex+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>';
			}
			html+='<a title="编辑" href="javascript:;" onclick="member_edit('+data.userList[i].id+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe63f;</i></a>';
			html+='<a title="删除" href="javascript:;" onclick="member_del('+data.userList[i].id+','+pageIndex+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
			html+='</td></tr>';			
		}
		$("tbody").html(html);
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

/*用户-添加*/
function member_add(title,url,w,h){
			layer.open({
			  type: 2,
			  title:title,
			  area: [w+'px', h+'px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: url
			});
}
/*用户-查看*/
function member_show(title,url,id,w,h){
			layer.open({
			  type: 2,
			  title:title,
			  area: [w+'px', h+'px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: url
			});
}
/*用户-停用*/
function member_stop(id,pageIndex){
	layer.confirm('确认要停用吗？',function(index){
				var status=1;
				var json={"id":id,"status":status};
				$.post("../../../User_Status_Servlet",json,function(data){
					if(data=="ok"){
						layer.msg('已停用!',{icon: 5,time:1000});
						getUserList(pageIndex);
					}else{
						layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
					}
				});
	});
	
}

/*用户-启用*/
function member_start(id,pageIndex){
	layer.confirm('确认要启用吗？',function(index){
		var status=0;
		var json={"id":id,"status":status};
		$.post("../../../User_Status_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('已启用!',{icon: 6,time:1000});
				getUserList(pageIndex);
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
		});
				
				
	});
}
/*用户-编辑*/
function member_edit(id){
			layer.open({
			  type: 2,
			  title:'编辑',
			  area: ['800px', '500px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'user_update.jsp?id='+id
			});
}
/*用户-删除*/
function member_del(id,pageIndex){
	layer.confirm('确认要删除吗？',function(index){
		var json={"id":id};
		$.post("../../../User_Del_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('已删除!',{icon:1,time:1000});
				getUserList(pageIndex);
			}else{
				layer.msg('删除失败!',{icon:5,time:1000});
			}
		});
			
	});
}


</script> 
<!--插入内容 end--> 
</div>  
</body>
</html>