package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.smfy.biz.impl.AdminBizImpl;
import com.smfy.entity.Admin;

/**
 * Servlet implementation class Admin_List_Servlet
 */
public class Admin_List_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_List_Servlet() {
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
		//查询条件
		String tj=request.getParameter("tj");
	    //判断接收的字符串中有没有中文，没有就处理中文乱码    
	    Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
	    Matcher m = p.matcher(tj);
	    if (!m.find()) {
	    	tj=new String(tj.getBytes("ISO-8859-1"),"utf-8");
	    }

		List<Admin> adminList=new AdminBizImpl().findAlladmin(tj);
		//使用JSON返回用户对象
		String json=JSON.toJSONString(adminList);
		response.setCharacterEncoding("utf-8");             
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();             
		out.write(json);                                 
		out.flush();                                        
		out.close();   
	}

}
