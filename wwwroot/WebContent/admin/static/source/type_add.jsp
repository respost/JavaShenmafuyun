<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	name=new String(name.getBytes("iso-8859-1"),"utf-8");
	String ico=request.getParameter("ico");
	
	String typeId="";
	String typeName="";
	String typeIco="resource/images/ico/ico.png";
	
	if(id!=null&&id!=""){
		typeId=id;
	}
	if(name!=null&&name!=""){
		typeName=name;
	}
	if(ico!=null&&ico!=""){
		typeIco=ico;
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
  <!-- Stylesheets -->
  <link href="../thirdParty/bootstrap/css/bootstrap.css" rel="stylesheet"> 
    <!-- Font awesome icon -->
  <link href="../thirdParty/bootstrap/css/font-awesome.css" rel="stylesheet"> 
<title>添加分类</title>
</head>
<body>
<table class="table table-bordered table-hover m10">
	<input type="hidden" id="typeId" value="<%=typeId%>"/>
	<input type="hidden" id="typeIco" value="<%=typeIco%>"/>
    <tr>
        <td class="tableleft">类别名称：</td>
        <td><input type="text" id="typeName" value="<%=typeName%>" size="25"/></td>
    </tr>
    <tr>
        <td class="tableleft">上传图标：</td>
        <td><input type="file" id="picFile" name="picFile"  size="25"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" id="save" class="btn btn-primary"  type="button">保 存</button><button type="button" style="margin-left:45px;" class="btn btn-success" name="backid" id="back">返回列表</button>
        </td>
    </tr>
</table>
<div style="width:60px; height:60px; position:absolute; top:30px; right:50px;" ><img id="viewImg"  src="../../../<%=typeIco%>"/></div>
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../thirdParty/ajax/jquery.js"></script>
<script type="text/javascript" src="../thirdParty/ajax/ajaxupload.js"></script>
<script type="text/javascript">
	//全局变量
	var icoPath="";//图标相对路径
	var flag=false;//用于标识是否上传图片，为true表示上传了新图片
    $(function () {
    	//关闭
		$('#back').click(function(){
			close();
		 });
    	function close(){
   		 parent.window.location.href="code_type.jsp";//刷新父窗口
		 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		 parent.layer.close(index);//关闭弹出框
    	}
		//保存
		$('#save').click(function(){
			 var typeName=$("#typeName").val();
			 var typeId=$("#typeId").val();
			 if(typeName==null||typeName==""){
				 layer.msg('请填写类别名称',{icon:2,time:1000});
				 return;
			 }
			 var tid=0;
			 if(typeId!=""){
				 tid=typeId;
				 if(flag==false){//没有上传新图片，就使用旧图片
					 icoPath=$("#typeIco").val();
				 }				 
			 }
			 if(icoPath==""){
				 layer.msg('请选择上传图标',{icon:2,time:1000});
				 return;
			 }
			 var json={"tid":tid,"typeName":typeName,"typeIco":icoPath};
			 $.post("../../../CodeType_Add_Servlet",json,function(data){
					if(data=="ok"){
						if(typeId==""){	
							layer.msg('新增成功',{icon:1,time:1000});
						}else{
							layer.msg('修改成功',{icon:1,time:1000});			
						}	
						close();
					}else if(data=="error"){
						if(typeId==""){
							layer.msg('新增失败',{icon:5,time:1000});
						}else{
							layer.msg('修改失败',{icon:5,time:1000});
						}
						close();
					}

				});
		});
		//上传图标（选中图片后，自动上传）
		new AjaxUpload('#picFile', {
			action: '../../../CodeType_IcoUpload_Servlet', 
			name: 'picFile',
			responseType: 'json',
			onSubmit : function(file , ext){
				if (ext && /^(jpg|png|bmp)$/.test(ext.toLowerCase())){
					this.setData({
						'picName': file
					});
				} else {
					layer.msg('请上传格式为 jpg|png|bmp 的图片！',{icon:2,time:1000});
					return false;				
				}
			},
			onComplete : function(file,response){
				if(response.error) {
					alert(response.error);
					return;
				}
				icoPath=response.path;
				flag=true;
				$('#viewImg').attr('src',response.picUrl);
				layer.msg('图片上传成功！',{icon:1,time:1000});
				
			}		
		});
    });
</script>
</body>
</html>