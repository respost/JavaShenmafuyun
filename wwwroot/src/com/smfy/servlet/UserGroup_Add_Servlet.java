package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.UserGroupBizImpl;
import com.smfy.entity.UserGroup;

/**
 * Servlet implementation class UserGroup_Add_Servlet
 */
public class UserGroup_Add_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserGroup_Add_Servlet() {
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
		int gid=Integer.parseInt(request.getParameter("gid"));
		String name=request.getParameter("name");
		String disc=request.getParameter("disc");

		UserGroup userGroup=new UserGroup(name,disc);
		int falg=0;
		if(gid==0){//Ìí¼Ó
			falg=new UserGroupBizImpl().addUserGroup(userGroup);
		}else{//±à¼­
			userGroup.setId(gid);
			falg=new UserGroupBizImpl().updateUserGroup(userGroup);
		}		
		
		String ret="";
		if (falg>0) {
			ret="ok";
			
		}else {
			ret="error";
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.write(ret);
		out.flush();
		out.close();
		
		
	}

}
