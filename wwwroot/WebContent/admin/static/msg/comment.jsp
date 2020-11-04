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
<link rel="stylesheet" type="text/css" href="../../common/css/title.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<link rel="stylesheet" href="../../../layer/page/layui.css"  media="all">
<title>评论管理</title>
<style>
.userName{position:relative;top:-15px;left:5px;color:red;width:30px;max-width:30px;overflow: hidden;white-space: nowrap; text-overflow: ellipsis;}
</style>
</head>
<body>
<div id="saper-container">
            <div class="subfiled clearfix" >
                <h2><span>评论列表</span></h2>
            </div>
<!--插入内容 start-->
<div class="page-container">
	<div class="text-c"> 
		<span class="select-box inline">
			<select id="mentSelect"  class="select">
				<option value="0">全部评论</option>
	            <option value="1">待审核</option>
	            <option value="2">已通过</option>
	            <option value="3">不合格</option>
			</select>
		</span> 
		日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入关键词" id="selectText">
		<button type="submit" class="btn btn-success radius" id="selectBtn" ><i class="Hui-iconfont">&#xe665;</i> 搜评论</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有：<strong id="mentCount">0</strong> 条评论</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="60">ID</th>
					<th width="150">用户</th>
					<th>评论内容</th>
					<th>回复内容</th>
					<th width="150">评论时间</th>
					<th>状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div style="width:100%;height:35px; line-height:35px;float:right; text-align:center;">		 
		<div class="layui-box layui-laypage layui-laypage-default" id="laypage">
		<!--分页 -->
	    </div>
	    </div>
	</div>
