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
 
<title>存款管理</title>
<style>
/*新图标样式*/
.newIco{width:20px;height:20px;padding:0;}
.text-c td input{margin-top:5px;}
</style>
</head>
<body>
<div id="saper-container">
            <div class="subfiled clearfix" >
                   <h2><span>存款管理</span></h2>
            </div>

<!--插入内容 start-->
  
  	<div class="text-c" style="margin-top:20px;">
		<span class="select-box inline">
	 	<select name="" class="select">
			<option value="0">全部存款</option>
            <option value="1">存款成功</option>
            <option value="2">存款失败</option>
		</select>
		</span>
		日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 输入会员账号" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>

<div class="widget" >

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
                          <th>充值编号</th>
                          <th>会员账号</th>
                          <th>存款金额</th>
                          <th>存入时间</th>
                          <th>充值方式</th>
                          <th>充值状态</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>

                       <!--  <tr class="text-c">
                          <td><input type="checkbox" value="" name="" ></td>
                          <td>1</td>
                          <td>20171106251487</td>
                          <td>qq1234</td>
                          <td>500</td>
                          <td>2017-11-06 20:00:00</td>
                          <td>微信支付</td>
                          <td><span class="label label-success">成功</span></td>
                          <td>
							  <button class="btn btn-xs btn-primary newIco"><i class="Hui-iconfont">&#xe631;</i></button>
                              <button class="btn btn-xs btn-warning newIco" ><i class="Hui-iconfont">&#xe6df;</i></button>
                              <button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>                        
                          </td>
                        </tr>


                        <tr class="text-c">
                         <td><input type="checkbox" value="" name=""></td>
                          <td>2</td>
                          <td>20171103454646</td>
                          <td>yun555</td>
                          <td>100</td>
                          <td>2017-11-06 20:00:00</td>
                          <td>网银在线</td>
                          <td><span class="label label-danger">失败</span></td>
                            <td>
							  <button class="btn btn-xs btn-primary newIco"><i class="Hui-iconfont">&#xe631;</i></button>
                              <button class="btn btn-xs btn-warning newIco"><i class="Hui-iconfont">&#xe6df;</i></button>
                              <button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>                        
                          </td>
                        </tr>

                        <tr class="text-c">
                          <td><input type="checkbox" value="" name=""></td>
                          <td>3</td>
                          <td>20171103454554</td>
                          <td>qq1234</td>
                          <td>10</td>
                          <td>2017-11-06 20:00:00</td>
                          <td>支 付 宝</td>
                          <td><span class="label label-warning">充值中</span></td>
                          <td>
						      <button class="btn btn-xs btn-primary newIco"><i class="Hui-iconfont">&#xe631;</i></button>
                              <button class="btn btn-xs btn-warning newIco"><i class="Hui-iconfont">&#xe6df;</i></button>
                              <button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>                        
                          </td>
                        </tr>  -->                                                          

                      </tbody>
                    </table>

                    <div class="widget-foot">  
						<span>存款总金额：0.00元，成功：0.00元，失败：0.00元</span>						
                        <ul class="pagination pull-right">				  
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
var tj="WHERE id<>0 ";//查询条件 	
$(function(){
	tj+=" ORDER BY `date` desc";
	getList();		
});
function getList(pageIndex){
	if(pageIndex==null||pageIndex==""){
		pageIndex=1;//默认页码
	}
	 var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
	$.getJSON("../../../CunKuan_List_Servlet",json,function(data){		
		var html="";
		for(var i = 0 ;i < data.ckList.length ; i++){
			html+='<tr class="text-c">';
			html+='<td><input type="checkbox" value="" name=""></td>';
			html+='<td>'+data.ckList[i].id+'</td>';
			html+='<td>'+data.ckList[i].number+'</td>';
			html+='<td>'+data.ckList[i].name+'</td>';
			html+='<td>'+data.ckList[i].money+'</td>';
			data.ckList[i].date=new Date(data.ckList[i].date).format("yyyy-MM-dd hh:mm:ss");
			html+='<td>'+data.ckList[i].date+'</td>';
			if(data.ckList[i].mode==0){
				html+='<td>网银在线</td>';
			}else if(data.ckList[i].mode==1){
				
				html+='<td>支付宝</td>';
			}else if(data.ckList[i].mode==2){
				html+='<td>微信支付</td>';
			}
			if(data.ckList[i].status==0){
				html+='<td><span class="label label-warning">充值中</span></td>';
			}else if(data.ckList[i].status==1){
				html+='<td><span class="label label-success">成功</span></td>';
			}else if(data.ckList[i].status==2){
				html+='<td><span class="label label-danger">失败</span></td>';
			}
			html+='<td>';
			html+='<button href="javascript:;" onclick="edit('+data.ckList[i].id+')" class="btn btn-xs btn-primary newIco"><i class="Hui-iconfont">&#xe631;</i></button>&nbsp;&nbsp;';
			html+='<button href="javascript:;" onclick="del('+data.ckList[i].id+','+pageIndex+')"  class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>';
			html+='</td>';
			html+='</tr>'; 										
		}
		$("tbody").html(html);
		//分页
		  var page="";
		 page+='<p align="center">';
		 page+='当前页数:['+pageIndex+'/'+data.allPage+']&nbsp; ';
		 if(pageIndex>1){
			page+='	<a href="javascript:void(0)" onclick="getList(1)">首页</a>'; 
			page+='	<a href="javascript:void(0)" onclick="getList('+(data.pageIndex-1)+')">上一页</a>';
		 }
		 if(pageIndex<data.allPage){
			page+='	<a javascript:void(0)" onclick="getList('+(data.pageIndex+1)+')">下一页</a> ';
			page+='	<a javascript:void(0)" onclick="getList('+data.allPage+')">末页</a>';
		 }
			page+='</p>';
		$(".pagination").html(page); 
	});
};
/*删除*/
function del(id,pageIndex){
	layer.confirm('确认要删除吗？',function(index){
		var json={"id":id};
		$.post("../../../Cunkuan_Del_Servlet",json,function(data){
			if(data=="ok"){
				layer.msg('已删除!',{icon:1,time:1000});
				getList(pageIndex);
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