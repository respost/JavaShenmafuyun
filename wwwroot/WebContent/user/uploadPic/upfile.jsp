<%@page import="java.io.*,sun.misc.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String path=application.getRealPath(request.getRequestURI());  
//String dir=new File(path).getParent(); 
//String savePath = "./";  //保存图片路径 可以修改

String path=application.getRealPath(""); //获取系统路径
String savePath= "/images/head/";//保存图片的相对路径
String _savePath = path+savePath;

long savePicName = new Date().getTime();

//String file_src = _savePath + savePicName + "_src.jpg";    //保存原图
//String filename162 = _savePath + savePicName + "_162.jpg";  //保存162
//String filename48 = _savePath + savePicName + "_48.jpg";  //保存48
//String filename20 = _savePath + savePicName + "_20.jpg";  //保存20

String filename162 = _savePath + savePicName + ".jpg";  //保存头像

//注明：我们现在只需要162尺寸的图片，其他的不需要。

//String pic=request.getParameter("pic");
String pic1=request.getParameter("pic1");
//String pic2=request.getParameter("pic2");
//String pic3=request.getParameter("pic3");


/*
if(!pic.equals("")&&pic!=null){
	//原图
	File file = new File(file_src);
	FileOutputStream fout = null;
	fout = new FileOutputStream(file);
	fout.write(new BASE64Decoder().decodeBuffer(pic));
	fout.close();
}
*/
//图1
File file1 = new File(filename162);
FileOutputStream fout1 = null;
fout1 = new FileOutputStream(file1);
fout1.write(new BASE64Decoder().decodeBuffer(pic1));
fout1.close();
/*
//图2
File file2 = new File(filename48);
FileOutputStream fout2 = null;
fout2 = new FileOutputStream(file2);
fout2.write(new BASE64Decoder().decodeBuffer(pic2));
fout2.close();

//图3
File file3 = new File(filename20);
FileOutputStream fout3 = null;
fout3 = new FileOutputStream(file3);
fout3.write(new BASE64Decoder().decodeBuffer(pic3));
fout3.close();
*/
String picUrl = savePath+savePicName;

out.println("{\"status\":1,\"picUrl\":\""+picUrl+"\"}"); //上传成功后，返回图片地址

%>