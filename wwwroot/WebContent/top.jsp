<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="config/website.jsp" %>
<%@ include file="top_data.jsp" %>
<!doctype html>
<html><head>
<meta charset="utf-8">
<title><%=web_title %></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<link rel="stylesheet" id="skin" type="text/css" href="">
</head>
<body>
<!--top-->
<div id="top">
	<div id="topbox">
		<div class="top_left">
			<ul>
			<li onclick="SetHome(this,'<%=web_www %>');">设为首页</li>
			<li onclick="AddFavorite('<%=web_name %>',location.href)">收藏本站</li>
			</ul>
		</div>
		<div class="top_right">
		<ul>
        <li class="changeSkin" title="点击更换皮肤">换肤</li>
         <li><a href="#">留言板</a></li>
		<li><a href="#">我的收藏</a></li>          
        </ul>         	 			
		</div>
    </div>
</div>
<div id="myskin">
	<div id="skinbox">
        <ul>
            <li>
                <img src="skin/images/ico1.jpg"/>
                <p>哆啦A梦</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico2.jpg"/>
                <p>杨幂</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico3.jpg"/>
                <p>王者荣耀</p>
                <span></span>
            </li>
            <li style="margin-right:0px;">
                <img src="skin/images/ico4.jpg"/>
                <p>夏日海滩</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico5.jpg"/>
                <p>春意盎然</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico6.jpg"/>
                <p>赵丽颖</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico7.jpg"/>
                <p>Angelababy</p>
                <span></span>
            </li>
             <li style="margin-right:0px;">
                <img src="skin/images/ico8.jpg"/>
                <p>清凉一夏</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico9.jpg"/>
                <p>Hello Kitty</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico10.jpg"/>
                <p>萌女神</p>
                <span></span>
            </li>
            <li>
                <img src="skin/images/ico11.jpg"/>
                <p>可爱阿狸</p>
                <span></span>
            </li>
             <li style="margin-right:0px;">
                <img src="skin/images/ico12.jpg"/>
                <p>初音未来</p>
                <span></span>
            </li>
        </ul>
        <div>
        	<dl>
        	<dt><img id="previewPic" src="images/skin.png"/></dt>
            <dd>背景皮肤预览效果</dd>
            <dd><input id="skin_save" type="button" value="保存"/><input id="skin_close" type="button" value="关闭"/></dd>
            </dl>
        </div>
    </div>
</div>
<div id="allPage">
<!--header-->
<div id="header">
	<div id="logo"><a href="index.jsp"><img src="images/logo.png"/></a></div>
    <div id="search">
    <div class="search_txet"> <input type="text" id="searchTxet"  placeholder="搜索资源…"/>
    <ul></ul>
    </div>
    <div onclick="search();" class="search_btn">搜索</div>
    </div>
 	<div id="tag">
    	<dl class="beat">
    		<dt><a href="reg.html"><img src="images/join.png"/> </a></dt>
    		<dd>加入会员</dd>
    	</dl>
    	<dl class="beat">
    		<dt><a href="#"><img src="images/email.png"/> </a></dt>
    		<dd>联系我们</dd>
   		</dl>
    	<dl class="beat">
    		<dt><a href="#"><img src="images/error.png"/> </a></dt>
   			 <dd>失效通知</dd>
    	</dl>
   		<dl class="beat">
   	 		<dt><a href="#"><img src="images/idc.png"/> </a></dt>
    		<dd>神码数据</dd>
    	</dl>
    	<dl id="topLogin">
            <dt class="headPic"><a href="#"><img id="headPic" src="<%=topPic %>" /> </a></dt>
     		<dd class="headFont"><span id="nick"><%=topUserName %></span><%=topUserMenu %></dd>
    	</dl>
         <div id="userNav"> 
					<a  href="javascript:void(0)" onClick="openUserBox(0)"><span class="lnIco Ico_user"></span>会员中心</a>
					<a  href="javascript:void(0)" onClick="openUserBox(1)"><span class="lnIco Ico_recharge"></span>账户充值</a>
					<a  href=""><span class="lnIco Ico_msg"></span>消息(<span id="newMsg">0</span>)</a>
					<a  href="javascript:void(0)" onClick="loginOut()"><span class="lnIco Ico_exit"></span>退出</a>
			</div>
    </div>
    <div id="nav">
        <ul>
        <li class="current"><a href="index.jsp">网站首页</a></li>
        <li><a href="#">精品源码</a></li>
        <li><a href="#">会员专享</a></li>
        <li><a href="#">站长工具</a></li>
        <li><a href="#">软件下载</a></li>
        <li><a href="#">技术文档</a></li>
        <li><a href="#">行业资讯</a></li>
        <li><a href="#">聊天频道</a></li>
        <li style=" margin-right:0px;"><a href="#">手机客户端</a></li>
        </ul>
    </div>
</div>
<!--JavaScript jQuery start-->
<script type="text/javascript" src="jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/top.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
	//会员登录
	$("#topLogin").click(function(){
		if(<%=status%>==0){//没登录，就弹出登录窗
			//iframe层-禁滚动条
			layer.open({
			  type: 2,
			  title:'会员登录',
			  area: ['533px', '400px'],
			  skin: 'layui-layer-rim', //加上边框
			  content: ['login.html?page=top', 'no'],
			}); 
		}
	});
	//搜索资源
	function search(){
		var searchTxet=$("#searchTxet").val();
		if(searchTxet==null||searchTxet==""){
			layer.msg('请输入要搜索的资源名称！', {icon: 3});
			return;
		}
		var tj=" WHERE `STATUS`=1 and title like '%"+searchTxet+"%'";//模糊查询	
		pageIndex=1;//从1开始
		pageSize=5;//显示5条
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};	
		$.getJSON("Code_List_Servlet",json,function(data){
			
			if(data!=null){
				//显示ul
				$(".search_txet ul").show();
			}
			var html="";
			for(var i=0;i<data.codeList.length;i++){
				html+='<li><a href="code.jsp?cid='+data.codeList[i].id+'" >'+data.codeList[i].title+'</a></li>';			
			}	
			$(".search_txet ul").html(html);
		});
		
		//点击链接时，下拉列表隐藏
		$(".search_txet ul li").click(function(){
			$(".search_txet ul").hide();
		});
		//当鼠标点击其他位置，下拉列表隐藏
		$(document).click(function(){
			$(".search_txet ul").hide();
		});
		
	}
</script>
<!--JavaScript jQuery end-->
</body>
</html>
