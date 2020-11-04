<%@page import="com.smfy.entity.Admin"%>
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
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../thirdParty/layer/theme/default/layer.css">
<!--引入easyui框架-->
<link rel="stylesheet" type="text/css" href="../thirdParty/easyui/themes/default/easyui.css">
<!--引入ueditor-->
<script type="text/javascript" charset="utf-8" src="../../../ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../../ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="../../../ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	window.UEDITOR_HOME_URL="../../../ueditor/";
    //实例化编辑器
    window.onload=function(){
    	UE.getEditor('editor');
    }; 
</script>
<title>源码添加与编辑</title>
<style>
.tt-inner{
	display:inline-block;
	line-height:12px;
	padding-top:5px;
}
.tt-inner img{
	border:0;
}
#tbBox{position:relative;}
#tbBox dl{position:absolute;top:0px;left:635px;border:1px solid #CCC; width:230px; height:175px;overflow:hidden;}
#tbBox dl dt{height:30px;line-height:30px;text-align:center;background:#E0ECFF;}
#tbBox dl dd{padding:5px;}
#tbBox dl dd img{ width:220px; height:135px;}
input{text-indent:10px;}
.w8{width:882px;}
</style>
</head>
<body>
<div id="saper-container">
            <div id="addTitle" class="subfiled clearfix" >
                <h2><span>添加源码</span></h2>
            </div>
<!--插入内容 start-->			
<article class="page-container">
	<form class="form form-horizontal" action="javascript:void(0)" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>源码标题：</label>
			<div class="formControls col-xs-8 col-sm-9 w8">
				<input type="text" class="input-text" value="" placeholder="请在这里输入标题名称" required="required" id="code_title" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>源码类型：</label>
			<div class="formControls col-xs-8 col-sm-9 w8"> <span class="select-box">
				<select id="code_type" class="select">
					<option value="0">请选择</option>
					<option value="1">JSP源码</option>
					<option value="2">PHP源码</option>
					<option value="3">ASP源码</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">源码售价：</label>
			<div class="formControls col-xs-8 col-sm-9 w8">
				<input type="text" class="input-text" placeholder="" required="required" id="code_price" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">排序值：</label>
			<div class="formControls col-xs-8 col-sm-9 w8">
				<input type="text" class="input-text" value="0" placeholder="排序值越大，越靠前" required="required" id="code_sort" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">允许评论：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<label for="comment_y"><input type="radio" name="code_acs" id="comment_y" value="0" checked="true">是</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="comment_n"><input type="radio" name="code_acs" id="comment_n" value="1">否</label>&nbsp;&nbsp;
			</div>	
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">源码来源：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<label for="src_0"><input type="radio" name="code_src" id="src_0" value="原创" checked="true">原创</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="src_1"><input type="radio" name="code_src" id="src_1" value="转载">转载</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="src_2"><input type="radio" name="code_src" id="src_2" value="二次开发">二次开发</label>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">关键词：</label>
			<div class="formControls col-xs-8 col-sm-9 w8">
				<input type="text" class="input-text" value="" placeholder="关键字有助于SEO优化，让更多人搜索到该资源。" required="required" id="keywords" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">源码摘要：</label>
			<div class="formControls col-xs-8 col-sm-9 w8">
				<textarea  id="summary"  class="textarea"  placeholder="说点什么...最少输入10个字符" required="required" nullmsg="备注不能为空！"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/130</p>
			</div>
		</div>
		<div class="row cl" >
			<label class="form-label col-xs-4 col-sm-2">缩略图：</label>
			<div class="formControls col-xs-8 col-sm-9" id="tbBox">
				<div class="uploader-thum-container" >
				<!--插入easyui框架内容 start-->				
					<span class="btn-upload form-group">				
					<a href="javascript:void();" id="PicName" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择图片</a>
					<input type="file" id="codePic" name="codePic" class="input-file">
					</span> 
				<!--插入easyui框架内容 end-->
					<button onClick="codePicUpload();"  class="btn btn-default btn-uploadstar radius ml-10">上传图片</button>
				</div>
					<dl>
					<dt>缩略图预览效果</dt>
					<dd><img src="images/tb.jpg" id="viewImg" alt="缩略图" /></dd>
					</dl>
			</div>
			
			
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">附件：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<!--插入easyui框架内容 start-->
				<div class="easyui-tabs" data-options="tabWidth:100,tabHeight:60" style="width:600px;height:130px" >
					<div title="<span class='tt-inner'><img src='images/modem.png'/>&nbsp;本地文件</span>" style="padding:6px">				
						<span class="btn-upload form-group"  style="margin-top:10px;" >
						<input class="input-text upload-url" style="width:200px;" type="text" id="fileName"  placeholder="请添加附件">
						<a href="javascript:void();" id="filePrint" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
						<input type="file" name="codeFile" id="codeFile"  class="input-file">
						</span> 
					    <button onClick="codeFileUpload();" class="btn btn-default btn-uploadstar radius ml-10" style="margin-top:10px;">上传文件</button>						
					</div>
					<div title="<span class='tt-inner'><img src='images/scanner.png'/>&nbsp;网络文件</span>" style="padding:6px">
						<span class="btn-upload form-group"  style="margin-top:10px;line-height:30px;" >
						网盘地址：<input class="input-text upload-url" style="width:245px;" value="http://" type="text"  id="downUrl" >&nbsp;&nbsp;
						提取密码：<input class="input-text upload-url" style="width:50px;" type="text" id="extPwd" >
						</span> 
					</div>
				
				</div>
			<!--插入easyui框架内容 end-->
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文件解压密码：</label>
			<div class="formControls col-xs-8 col-sm-9 w8">
				<input type="text" class="input-text" value="" placeholder="" id="decomPwd" />
			</div>
		</div>
		<!-- 现将内容放到code中，然后ueditor再从这里取值 -->
    	<code id="testcon" style="display:none;"></code>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">源码内容：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
					<div class="kv-item-content">
						<textarea  id="editor" required="required" style="width:850px;height:400px;"></textarea>
                    </div>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="code_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				<!--<button onClick="code_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>-->
			</div>
		</div>
	</form>
