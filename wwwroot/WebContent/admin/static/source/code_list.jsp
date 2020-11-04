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
<link rel="stylesheet" href="../../common/css/title.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
    <!--layer-->
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<link rel="stylesheet" href="../../../layer/page/layui.css"  media="all">
<title>源码列表</title>
</head>
<body>
<div id="saper-container">
            <div class="subfiled clearfix" >
              <h2><span id="codeTitle">源码列表</span></h2>
            </div>
<!--插入内容 start-->
<div class="page-container">
	<div class="text-c">
	 <span class="select-box inline">
		<select id="codeType"  class="select">
			<option value="0">全部分类</option>
            <option value="1">JSP源码</option>
            <option value="2">PHP源码</option>
            <option value="3">ASP源码</option>
		</select>
		</span> 
		日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" id="codeName"  placeholder=" 源码名称" style="width:250px" class="input-text">
		<button  id="selectBtn" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜源码</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" href="code_add.jsp?sname=add&pageIndex=1"><i class="Hui-iconfont">&#xe600;</i> 添加源码</a></span> <span class="r">共有数据：<strong id="codeCount">0</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="15"><input type="checkbox" name="" value=""></th>
					<th>ID</th>
					<th>缩略图</th>
					<th>标题</th>
					<th>分类</th>
					<th>价格</th>
					<th>发布者</th>
					<th>更新时间</th>
					<th>浏览次数</th>
					<th>下载次数</th>
					<th>发布状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<!-- 源码列表 -->
			</tbody>


		</table>
		 <div id="codePage" style="width:100%;height:35px; line-height:35px;float:right; text-align:center;">		 
		<div class="layui-box layui-laypage layui-laypage-default" id="laypage">
		<!--源码分页 -->
	    </div>
	    </div>
	</div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/My97DatePicker/WdatePicker.js"></script><!--日期功能-->
