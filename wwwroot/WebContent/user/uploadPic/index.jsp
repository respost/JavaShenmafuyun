<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smfy.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
 <head>
  <title>flash上传头像组件</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="../../layer/theme/default/layer.css">
  <style type="text/css" media="screen">
  html, body { height:100%; background-color: #ffffff;}
  #flashContent { width:100%; height:100%; }
  </style>
 </head>
 <body>
<div id="altContent">
	<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
	codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
	WIDTH="650" HEIGHT="450" id="myMovieName">
	<PARAM NAME=movie VALUE="avatar.swf">
	<PARAM NAME=quality VALUE=high>
	<PARAM NAME=bgcolor VALUE=#FFFFFF>
	<param name="flashvars" value="imgUrl=./default.jpg&uploadUrl=./upfile.jsp&uploadSrc=false" />
	<EMBED src="avatar.swf" quality=high bgcolor=#FFFFFF WIDTH="650" HEIGHT="450" wmode="transparent" flashVars="imgUrl=./default.jpg&uploadUrl=./upfile.jsp&uploadSrc=false"
	NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash" allowScriptAccess="always"
	PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
	</EMBED>
	</OBJECT>
</div>
  <script type="text/javascript" src="../../jquery/jquery-1.8.3.min.js"></script> 
  <script type="text/javascript" src="../../layer/layer.js"></script>
  <script type="text/javascript"> 
   function uploadevent(status,picUrl,callbackdata){
  //alert(picUrl); //后端存储图片
//	alert(callbackdata);
        status += '';
     switch(status){
     case '1':
		//var time = new Date().getTime();
		//var filename162 = picUrl+'_162.jpg';
		//var filename48 = picUrl+'_48.jpg';
		//var filename20 = picUrl+"_20.jpg";
		
		var filename162 = picUrl+'.jpg';
		//这里把头像路径写入数据库中，然后执行关闭弹出的窗口
		var id='${user.id}';
		var picPath=filename162.substring(1);
		var json={"id":id,"picPath":picPath};
		 $.post("../../User_Head_Servlet",json,function(data){
        		if(data=="ok"){   		
        			layer.msg('修改成功!',{icon: 6,time:1000});
					parent.location.reload();//刷新父亲对象（用于框架）
        			setTimeout(parent.gotoInfo(), 1000);
        		}else{
        			layer.msg('修改失败!',{icon: 5,time:1000});
        		}
        });
		
	break;
     case '-1':
	  window.location.reload();
     break;
     default:
     window.location.reload();
    } 
   }
  </script>
</body>
</html>