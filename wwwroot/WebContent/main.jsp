<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="config/website.jsp" %>
<%@ include file="user_data.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 引入格式化标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html><head>
<meta charset="utf-8">
<title><%=web_title %></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/foucs.css">
<link rel="stylesheet" type="text/css" href="css/login.css"> 
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<link rel="stylesheet" href="layer/page/layui.css"  media="all">
</head>
<body>

<!-- main-->
<div id="main">
	<div id="mian_left">
    	<!--幻灯片 start-->
		<div id="focus">
         	<div class="focus_show" id="flashBox">
                 <ul class="focus_pic" id="flashImg">
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/01.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/02.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/03.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/04.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/05.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/06.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/07.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/01.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/02.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/03.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/04.jpg" alt="" width="700" height="320" /></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/banner/05.jpg" alt="" width="700" height="320" /></a></li>
                </ul>
                <ul class="focus_title" id="flashTitle">
                    <li class="current">
                        <h3><a href="#" target="_blank"></a></h3>
                        <p></p>
                    </li>
                </ul>
        		<div class="focus_switch"><a href="javascript:;" class="icon_prev"></a><a href="javascript:;" class="icon_next"></a></div>
                <ul class="focus_list" id="smallPic">
                    <li class="current"><a href="#" target="_blank">
                        <img src="resource/images/small/01.jpg" alt="冬云云计算程序，IDC互联终端程序源码" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/02.jpg" alt="1905电影网源码，高端大气上档次" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/03.jpg" alt="全新开发易玩网页游戏源码" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/04.jpg" alt="仿7K7K小游戏源码" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/05.jpg" alt="多图网源码" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/06.jpg" alt="7477网页游戏源码" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/07.jpg" alt="王者荣耀视频网源码" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/08.jpg" alt="图片的描述信息" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/09.jpg" alt="图片的描述信息" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/10.jpg" alt="图片的描述信息" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/09.jpg" alt="图片的描述信息" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                    <li><a href="#" target="_blank">
                        <img src="resource/images/small/10.jpg" alt="图片的描述信息" width="60" height="60" /><span class="focus_border"></span><span class="focus_mask"></span></a></li>
                </ul>
    		</div>
		</div>
      	<!--幻灯片end-->
    	<div id="codelist">
      	 <!--源码对象 -->          
        </div>
        <div id="codePage">
        <!--源码分页 --> 
	        <div class="layui-box layui-laypage layui-laypage-default" id="laypage"></div>
       	</div>

    </div>
	<div id="mian_right">
    	<div id="login">
        <h1>Hi，<span id="ap">欢迎光临！</span></h1>
      	<c:choose>
      	<c:when test="${sessionScope.user==null}">
      	       <ul id="notLogged">
       		<li>
            <h5 class="h5_current">账户密码登录</h5>
            <div class="loginbox_1">
            <p><input id="userName" class="loginUser" type="text" placeholder="手机号/邮箱" required/></p>
            <p><input id="userPwd" class="loginPwd" type="password" placeholder="登录密码" required/></p>
            <p class="loginOther"><input type="checkbox" id="autologin" />&nbsp;&nbsp;自动登录 <a href="#">忘记密码？</a><span><a href="reg.jsp" >免费注册>></a></span></p>
            <P class="loginBtn"><input type="submit" id="login_submit" value="登 录"/></P>
            <p class="thirdParty"><span>第三方账户登录：</span>
            <a href="#" class="login_payment_qq"></a>
            <a href="#" class="login_payment_wechat"></a>
            <a href="#" class="login_payment_alipay"></a>
            <a href="#" class="login_payment_wb"></a>
            </p>
            </div>
        	</li>
       		<li>
            <h5 class="h5_default">动态验证码登录</h5>
            <div class="loginbox_2">
           		<div><input id="UserPhone" class="loginPhone" type="text" placeholder="请输入注册手机号" required/></div>
            	<div class="sendsPwd"><input id="sendsPwd" type="text" placeholder="6位动态验证码" required/></div>
            	<div class="sendsmsg"><button href="javascript:void(0)" onclick="sendSms()" id="sendSms">发送动态密码</button></div>
            	<div class="loginOther"><a style="padding-left:0px;" href="#">收不到动态密码？</a><span><a href="reg.jsp" >免费注册>></a></span></div>
                <div class="loginBtn"><input type="submit" id="sends_submit" value="登 录"/></div>
            	<div class="thirdParty"><span>第三方账户登录：</span>
            		<a href="#" class="login_payment_qq"></a>
            		<a href="#" class="login_payment_wechat"></a>
           			<a href="#" class="login_payment_alipay"></a>
            		<a href="#" class="login_payment_wb"></a>
            	</div>
            </div>
        	</li>
        </ul>
      	</c:when>
      	<c:otherwise>
      	    <ul class="loggedln" id="loggedln">
			<li><span class="lnIco Ico_user"></span>
          	 用户账号：<span class="name_user">${user.name}</span></li>
            <li><span class="lnIco Ico_money"></span>
           	 账户余额：<span class="name_money">${user.money+user.avail}</span></li>
            <li><span class="lnIco Ico_logDate"></span>
           	 最近登录：<span class="name_date"><fmt:formatDate value="${user.loginDate}" pattern="YYYY-MM-dd hh:mm:ss"/></span><span class="name_ip">${user.ip}</span></li>
            <li  class="line"></li>
            <li class="key"><p><span class="lnIco Ico_userInfo"></span><a href="javascript:void(0)" onClick="openUserBox(0)">会员中心</a></p>
            <p><span class="lnIco Ico_vip"></span><a href="javascript:void(0)" onClick="openUserBox(2)">升级会员</a></p></li>
            <li class="key"><p><span class="lnIco Ico_update"></span><a href="javascript:void(0)" onClick="openUserBox(3)">修改密码</a></p>
            <p><span class="lnIco Ico_recharge"></span><a href="javascript:void(0)" onClick="openUserBox(1)">在线充值</a></p></li>
			<li class="key"><p><span class="lnIco Ico_purchase"></span><a href="javascript:void(0)" onClick="openUserBox(4)">已购资源</a></p>
			<p><span class="lnIco Ico_record"></span><a href="javascript:void(0)" onClick="openUserBox(5)">佣金提现</a></p></li>
            <li class="key"><p><span class="lnIco Ico_favorite"></span><a href="#">我的收藏</a></p>
            <p><span class="lnIco Ico_browser"></span><a href="javascript:void(0)" onClick="openUserBox(6)">最近浏览</a></p></li>
            <li  class="line"></li>
            <li class="loginBtn"><input type="submit" id="exit" value="安全退出"/></li>
           </ul>
      	</c:otherwise>
      	</c:choose>
  	
        </div>
        <div id="newupdate">
	        <h4>最近更新<img src="images/new_icon.png"/></h4>
	        <ul></ul>
        </div>
   		<div id="ranking">
		<ul>
        <li>
        	<h6 class="h6_current">人气排行榜</h6>
        	<div class="rkbox_1"></div>
        </li>
        <li>
            <h6 class="h6_default">下载排行榜</h6>
        	<div class="rkbox_2"></div>
        </li>
        </ul>
        </div>
	</div>