</div>
<script type="text/javascript" src="../../../jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/My97DatePicker/WdatePicker.js"></script><!--日期功能-->
<script type="text/javascript" src="../thirdParty/js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/js/H-ui.min.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
	//全局变量
	var pageSize=5;//每页显示5条
	var tj="WHERE id<>0 ";//查询条件 
	$(function(){
		tj+=" ORDER BY `mentDate` desc";
		getMentList();
	});
	//分类查询
	var selectId=0;
	$("#mentSelect").change(function () {  
		selectId = $(this).children('option:selected').val();
		tj="WHERE id<>0 ";//初始化
		if(selectId==1){
	   		tj+=" and  `status`=0 ";//待审核
	   	}else if(selectId==2){
	   		tj+=" and  `status`=1 ";//已通过
	   	}else if(selectId==3){
	   		tj+=" and  `status`=2 ";//不合格
	   	}
		
		tj+=" ORDER BY `mentDate` desc";
		getMentList();		
	    
	}); 
	//点击搜索
	 $("#selectBtn").click(function(){
		 var selectText=$("#selectText").val();
		 var startTime=$("#datemin").val();
		 var endTime=$("#datemax").val();
		 tj="WHERE id<>0";//初始化
		 if(selectText!=""&&selectText!=null){
			 tj+=" and content like '%"+selectText+"%'";//模糊查询	
		 }
		 if(startTime!=""&&startTime!=null){
			 tj+=" and mentDate > '"+startTime+" 00:00:00'";//起始时间
		 }
		 if(endTime!=""&&endTime!=null){
			 tj+=" and mentDate < '"+endTime+" 23:59:59'";//结束时间
		 }
		 tj+=" ORDER BY mentDate asc";
		 getMentList();	
	 });
	//获取评论列表
	function getMentList(pageIndex){
		 if(pageIndex==null||pageIndex==""){
				pageIndex=1;//默认页码
		 }
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
		$.getJSON("../../../Ment_List_Servlet",json,function(data){
				$("#mentCount").text(data.count);//共多少条数据
				var html="";
				for(var i=0;i<data.mentList.length;i++){				
					html+='<tr class="text-c">';
					html+='<td><input type="checkbox" ></td>';
					html+='<td class="mentId">'+data.mentList[i].id+'</td>';
					html+='<td class="text-l"><a href="javascript:;" onclick="comment_show('+data.mentList[i].uid+')"><i class="avatar size-L radius">';
					html+='<img alt="" src="../../../'+data.mentList[i].userPic+'"></i>';
					if(data.mentList[i].userNick!=null&&data.mentList[i].userNick.length>0){
						html+='<span class="userName" >'+data.mentList[i].userNick+'</span></a></td>';
					}else{
						html+='<span class="userName" >'+data.mentList[i].userName+'</span></a></td>';
					}	
					html+='<td class="text-l"><div class="c-999 f-12 mentContent">'+data.mentList[i].content+'</div></td>';									
					if(data.mentList[i].reply!=null&&data.mentList[i].reply.length>0){
						html+='<td class="text-l"><div class="c-999 f-12 mentReply">'+data.mentList[i].reply+'</div></td>';
					}else{
						html+='<td class="text-l"><div class="c-999 f-12 mentReply"></div></td>';
					}					
					data.mentList[i].mentDate=new Date(data.mentList[i].mentDate).format("yyyy-MM-dd hh:mm:ss");
					html+='<td class="text-l">'+data.mentList[i].mentDate+'</td>';
					if(data.mentList[i].status==1){
						html+='<td><span class="label label-success">已通过</span></td>';
					}else if(data.mentList[i].status==2){
						html+='<td><span class="label label-danger">不合格</span></td>';
					}else{
						html+='<td><span class="label label-default">待审核</span></td>';
					}
					html+='<td class="td-manage">';
					if(data.mentList[i].status==0){
						html+='<a style="text-decoration:none" onclick="ment_shenhe('+data.mentList[i].id+','+pageIndex+')" href="javascript:;" title="审核">审核</a>&nbsp;&nbsp;';
					}
					if(data.mentList[i].userNick!=null&&data.mentList[i].userNick.length>0){
						html+='<a title="回复" href="javascript:;" onclick="ment_reply($(this)'+','+pageIndex+')" style="text-decoration:none"><i class="Hui-iconfont">&#xe603;</i></a>';
					}else{
						html+='<a title="回复" href="javascript:;" onclick="ment_reply($(this)'+','+pageIndex+')" style="text-decoration:none"><i class="Hui-iconfont">&#xe603;</i></a>';
					}
					
					html+='<a title="删除" href="javascript:;" onclick="ment_del('+data.mentList[i].id+','+pageIndex+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>';
					html+='</tr>';
					
				}
				$("tbody").html(html);

			//分页
			var page="";
			if(pageIndex>1){
				page+='<a href="javascript:void(0)" onclick="getMentList('+(data.pageIndex-1)+')" class="layui-laypage-prev" >上一页</a>';
			}else{
				page+='<a href="javascript:void(0)" class="layui-laypage-prev layui-disabled" >上一页</a>';				
			}
			for(var i=0;i<data.allPage-1;i++){
				
				if((i+1)<8){
					page+='<a href="javascript:void(0)" onclick="getMentList('+(i+1)+')">'+(i+1)+'</a>';
				}else{
					page+='<span class="layui-laypage-spr">…</span>';
					break;
				};
			}
			if(pageIndex<data.allPage){
				page+='<a id="page'+(i+1)+'" href="javascript:void(0)" onclick="getMentList('+data.allPage+')">'+data.allPage+'</a>';
				page+='<a href="javascript:void(0)" onclick="getMentList('+(data.pageIndex+1)+')" class="layui-laypage-next" >下一页</a>';
			}else{
				page+='<a href="javascript:void(0)"  class="layui-laypage-next layui-disabled" >下一页</a>';
			}
			page+='<span class="layui-laypage-limits"></span>';
			page+='<span class="layui-laypage-skip">当前第 '+pageIndex+' 页，到第<input type="text" id="pageInput" min="1" value="" class="layui-input">页<button href="javascript:void(0)" onclick="gotoPage()" type="button" class="layui-laypage-btn">确定</button></span>';
			$("#laypage").html(page);

		});
	}
	//跳到第几页
	function gotoPage(){
		var num=$("#pageInput").val();
		getMentList(num);
	}
	/*评论-回复*/
	function ment_reply(ment,pageIndex){
		var obj=ment.parents("tr");
		var id=obj.find(".mentId").html();
		var name=obj.find(".userName").html();
		var content=obj.find(".mentContent").html();
		var reply=obj.find(".mentReply").html();
		layer.open({
			type: 2,
			title:'回复评论',
			area: ['800px', '500px'],
			fixed: false, //不固定
			maxmin: true,
			content: 'comment_reply.jsp?id='+id+'&name='+name+'&content='+content+'&reply='+reply+'&pageIndex='+pageIndex
		});	
	}
	/*评论-审核*/
	function ment_shenhe(id,pageIndex){
		layer.confirm('审核评论？', {
			btn: ['通过','不通过','取消'], 
			shade: false,
			closeBtn: 0
		},
		function(){	
			var status=1;
			var json={"id":id,"status":status};
			$.post("../../../Ment_Update_Servlet",json,function(data){
				
				if(data=="ok"){
					layer.msg('已通过!',{icon: 1,time:1000});
					getMentList(pageIndex);
				}else{
					layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
				}
				
			});
		},
		function(){
			var status=2;
			var json={"id":id,"status":status};
			$.post("../../../Ment_Update_Servlet",json,function(data){
				
				if(data=="ok"){
					layer.msg('不合格!',{icon: 5,time:1000});
					getMentList(pageIndex);
				}else{
					layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
				}
				
			});
		});	
	}
	/*评论-删除*/
	function ment_del(id,pageIndex){
		layer.confirm('确认要删除吗？',function(index){
			$.post("../../../Ment_Del_Servlet",{"id":id},function(data){			
				if(data=="ok"){
					layer.msg('已删除!',{icon:1,time:1000});
					getMentList(pageIndex);
				}else{
					layer.msg('删除失败!',{icon: 5,time:1000});
				}
				
			});
		});
	}

</script>
<!--插入内容 end--> 
</div> 
</body>
</html>