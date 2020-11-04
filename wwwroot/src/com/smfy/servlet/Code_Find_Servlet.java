package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.smfy.biz.impl.CodeBizImpl;
import com.smfy.entity.Code;

/**
 * Servlet implementation class Code_Where_Servlet
 */
public class Code_Find_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Code_Find_Servlet() {
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
		//获取查询条件
		String tj=request.getParameter("tj");
		tj=new String(tj.getBytes("iso-8859-1"),"utf-8");
		
		//把数据写到web网页
		response.setCharacterEncoding("utf-8");             
		response.setContentType("text/html; charset=UTF-8");	
		PrintWriter out= response.getWriter();  
		if(tj!=null){
			Code code=new CodeBizImpl().findCodeInfo(tj);
			//使用JSON返回数据
			String json=JSON.toJSONString(code);
			out.write(json); 
		}		        		                                 
		out.flush();                                       
		out.close();                                        
	}

}