</div>
<!--JavaScript jQuery start-->
<script type="text/javascript" src="jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/main.js"></script> 
<script type="text/javascript" src="js/foucs.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript" src="js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
	$(function(){		
		//获取源码列表		
		getCodeList();
		//最近更新
		var tj=" WHERE `STATUS`=1 ORDER BY `update` DESC";
		pageIndex=1;//从1开始
		pageSize=20;//显示20条
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
		$.getJSON("Code_List_Servlet",json,function(data){
			var html="";
			for(var i=0;i<data.codeList.length;i++){
				html+='<li><a href="code.jsp?cid='+data.codeList[i].id+'" >'+data.codeList[i].title+'</a></li>';
			}
			$("#newupdate ul").html(html);
		});
		//人气排行榜
		var tj=" WHERE `STATUS`=1 ORDER BY lookCount DESC";
		pageIndex=1;//从1开始
		pageSize=15;//显示15条
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
		$.getJSON("Code_List_Servlet",json,function(data){
			var html="";
			for(var i=0;i<data.codeList.length;i++){
				html+='<p><span>'+(i+1)+'</span><a href="code.jsp?cid='+data.codeList[i].id+'" >'+data.codeList[i].title+'</a></p>';
			}
			$(".rkbox_1").html(html);
			$(".rkbox_1 p span:eq(0)").css("background","#C00");
			$(".rkbox_1 p span:eq(1)").css("background","#09F");
			$(".rkbox_1 p span:eq(2)").css("background","#F60");

		});
		//下载排行榜
		var tj=" WHERE `STATUS`=1 ORDER BY downCount DESC";
		pageIndex=1;//从1开始
		pageSize=15;//显示15条
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
		$.getJSON("Code_List_Servlet",json,function(data){
			var html="";
			for(var i=0;i<data.codeList.length;i++){
				html+='<p><span>'+(i+1)+'</span><a href="code.jsp?cid='+data.codeList[i].id+'" >'+data.codeList[i].title+'</a></p>';
			}
			$(".rkbox_2").html(html);
			$(".rkbox_2 p span:eq(0)").css("background","#639");
			$(".rkbox_2 p span:eq(1)").css("background","#F3F");
			$(".rkbox_2 p span:eq(2)").css("background","#0C0");

		});
	}); 
	
	//用户退出
	$("#exit").click(function(){
		loginOut();
	});	
	//获取源码列表
	function getCodeList(pageIndex){	
		if(pageIndex==null||pageIndex==""){
			pageIndex=1;//默认页码
		}
		var pageSize=5;//每页显示5条
		var tj="WHERE `STATUS`=1 ORDER BY sort DESC,`update` DESC";//查询条件
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
		$.getJSON("Code_List_Servlet",json,function(data){
			var codeItem="";
			for(var i=0;i<data.codeList.length;i++){
				codeItem+='<div class="codeItem">';
				codeItem+='<div class="codeItem_pic"><a href="code.jsp?cid='+data.codeList[i].id+'" ><img src="'+data.codeList[i].tbPath+'" alt="" title=""></a><span>'+data.codeList[i].typeName+'</span></div>';
				codeItem+='<div class="codeItem_content">';
				
				codeItem+='<h3><a href="code.jsp?cid='+data.codeList[i].id+'" >'+data.codeList[i].title+'</a></h3>';
				codeItem+='<p>'+data.codeList[i].summary+'</p>';
				codeItem+='<ul>';
				//头像
				if(data.codeList[i].adminPic!=null&&data.codeList[i].adminPic.length>0){
					codeItem+='<li class="portrait"><a href="#" target="_blank"><img src="'+data.codeList[i].adminPic+'"/></a></li>';
				}else if(data.codeList[i].userPic!=null&&data.codeList[i].userPic.length>0){
					codeItem+='<li class="portrait"><a href="#" target="_blank"><img src="'+data.codeList[i].userPic+'"/></a></li>';
				}else{
					codeItem+='<li class="portrait"><a href="#" target="_blank"><img src="images/member.jpg"/></a></li>';	
				}
				//名称
				if(data.codeList[i].adminName!=null&&data.codeList[i].adminName.length>0){
					codeItem+='<li class="author"><a href="#" >'+data.codeList[i].adminName+'</a></li>';
				}else if(data.codeList[i].userNick!=null&&data.codeList[i].userNick.length>0){
					codeItem+='<li class="author"><a href="#" >'+data.codeList[i].userNick+'</a></li>';
				}else if(data.codeList[i].userName!=null&&data.codeList[i].userName.length>0){
					codeItem+='<li class="author"><a href="#" >'+data.codeList[i].userName+'</a></li>';
				}else{
					codeItem+='<li class="author"><a href="#" >匿名用户</a></li>';
				}
				data.codeList[i].update=new Date(data.codeList[i].update).format("yyyy-MM-dd hh:mm:ss");
				codeItem+=' <li class="releaseDate">'+data.codeList[i].update+'</li> ';                    
				codeItem+='<li><a href="code.jsp?cid='+data.codeList[i].id+'"><img class="browse_icon" src="images/browse.png"/><span id="browse">'+data.codeList[i].lookCount+'</span>围观</a></li>';
				codeItem+=' <li><a href="code.jsp?cid='+data.codeList[i].id+'"><img class="comment_icon" src="images/comment.png"/><span id="comment">'+data.codeList[i].mentCount+'</span>评论</a></li>';	
				codeItem+='</ul>';
				codeItem+='</div>';
				codeItem+='</div>';				
			}
			$("#codelist").html(codeItem);
			//限制字符个数
			$(".codeItem p").each(function(){
			var maxwidth=130;
				if($(this).text().length>maxwidth){
					$(this).text($(this).text().substring(0,maxwidth));
					$(this).html($(this).html()+'…');
				}
			});
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
			codePage+='<span class="layui-laypage-skip" style=" background:none; ">当前第 '+pageIndex+' 页，到第<input type="text" id="pageInput" min="1" value="" class="layui-input">页<button href="javascript:void(0)" onclick="gotoPage()" type="button" class="layui-laypage-btn">确定</button></span>';
			$("#laypage").html(codePage);
			
		});

	}
	//跳到第几页
	function gotoPage(){
		var num=$("#pageInput").val();
		getCodeList(num);
	}
</script>
<!--JavaScript jQuery end-->
</body>
</html>
