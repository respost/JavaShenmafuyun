<%@page import="com.smfy.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="config/website.jsp" %>
<%@ include file="user_data.jsp" %>
<!doctype html>
<html><head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/code.css">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="ment/css/comment.css" />
<link rel="stylesheet" type="text/css" href="ment/css/sinaFaceAndEffec.css" />
</head>
<body>
<jsp:include page="top.jsp"/>
<!-- box-->
<div id="box">
	<div id="box_left">
		<div class="codeInfo_top">
              <div class="codeInfo_ico"><a href="#"><img id="ico"  src="resource/images/ico/jsp.png" title=""/></a></div>
              <div class="codeInfo_title">
                    <h1 id="title"></h1>
                    <ul>
                         <li class="releaseDate">发布于：<span name="update">2017-01-01 00:00:00</span></li>                      
                         <li><a href="#" ><img class="browse_icon" src="images/browse.png"/><span class="lookCount">0</span> 围观</a></li>
                         <li><a href="#" ><img class="comment_icon" src="images/comment.png"/><span class="mentCount">0</span> 评论</a></li>		
                   </ul>
              </div>
              <hr class="style-two"/>
        </div>
        <div style="clear:both"></div>
        <div class="codeInfo_abs"><span>摘要：</span> <span id="summary"></span></div>
       	<div><img src="images/split_line.png"/></div>
        <div class="codeInfo_content" id="content"></div>
        <div><img src="images/split_line.png"/></div>          
        <!--下载区 start-->
        <h3>下载地址：</h3>
        <div class="codeInfo_down">     	
            <ul id="tasks" class="item-list">
                <li class="item-orange clearfix">
                    <label>隐藏附件：</label>******** 在线购买，无需人工干预，购买后系统会自动将本附件资源发送到您邮箱请注意查收！			
                </li>
                <li class="item-red clearfix">
                    <label>资源价格：</label><span class="price">￥<span name="price"></span></span>                
                </li>
                <li class="item-blue clearfix">
                    <label>会员五折：</label><span class="price">￥60</span>   
                </li>
                <li class="item-grey green clearfix">
                   商业会员可享受五折购买特权，普通会员无折扣，您目前尚未升级会员！  >>> <span onClick="upVip()" class="orange">升级会员</span>
                </li>
                <li class="item-green green clearfix">
                  普通会员购买，需支付：<span class="price">￥<span name="price"></span></span>  >>> <span onClick="buy()" class="orange">立即购买</span>
                </li>
                <li class="item-pink clearfix">
                  本资源为虚拟可复制性商品，购买后不予退款，谢谢您的支持！
                </li>	
            </ul>
        </div>
        <!--下载区end-->
         <div  style="clear:both"></div>
        <!--评论区 start-->
        	<div class="comment_box">
                <div class="info clearfix">
                <ul>
                 <li class="time">发布日期：<span name="update">2017-01-01 00:00:00</span></li>               
                 <li>
                <div class="bdsharebuttonbox">
                    <a href="#" class="bds_more" data-cmd="more">分享到：</a>
                    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                    <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                </div>
                 </li>
                <li style="float:right;"><a class="praise" id="praise" href="javascript:;">赞</a></li>
                </ul>                                                  
                </div>
   				<div style="clear:both"></div>
                <div class="praises-total" id="praises-total" total="5"><span id="dpCount"></span>个人觉得很赞</div>
				<div class="cont-box">
					<textarea class="text" id="mentContent" placeholder="请输入..."></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon">☺</span></div>
                    <div class="yzm">
                    <dl><dt>验证码：</dt><dd><input type="text" name="code" id="code"  maxlength="5"  value="" /></dd><dd><img src="VeryfServlet" id="veryfyCode" alt="验证码"  title="点击刷新" /></dd></dl>
                   </div>
  
					<div class="submit-btn"><input type="button" onClick="mentSubmit()" value="提交评论" /></div>
				</div>
			</div>
            <div id="info-show">
            	 <ul>                                        
				 </ul>                 
			</div>  
        <!--评论区 end -->

    </div><!--left结束-->
	<div id="box_right">
    	<div id="author">
        <h1><img id="authorPic" src="images/member.jpg" /></h1>
        <p><span name="author">佚名</span><span class="sign">作者</span></p>
        <hr class="style-one"/>
 			<ul>
            <li><a href="#" target="_blank">94</a><p>积分</p></li>
            <li><a href="#" target="_blank">5</a><p>源码</p></li>
            <li><a href="#" target="_blank" class="mentCount">0</a><p>评论</p></li>
			</ul>
        </div>
        <div id="codeType">
        <h4>源码分类</h4>
        <ul>       
        <li><a href="#">JSP源码</a></li>
        <li><a href="#">PHP源码</a></li>
        <li><a href="#">ASP源码</a></li>
        <li><a href="#">HTML5源码</a></li>
        <li><a href="#">andriod</a></li>
        <li><a href="#">ISO</a></li>
        </ul>
        </div>
        <div id="Interest">
        <h4>您可能感兴趣的源码<img src="images/header_hot.png"/></h4>
        <ul></ul>
        </div>
	</div><!--right结束-->
