<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>
    <%
    String id=request.getParameter("id");
   //使用URLDecoder处理中文乱码
    String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
    String content = URLDecoder.decode(request.getParameter("content"), "UTF-8");
    String reply = URLDecoder.decode(request.getParameter("reply"), "UTF-8");
    int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
    
    //判断接收的字符串中有没有中文，没有就处理中文乱码 
   /* Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
    Matcher n = p.matcher(name);
    if (!n.find()) {
    	name = new String(name.getBytes("ISO8859-1"),"UTF-8");
    }
    Matcher c = p.matcher(name);
    if (!c.find()) {
    	content = new String(content.getBytes("ISO8859-1"),"UTF-8");
    }
    Matcher r = p.matcher(name);
    if (!r.find()) {
    	reply = new String(reply.getBytes("ISO8859-1"),"UTF-8");
    }
    */
    %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<title>回复评论</title>
<style>
.padding5{padding:5px;}
.textAreaBg{background:#F8F8F8;}
</style>
</head>
<body>
<article class="page-container">
	<form action="javascript:void(0)" method="post" class="form form-horizontal" id="form-member-add">
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>昵称：</label>
			<div class="formControls col-xs-8 col-sm-9"> <%=name %> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>评论：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="content" cols="65" rows="5" class="textArea padding5 textAreaBg" readonly="readonly" /><%=content %></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>回复：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="reply"  cols="65" rows="5" required="required" class="textArea padding5" /><%=reply %></textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>
<script type="text/javascript" src="../../../jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript">
	$(".btn").click(function(){
		var id=<%=id%>;
		var reply=$("#reply").val();
		if(reply==null||reply==""){
			ayer.msg('回复内容不能为空!',{icon: 2,time:1000});
			return;
		}
		var json={"mentId":id,"reply":reply};
		$.post("../../../Ment_Add_Servlet",json,function(data){
			
			if(data=="ok"){
				layer.msg('回复成功!',{icon: 1,time:1000});
				closeBox();
			}else{
				layer.msg('回复失败!',{icon: 5,time:1000});
			}
			
		});
	});
	function closeBox(){
		var pageIndex=<%=pageIndex%>;
		parent.getMentList(pageIndex);
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}
</script> 
</body>
</html>