<script type="text/javascript" src="../thirdParty/js/H-ui.min.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="js/code.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
//全局变量
var status="all";//默认
var pageSize=5;//每页显示5条
var tj="WHERE id<>0 ";//查询条件 

 $(function(){
	 status=GetQueryString("stu");
	 if(status!="all"){
	  tj+=" and `STATUS`="+status;//条件
	 }
	if(status=='0'){
	 	$("#codeTitle").text("待审核源码");
	}else if(status=='1'){
	 	$("#codeTitle").text("出售中源码");
	}else if(status=='2'){
	 	$("#codeTitle").text("仓库中源码");
	}else if(status=='3'){
	 	$("#codeTitle").text("不合格源码");
	}else{
	 	$("#codeTitle").text("源码列表");
	}
	//获取源码列表
	 tj+=" ORDER BY `update` DESC";
	 getCodeList();
 });
 //选择源码类别
 var typeId=0;
 $("#codeType").change(function () {  
	 typeId = $(this).children('option:selected').val();  
     if(typeId!=0){
    	tj="WHERE id<>0 ";//初始化
    	if(status!="all"){
    		tj+=" and `STATUS`="+status;//条件
    	}
		tj+=" and typeId="+typeId;
		tj+=" ORDER BY `update` DESC";
		getCodeList();
		
     }else{
    	 tj="WHERE id<>0";//初始化
    	 if(status!="all"){
     		tj+=" and `STATUS`="+status;//条件
     	 }
    	 tj+=" ORDER BY `update` DESC";
    	 getCodeList();
     }
     
 }); 
 //点击搜索源码
 $("#selectBtn").click(function(){
	 var codeName=$("#codeName").val();
	 var startTime=$("#logmin").val();
	 var endTime=$("#logmax").val();
	 tj="WHERE id<>0";//初始化
	 if(codeName!=""&&codeName!=null){
		 tj+=" and title like '%"+codeName+"%'";//模糊查询	
	 }
	 if(startTime!=""&&startTime!=null){
		 tj+=" and `update` > '"+startTime+" 00:00:00'";//起始时间
	 }
	 if(endTime!=""&&endTime!=null){
		 tj+=" and `update` < '"+endTime+" 23:59:59'";//结束时间
	 }
	 tj+=" ORDER BY `update` asc";
	 getCodeList();
 });
 //获取源码列表
 function getCodeList(pageIndex){
	 if(pageIndex==null||pageIndex==""){
		pageIndex=1;//默认页码
	 }	 
	 var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
	 $.getJSON("../../../Code_List_Servlet",json,function(data){
		 $("#codeCount").text(data.count);//共多少条数据
		 var html="";		 
		 for(var i=0;i<data.codeList.length;i++){
			 html+='<tr class="text-c">';
			 html+='<td><input type="checkbox" value="" name=""></td>';
			 html+='<td>'+data.codeList[i].id+'</td>';
			 html+='<td class="imgtd"><img src="../../../'+data.codeList[i].tbPath+'" /></td>';
			 html+='<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="code_edit('+data.codeList[i].id+')" title="查看">'+data.codeList[i].title+'</u></td>';
			 html+='<td>'+data.codeList[i].typeName+'</td>';
			 html+='<td class="text-l">'+data.codeList[i].price+'</td>';
				//发布者
				if(data.codeList[i].adminName!=null&&data.codeList[i].adminName.length>0){
					 html+='<td style="color:red;">'+data.codeList[i].adminName+'</td>';
				}else if(data.codeList[i].userNick!=null&&data.codeList[i].userNick.length>0){
					html+='<td>'+data.codeList[i].userNick+'</td>';
				}else if(data.codeList[i].userName!=null&&data.codeList[i].userName.length>0){
					html+='<td>'+data.codeList[i].userName+'</td>';
				}else{
					html+='<td>佚名</td>';
				}
			 data.codeList[i].update=new Date(data.codeList[i].update).format("yyyy-MM-dd hh:mm:ss");
			 html+='<td>'+data.codeList[i].update+'</td>';
			 html+='<td>'+data.codeList[i].lookCount+'</td>';
			 html+='<td>'+data.codeList[i].downCount+'</td>';
			 //状态
			 if(data.codeList[i].status==0){//待审核
				 html+='<td class="td-status"><span class="label label-default radius">待审核</span></td>';	
				 html+='<td class="f-14 td-manage"><a style="text-decoration:none" onClick="code_shenhe('+data.codeList[i].id+','+pageIndex+')" href="javascript:;" title="审核">审核</a>';	
			 }else if(data.codeList[i].status==1){//出售中
				 html+='<td class="td-status"><span class="label label-success radius">出售中</span></td>';
				 html+='<td class="f-14 td-manage"><a style="text-decoration:none" onClick="code_stop('+data.codeList[i].id+','+pageIndex+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>';
			 }else if(data.codeList[i].status==2){//已下架
				 html+='<td class="td-status"><span class="label label-defaunt radius">已下架</span></td>';
				 html+='<td class="f-14 td-manage"><a style="text-decoration:none" onClick="code_start('+data.codeList[i].id+','+pageIndex+')" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe603;</i></a>';
			 }else{//不合格
				 html+='<td class="td-status"><span class="label label-danger radius">不合格</span></td>';
				 html+='<td class="f-14 td-manage"><a class="c-primary" onClick="code_shenqing('+data.codeList[i].id+','+pageIndex+')" href="javascript:;" title="申请上线">申请上线</a>';
			 }			
			 html+='<a style="text-decoration:none" class="ml-5" onClick="code_edit('+data.codeList[i].id+','+pageIndex+')" href="javascript:;" title="编辑">';
			 html+='<i class="Hui-iconfont">&#xe6df;</i></a> ';
			 html+='<a style="text-decoration:none" class="ml-5" onClick="code_del('+data.codeList[i].id+','+pageIndex+')" href="javascript:;" title="删除">';
			 html+='<i class="Hui-iconfont">&#xe6e2;</i></a></td>';
			 html+='</tr>';	
			 
		 }
		 $("tbody").html(html);
			//分页
			var codePage="";
			if(pageIndex>1){
			codePage+='<a href="javascript:void(0)" onclick="getCodeList('+(data.pageIndex-1)+')" class="layui-laypage-prev" >上一页</a>';
			}else{
				codePage+='<a href="javascript:void(0)" class="layui-laypage-prev layui-disabled" >上一页</a>';				
			}
			for(var i=0;i<data.allPage-1;i++){
				
				if((i+1)<8){
					codePage+='<a href="javascript:void(0)" onclick="getCodeList('+(i+1)+')">'+(i+1)+'</a>';
				}else{
					codePage+='<span class="layui-laypage-spr">…</span>';
					break;
				}
			}
			if(pageIndex<data.allPage){
				codePage+='<a id="page'+(i+1)+'" href="javascript:void(0)" onclick="getCodeList('+data.allPage+')">'+data.allPage+'</a>';
				codePage+='<a href="javascript:void(0)" onclick="getCodeList('+(data.pageIndex+1)+')" class="layui-laypage-next" >下一页</a>';
			}else{
				codePage+='<a href="javascript:void(0)"  class="layui-laypage-next layui-disabled" >下一页</a>';
			}
			codePage+='<span class="layui-laypage-limits"></span>';
			codePage+='<span class="layui-laypage-skip">当前第 '+pageIndex+' 页，到第<input type="text" id="pageInput" min="1" value="" class="layui-input">页<button href="javascript:void(0)" onclick="gotoPage()" type="button" class="layui-laypage-btn">确定</button></span>';
			$("#laypage").html(codePage);
	 });
 }
	//跳到第几页
	function gotoPage(){
		var num=$("#pageInput").val();
		getCodeList(num);
	}

</script> 
<!--插入内容 end--> 
</div> 
</body>
</html>