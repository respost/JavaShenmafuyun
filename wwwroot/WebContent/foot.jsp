<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="config/website.jsp" %>
<!doctype html>
<html><head>
<meta charset="utf-8">
<title><%=web_title %></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/foot.css">
<link rel="stylesheet" type="text/css" href="css/service.css">
</head>
<body>
<!--footer-->
<div style="clear:both"></div>
<div id="footer">
	<div id="link">
    	<h1>友情链接</h1>
        <ul>
        <li><a href="#"><img src="images/baidu.gif"/></a></li>
        <li><a href="#"><img src="images/360so.gif"/></a></li>
        <li><a href="#"><img src="images/sogou.gif"/></a></li>
         <li><a href="#"><img src="images/weixin.jpg"/></a></li>
        <li><a href="#"><img src="images/alipay.gif"/></a></li>
        <li><a href="#"><img src="images/admin5.gif"/></a></li>
        <li><a href="#"><img src="images/tenpay.gif"/></a></li>
        <li><a href="#"><img src="images/upyun.jpg"/></a></li>
        <li><a href="#"><img src="images/zzidc.jpg"/></a></li>
        <li  style="padding-right:0px;"><a href="#"><img src="images/aliyun.jpg"/></a></li>
        </ul>
    </div>
	<div id="footup"></div>
	
    <div id="footdown">
   		 <div id="footbox">
    		<div class="footdown_left">
    			<div>
                <ul>
    			<li><a href=""#>关于我们</a></li>
    			<li><a href=""#>联系我们</a></li>
    			<li><a href=""#>广告合作</a></li>
    			<li><a href=""#>隐私条款</a></li>
    			<li><a href=""#>免责声明</a></li>
    			<li><a href=""#>网站地图 </a></li>
    			<li style="padding-right:0px"><a href=""#>&copy; 2008-2017 <%=web_name %> 版权所有</a></li> 
    			</ul>
                </div>
                <p>工信备：桂ICP备17012557号-1 公安备：桂公网安备 42280102000242号</p>
    		</div>
    		<div class="footdown_right">
                <div>
                <ul>
    			<li><a href=""#><img src="images/rz1.png"/></a></li>
    			<li><a href=""#><img src="images/rz2.png"/></a></li>
                <li><a href=""#><img src="images/rz3.png"/></a></li>
                <li><a href=""#><img src="images/rz4.png"/></a></li>
                <li><a href=""#><img src="images/rz5.png"/></a></li>
    			</ul>
                </div>
            </div>
         </div>
         <div class="footlogo"><a href="#"><img src="images/footlogo.png"/></a></div>
    </div>
	<div id="fixed_left"></div>
    <div id="backtop" class="backtopClass">
		<a title="返回顶部"><img src="images/scrolltop_2.png" ></a>
	</div>
    <!-- 客服代码 begin -->
    <audio id="bgMusic" src="images/service/music.mp3" autoplay="autoplay" loop></audio>
    <div id="service">
        <div id="open_im" class="open-im">&nbsp;</div>  
        <div class="im_main" id="im_main">
            <div id="close_im" class="close-im"><a href="javascript:void(0);" title="点击关闭">&nbsp;</a></div>
            <a href="tencent://message/?uin=3196887191&amp;Menu=yes" target="_blank" class="im-qq qq-a" title="在线QQ客服">
                <div class="qq-container"></div>
                <div class="qq-hover-c"><img class="img-qq" src="images/service/qq.png"></div>
                <span> QQ在线咨询</span>
            </a>
            <div class="im-tel">
                <p>售前咨询热线</p>
                <p class="tel-num">400-123-45678</p>
                <p>售后咨询热线</p>
                <p class="tel-num">010-12345678</p>
            </div>
            <div class="im-footer" style="position:relative">
                <div class="weixing-container">
                    <div class="weixing-show">
                        <div class="weixing-txt">
                        <p>微信扫一扫</P>
                        <p>关注<%=web_name %></p>
                        </div>
                        <img class="weixing-ma" src="images/service/weixing.jpg">
                        <div class="weixing-sanjiao"></div>
                        <div class="weixing-sanjiao-big"></div>
                    </div>
                </div>
                <!--<div class="go-top"><a href="javascript:;" title="返回顶部"></a> </div>-->
                <div class="go-top"><a id="audioBtn" title="开关音效"></a></div>
                <div style="clear:both"></div>
            </div>
        </div>
    </div>
	<!-- 客服代码 end-->
</div>
</div><!-- allPag end -->
<!--JavaScript jQuery start-->
<script type="text/javascript" src="jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/foot.js"></script>
<!--JavaScript jQuery end-->
</body>
</html>
