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
 
<title>提款管理</title>
<style>
/*新图标样式*/
.newIco{width:20px;height:20px;padding:0;}
.text-c td input{margin-top:5px;}
.cp{cursor:pointer;}
</style>
</head>
<body>
<div id="saper-container">
            <div class="subfiled clearfix" >
                <h2><span>提款管理</span></h2>
            </div>

<!--插入内容 start-->
  
  	<div class="text-c" style="margin-top:20px;">
		<span class="select-box inline">
		<select name="" class="select">
			<option value="0">未处理</option>
            <option value="1">提款成功</option>
            <option value="2">提款失败</option>
			<option value="3">全部提款</option>
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
                          <th>提款编号</th>
                          <th>会员账号</th>
                          <th>提款金额</th>
						  <th>手续费</th>
                          <th>申请时间</th>
						   <th>开户行</th>
						  <th>银行卡号</th>					 
						  <th>开户姓名</th>
						  <th>发行地址</th>
						  <th>状态</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>

                        <!-- <tr class="text-c">
                          <td><input type="checkbox" value="" name="" ></td>
                          <td>1</td>
                          <td>20171106251487</td>
                          <td>qq1234</td>
                          <td>500</td>
						  <td>1</td>
                          <td>2017-11-06 20:00:00</td>
						   <td>中国邮政银行</td>
						  <td>6217996110007667845</td>						 
						  <td>王小飞</td>
						  <td>深圳观澜支行</td>
						  <td><span class="label label-success">成功</span></td>
                          <td>
							  <span class="label label-success cp">确认</span>
							  <span class="label label-warning cp">取消</span> 
							  <button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>   							  
                          </td>
                        </tr>
                        <tr class="text-c">
                          <td><input type="checkbox" value="" name="" ></td>
                          <td>2</td>
                          <td>20171106251487</td>
                          <td>yyy555</td>
                          <td>100</td>
						  <td>1</td>
                          <td>2017-11-06 20:00:00</td>
						   <td>中国农业银行</td>
						  <td>6217996110007567342</td>						 
						  <td>赵平安</td>
						  <td>秀峰支行</td>
						    <td><span class="label label-danger">失败</span></td>
                          <td>
							  <span class="label label-success cp">确认</span>
							  <span class="label label-warning cp">取消</span> 
							  <button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>   							  
                          </td>
                        </tr>
                        <tr class="text-c">
                          <td><input type="checkbox" value="" name="" ></td>
                          <td>3</td>
                          <td>20171106251487</td>
                          <td>opp999</td>
                          <td>800</td>
						  <td>1</td>
                          <td>2017-11-06 20:00:00</td>
						   <td>中国工商银行</td>
						  <td>6217996110002345543</td>						 
						  <td>王乐</td>
						  <td>北京西单支行</td>
						  <td><span class="label label-warning">未处理</span></td>
                          <td>
							  <span class="label label-success cp">确认</span>
							  <span class="label label-warning cp">取消</span> 
							  <button class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>   							  
                          </td>
                        </tr> -->						

                      </tbody>
                    </table>

                    <div class="widget-foot">
					<span>总金额：0.00元，成功：0.00元，失败：0.00元，待审核：0.00元</span>					
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
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
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
	$.getJSON("../../../Tikuan_List_Servlet",json,function(data){		
		var html="";
		for(var i = 0 ;i < data.tkList.length ; i++){
			html+='<tr class="text-c">';
			html+='<td><input type="checkbox" value="" name=""></td>';
			html+='<td>'+data.tkList[i].id+'</td>';
			html+='<td>'+data.tkList[i].number+'</td>';
			html+='<td>'+data.tkList[i].userName+'</td>';
			html+='<td>'+data.tkList[i].money+'</td>';
			html+='<td>'+data.tkList[i].fee+'</td>';
			data.tkList[i].date=new Date(data.tkList[i].date).format("yyyy-MM-dd hh:mm:ss");
			html+='<td>'+data.tkList[i].date+'</td>';
			html+='<td>'+data.tkList[i].bankName+'</td>';
			html+='<td>'+data.tkList[i].cardUser+'</td>';
			html+='<td>'+data.tkList[i].cardNum+'</td>';
			html+='<td>'+data.tkList[i].bankAddress+'</td>';
			if(data.tkList[i].status==0){
				html+='<td><span class="label label-warning">未处理</span></td>';
			}else if(data.tkList[i].status==1){
				html+='<td><span class="label label-success">成功</span></td>';
			}else if(data.tkList[i].status==2){
				html+='<td><span class="label label-danger">失败</span></td>';
			}
			
			html+='<td>';
			html+='<span class="label label-success cp">确认</span>&nbsp;&nbsp;';
			html+='<span class="label label-warning cp">取消</span>&nbsp;&nbsp;';
			html+='<button href="javascript:;" onclick="del('+data.tkList[i].id+','+pageIndex+')" class="btn btn-xs btn-danger newIco"><i class="Hui-iconfont">&#xe6e2;</i> </button>';
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
		$.post("../../../Tikuan_Del_Servlet",json,function(data){
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