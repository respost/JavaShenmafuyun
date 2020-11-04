package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.CodeBizImpl;
import com.smfy.entity.Code;

/**
 * Servlet implementation class Code_Add_Servlet
 */
public class Code_Add_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Code_Add_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int codeId=Integer.parseInt(request.getParameter("codeId"));//源码Id
		int adminId=Integer.parseInt(request.getParameter("adminId"));//作者Id 1
		String title=request.getParameter("title");//标题 2
		int typeId=Integer.parseInt(request.getParameter("typeId"));//类型 3
		float price=Float.parseFloat(request.getParameter("price"));//价格4
		int sort=Integer.parseInt(request.getParameter("sort"));//排序 5
		int acs=Integer.parseInt(request.getParameter("acs")); //允许评论 6
		String origin=request.getParameter("origin");//来源 7
		String update=request.getParameter("update");//更新时间 8
		//日期转换
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date newDate=null;
		try {
			newDate = sdf.parse(update);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String keywords=request.getParameter("keywords");//关键字 9
		String summary=request.getParameter("summary");//摘要 10
		String content=request.getParameter("content");//摘要 11
		String downUrl=request.getParameter("downUrl");//网盘下载地址 12
		String extPwd=request.getParameter("extPwd");//提取密码 13
		String decomPwd=request.getParameter("decomPwd");//解压密码 14
		String tbPath=request.getParameter("tbPath");//缩略图路径 15
		String filePath=request.getParameter("filePath");//文件路径 16
		int status=Integer.parseInt(request.getParameter("status")); //状态 17 如果是管理发布则为1，会员发布则为0
		
		Code code=new Code();		
		if(codeId!=0){//编辑
			code.setId(codeId);
		}		
		code.setAdminId(adminId);
		code.setTitle(title);
		code.setTypeId(typeId);
		code.setPrice(price);
		code.setSort(sort);
		code.setAcs(acs);
		code.setOrigin(origin);
		code.setUpdate(newDate);
		code.setKeywords(keywords);
		code.setSummary(summary);
		code.setContent(content);
		code.setDownUrl(downUrl);
		code.setExtPwd(extPwd);
		code.setDecomPwd(decomPwd);
		code.setTbPath(tbPath);
		code.setFilePath(filePath);
		code.setStatus(status);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int result=0;
		if(codeId!=0){//编辑
			result=new CodeBizImpl().editCode(code);
		}else{//添加
			result=new CodeBizImpl().AddCode(code);
		}
		if(result>0){
			out.write("ok");
		}else{
			out.write("error");
		}		
		out.flush();
		out.close();
	}

}