</div>
<jsp:include page="foot.jsp"/>
<!--JavaScript jQuery start-->
<script type="text/javascript" src="jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript" src="ment/js/comment.js"></script>
<script type="text/javascript" src="ment/js/sinaFaceAndEffec.js"></script> 
<script type="text/javascript" src="js/common.js"></script><!-- 封装公用的jQuery方法 --> 
<script type="text/javascript">
	var acs=true;//标识资源是否可以评论，true为允许
	$(function(){
		//获取传送过来的源码ID
		var cid=GetQueryString("cid");
		getCodeInfo(cid);	
		//验证码
		$("#veryfyCode").click(function(){	
			$(this).attr("src","VeryfServlet?a="+Math.random());
		});
		$("#code").focus(function(){		
			$("#veryfyCode").attr("src","VeryfServlet?b="+Math.random());
		});
		// 绑定表情
		$('.face-icon').SinaEmotion($('.text'));
		//显示相关的评论
		getMentList();
	});
	//立刻购买
	function buy(){
		var flag=checkUserLogin(<%=status%>);
		if(flag){
			alert("这里执行购买的功能");
		}
	}
	//升级会员
	function upVip(){
		var flag=checkUserLogin(<%=status%>);
		if(flag){
			openUserBox(2);
		}
	}
	//提交评论
	function mentSubmit(){		
		var flag=checkUserLogin(<%=status%>);
		if(flag){
			//检测是否可评论
			if(acs==false){
				layer.msg('该资源不允许评论！', {icon: 4});
				return;	
			}
			var cid=GetQueryString("cid");//源码id
			var uid="${user.id}";//用户id
			var content=$("#mentContent").val();
			var code=$("#code").val();
			if(content==""||content==null){
				layer.msg('评论内容不能为空！', {icon: 5});
				return;
			}
			if(code==""||code==null){
				layer.msg('验证码不能为空！', {icon: 5});
				return;
			}
			var json={"mentId":0,"cid":cid,"uid":uid,"content":content,"code":code};
			$.post("Ment_Add_Servlet",json,function(data){
				if(data=="vcError"){
					layer.msg('验证码错误！', {icon: 5});
				}else if(data=="ok"){
					layer.msg('评论成功！', {icon: 1});
					$("#mentContent").val("");
					$("#veryfyCode").attr("src","VeryfServlet?c="+Math.random());
					getMentList();
				}else{
					layer.msg('评论失败！', {icon: 5});
				}
			});
		}
	}
	//检测用户是否登录
	function checkUserLogin(status){
		var flag=false;
		switch(status){
		case 0:
			//墨绿深蓝风
			layer.alert('请先登录', {
			  skin: 'layui-layer-molv' //样式类名
			  ,closeBtn: 0
			}, function(index){
				//iframe层-禁滚动条
				layer.close(index);//关闭提示框
				layer.open({
				  type: 2,
				  title:'会员登录',
				  area: ['533px', '400px'],
				  skin: 'layui-layer-rim', //加上边框
				  content: ['login.html?code', 'no'],
				}); 
			});
			break;
		case 1:
			flag=true;
			break;
		}
		return flag;
	}
	//获取评论列表
	function getMentList(){
		var cid=GetQueryString("cid");
		//var tj=" where cid="+cid+" and status=1 ORDER BY mentDate desc";//只加载审核过的评论
		var tj=" where cid="+cid+" ORDER BY mentDate desc";//加载全部评论
		pageIndex=1;//从1开始
		pageSize=20;//显示20条
		var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
		$.getJSON("Ment_List_Servlet",json,function(data){
				var html="";
				for(var i=0;i<data.mentList.length;i++){
					html += '<li>';
					html += '<div class="head-face">';
					html += '<img src="'+data.mentList[i].userPic+'" / >';
					html += '</div>';
					html += '<div class="reply-cont">';
					if(data.mentList[i].userNick!=null&&data.mentList[i].userNick.length>0){
						html += '<p class="username">'+data.mentList[i].userNick;
					}else{
						html += '<p class="username">'+data.mentList[i].userName;
					}
					html += '：<span class="comment-body">'+data.mentList[i].content+'</span></p>';
					data.mentList[i].mentDate=new Date(data.mentList[i].mentDate).format("yyyy-MM-dd hh:mm:ss");
					html += '<p class="comment-footer">'+data.mentList[i].mentDate+'</p>';
					html += '</div>';
					html += '</li>';
					html += '<hr class="style-two"/>';
				}
			var newHtml=AnalyticEmotion(html);//先解析表情包
			$('#info-show ul').html(newHtml);
		});
	}

	//获取源码信息
	function getCodeInfo(id){
		var tj="where id="+id;
		$.getJSON("Code_Find_Servlet",{"tj":tj},function(data){
			if(data!=null){
				$("title").html(data.title+"- <%=web_name %>");
				$("#ico").attr("src",data.typeIco);
				$("#ico").attr("title",data.typeName);
				$("#title").html(data.title);
				data.update=new Date(data.update).format("yyyy-MM-dd hh:mm:ss");
				$("[name=update]").html(data.update);
				$(".lookCount").html(data.lookCount);
				$(".mentCount").html(data.mentCount);
				$("#summary").html(data.summary);
				$("#content").html(data.content);
				$("[name=price]").html(data.price);
				//头像
				if(data.adminPic!=null&&data.adminPic.length>0){
					$("#authorPic").attr("src",data.adminPic);
				}else if(data.userPic!=null&&data.userPic.length>0){
					$("#authorPic").attr("src",data.userPic);
				}else{
					$("#authorPic").attr("src","images/member.jpg");
				}
				//名称
				if(data.adminName!=null&&data.adminName.length>0){
					$("[name=author]").html(data.adminName);
				}else if(data.userNick!=null&&data.userNick.length>0){
					$("[name=author]").html(data.userNick);
				}else if(data.userName!=null&&data.userName.length>0){
					$("[name=author]").html(data.userName);
				}else{
					$("[name=author]").html("匿名用户");
				}
				//点赞次数
				$("#praises-total").attr("total",data.dpCount);
				$("#dpCount").text(data.dpCount);
				//是否允许评论
				if(data.acs==1){//为1时不允许
					acs=false;
				}
			}
			//可能感兴趣的
			var tj=" where typeId="+data.typeId;
			tj+=" ORDER BY lookCount DESC";
			pageIndex=1;//从1开始
			pageSize=10;//显示10条
			var json={"tj":tj,"pageIndex":pageIndex,"pageSize":pageSize};
			$.getJSON("Code_List_Servlet",json,function(data){
				var html="";
				for(var i=0;i<data.codeList.length;i++){
					html+='<li><a href="code.jsp?cid='+data.codeList[i].id+'" >'+data.codeList[i].title+'</a></li>';
				}
				$("#Interest ul").html(html);
			});
		});
	}
/*百度分享代码*/
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{"bdSize":16}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
<!--JavaScript jQuery end-->
</body>
</html>