</article>
</div>
<!--插入内容 end--> 
<!--引入easyui框架-->
<script type="text/javascript" src="../thirdParty/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../thirdParty/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../thirdParty/ajax/jquery.js"></script>
<script type="text/javascript" src="../thirdParty/ajax/ajaxfileupload.js"></script>
<script type="text/javascript" src="../thirdParty/layer/layer.js"></script>
<script type="text/javascript" src="../js/common.js"></script><!-- 封装公用的jQuery方法 -->
<script type="text/javascript">
		//全局变量
		var sname="";
		var cid="";
		var tbPath="";//要存入数据库的缩略图相对路径
		var filePath="";//要存入数据库的文件相对路径
		//判断是添加或编辑
		$(function(){
			sname = GetQueryString('sname');
			cid = GetQueryString('cid');
		   if(sname=='add'){ //添加
				$("#addTitle").show();
		   }else{//编辑
				$("#addTitle").hide();	
				findCodeInfo(cid);
		   }   
		});	
		//输入摘要内容时，计算字符长度
		$("#summary").bind('input propertychange',function () {
			var summary=$(this).val();
			$(".textarea-length").html(summary.length);
		});
		/*------------------------文件上传 start----------------------------*/	

		
		//选择图片后，显示文件名
		$("#codePic").change(function(){
			var uploadfile = $("#codePic").val();
            if(uploadfile!=null||uploadfile!=""){
            	var fileName=getFileName(uploadfile);
                $("#PicName").html(fileName);
            }
        });
	
	    //上传图片
		function codePicUpload() {
	    	//先判断文件类型
			var uploadfile = $("#codePic").val();
			var fileTypes = new Array("jpg","png","gif","bmp","jpeg");  //定义可支持的文件类型数组
			var fileTypeFlag = "0";
			
			var newFileName = uploadfile.split('.');
			newFileName = newFileName[newFileName.length-1];
			for(var i=0;i<fileTypes.length;i++){
				if(fileTypes[i]==newFileName){
					fileTypeFlag="1";
				}
			}
			if(fileTypeFlag=="0"){
				layer.msg('图片必须是jg、png、gif、bmp或jpeg格式！',{icon:4,time:1000});
				$("#PicName").html('<i class="Hui-iconfont">&#xe642;</i> 选择图片');
				return;
			}
			
			$.ajaxFileUpload({
				url : '../../../Code_PicUpload_Servlet',
				secureuri : false,
				fileElementId : 'codePic',//这里是input里的id，注意input里还得增加一个name属性，不然上传不了。
				dataType : 'json',
				success : function(data, status) {
					tbPath=data.path;
					$('#viewImg').attr('src',data.picUrl);
					$("#PicName").html("图片上传成功");

				},
				error : function(data, status, e) {
					layer.msg('上传出错!!',{icon:5,time:1000});
				}
			});
		}
	    
		//选择文件后，显示文件名
		$("#codeFile").change(function(){
			var uploadfile = $("#codeFile").val();
            if(uploadfile!=null||uploadfile!=""){
            	var fileName=getFileName(uploadfile);
                $("#fileName").val(fileName);
            }
        });
	    
	    //上传文件
		function codeFileUpload() {
	    	//先判断文件类型
			var uploadfile = $("#codeFile").val();
			var fileTypes = new Array("rar","zip","txt");  //定义可支持的文件类型数组
			var fileTypeFlag = "0";
			
			var newFileName = uploadfile.split('.');
			newFileName = newFileName[newFileName.length-1];
			for(var i=0;i<fileTypes.length;i++){
				if(fileTypes[i]==newFileName){
					fileTypeFlag="1";
				}
			}
			if(fileTypeFlag=="0"){
				layer.msg('文件必须是rar、zip、或txt格式！',{icon:4,time:1000});
				$("#fileName").html('<i class="Hui-iconfont">&#xe642;</i> 浏览文件');
				return;
			}
			
			$.ajaxFileUpload({
				url : '../../../Code_FileUpload_Servlet',
				secureuri : false,
				fileElementId : 'codeFile',//这里是input里的id，注意input里还得增加一个name属性，不然上传不了。
				dataType : 'json',
				success : function(data, status) {
					$("#filePrint").html("文件上传成功");
					filePath=data.path;
					
				},
				error : function(data, status, e) {
					layer.msg('上传出错!!',{icon:5,time:1000});
				}
			});
		}
	
	    /*------------------------文件上传 end----------------------------*/		
		
		   //保存并提交审核
		function code_submit(){
		    var codeId=0;//默认给0
		    if(cid!=""){//编辑
		    	codeId=cid;
		    }
			var adminId='${admin.id}';//作者Id 1
			var title=$("#code_title").val();//标题 2
		    var typeId=$("#code_type").val();//类型  3
		    if(typeId==0){
		    	layer.msg('请选择类型！',{icon:2,time:1000});
		    	return;		   
		    }
		    var price=$("#code_price").val();//价格 4
		    var sort=$("#code_sort").val();//排序值 5
		    var acs=$("[name=code_acs]:checked").val();//允许评论 6
		    if(acs==null){
		    	layer.msg('请选择是否允许评论！',{icon:2,time:1000});
		    	return;
		    }
		    var origin=$("[name=code_src]:checked").val();//来源 7
		    if(origin==null){
		    	layer.msg('请选择源码来源！',{icon:2,time:1000});
		    	return;
		    }
		    //获取当前系统时间
			var nowTime=new Date();
			nowTime=new Date().format("yyyy-MM-dd hh:mm:ss");
			var update=nowTime;//更新时间 8
		    var keywords=$("#keywords").val();//关键字 9
		    var summary=$("#summary").val();//摘要 10			    
		    var content=UE.getEditor('editor').getContent()+"";//内容 11
		    var downUrl=$("#downUrl").val();//网盘下载链接 12
		    var extPwd=$("#extPwd").val();//网盘提取密码 13
		    var decomPwd=$("#decomPwd").val();//解压密码 14	
		    var status=1;//状态 17
			//判断是否上传缩略图
			if(tbPath==""){
				layer.msg('请上传缩略图!',{icon:5,time:1000});
				return;
			}	
			var	json={"codeId":codeId,"adminId":adminId,"title":title,"typeId":typeId,"price":price,"sort":sort,"acs":acs,"origin":origin,"update":update,"keywords":keywords,"summary":summary,"content":content,"downUrl":downUrl,"extPwd":extPwd,"decomPwd":decomPwd,"tbPath":tbPath,"filePath":filePath,"status":status};		  
			$.post("../../../Code_Add_Servlet",json,function(data){
				if(data=="ok"){
					if(cid!=""){
						layer.msg('修改成功！',{icon:1,time:1000});
						//关闭编辑页面
						setTimeout(closeBox, 1000);
					}else{
						layer.msg('添加成功！',{icon:1,time:1000});
						window.location.href='code_list.jsp?stu=all';
					}					
	
				}else{
					if(cid!=""){
						layer.msg('编辑失败！',{icon:5,time:1000});
					}else{
						layer.msg('添加失败！',{icon:5,time:1000});
					}
				}
			});
		}
		//关闭窗口
		function closeBox(){
			var pageIndex = GetQueryString('pageIndex');
			parent.getCodeList(pageIndex);
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
		//给ueditor插入值
        function setContent(){
          UE.getEditor('editor').execCommand('insertHtml', $('#testcon').html());
        }
	    //查询源码信息
	    function findCodeInfo(cid){
				var tj="where id="+cid;
				$.getJSON("../../../Code_Find_Servlet",{"tj":tj},function(data){
					if(data!=null){
						$("#code_title").val(data.title);//标题 
						$("#code_price").val(data.price);//价格 
						$("#code_sort").val(data.sort);//排序值 
						$("#keywords").val(data.keywords);//关键字
						$("#summary").val(data.summary);//摘要	
						$(".textarea-length").html(data.summary.length);
						$("#downUrl").val(data.downUrl);//网盘下载地址					
						$("#extPwd").val(data.extPwd);//提取密码
						$("#decomPwd").val(data.decomPwd);//解压密码
						tbPath=data.tbPath;//缩略图路径 
						$('#viewImg').attr('src','../../../'+tbPath);//显示缩略图
						filePath=data.filePath;//文件路径
						//评论
						if(data.acs==0){	
							$("#comment_n").removeAttr("checked");//单选按钮要先移除
							$("#comment_y").attr("checked","checked");						
							
						}else{	
							$("#comment_y").removeAttr("checked");
							$("#comment_n").attr("checked","checked");
							
						}
						//来源
						if(data.origin=="原创"){
							$("#src_0").attr("checked","true");
							$("#src_1","#src_2").removeAttr("checked");
						}else if(data.origin=="转载"){
							$("#src_1").attr("checked","true");
							$("#src_0","#src_2").removeAttr("checked");
						}else{
							$("#src_2").attr("checked","true");
							$("#src_0","#src_1").removeAttr("checked");
						}
						//类别
						var typeId=data.typeId;
						$("#code_type").find("option[value = '"+typeId+"']").attr("selected","selected");
						//内容	
						$("#testcon").html(data.content);
						window.setTimeout(setContent,1000);//一秒后再调用赋值方法																	
					};
				});
	    }

</script>
</body>
</html>