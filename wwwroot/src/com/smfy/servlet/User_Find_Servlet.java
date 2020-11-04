package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.smfy.biz.impl.UserBizImpl;
import com.smfy.entity.User;

/**
 * Servlet implementation class User_Find_Servlet
 */
public class User_Find_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Find_Servlet() {
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
		//��ѯ����
		String tj=request.getParameter("tj");
	    //�жϽ��յ��ַ�������û�����ģ�û�оʹ�����������    
	    Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
		Matcher m = p.matcher(tj);
		if (!m.find()) {
			tj=new String(tj.getBytes("ISO-8859-1"),"utf-8");
		}
		
		User user=new UserBizImpl().findUser(tj);
		if(user!=null){
			String json=JSON.toJSONString(user);
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		}
	
	}

}