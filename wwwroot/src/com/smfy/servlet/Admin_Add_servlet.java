package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.AdminBizImpl;
import com.smfy.entity.Admin;

/**
 * Servlet implementation class Admin_Add_servlet
 */
public class Admin_Add_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Add_servlet() {
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
		request.setCharacterEncoding("utf-8");
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String password=request.getParameter("password");;
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		int roleId=Integer.parseInt(request.getParameter("role"));
		

		Admin admin=new Admin();
		if(id!=0){
			admin.setId(id);
		}
		admin.setName(name);
		admin.setPassword(password);
		admin.setPhone(phone);
		admin.setEmail(email);
		admin.setRoleId(roleId);
		
		int falg=0;
		if(id==0){//Ìí¼Ó
			falg=new AdminBizImpl().addAdmin(admin);
		}else{
			falg=new AdminBizImpl().UpdateAdmin(admin);
		}
		
		String ret="";
		if(falg>0){
			ret="ok";
		}else{
			ret="error";
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.write(ret);
		out.flush();
		out.close();

		
	}

}
