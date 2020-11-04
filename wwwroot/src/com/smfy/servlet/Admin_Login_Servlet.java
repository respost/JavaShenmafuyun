package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smfy.biz.impl.AdminBizImpl;
import com.smfy.entity.Admin;

/**
 * Servlet implementation class Admin_Login_Servlet
 */
public class Admin_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Login_Servlet() {
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
		String userName=request.getParameter("userName");
		String userPwd=request.getParameter("userPwd");
		String code=request.getParameter("code");
		String numrand=(String) request.getSession().getAttribute("code");//取出系统生成的验证码
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		//先检查验证码
		if(code.equalsIgnoreCase(numrand)){
			//创建对象
			Admin temp=new Admin();
			temp.setName(userName);
			temp.setPassword(userPwd);
			Admin admin=new AdminBizImpl().adminLogin(temp);
				if(admin!=null){
					int status=admin.getStatus();
					if(status==1){
						 out.write("stop");//账号被停用
					}else{
					//更新最新登录时间
					Timestamp loginDate=new Timestamp(System.currentTimeMillis());//获取当前系统时间
					admin.setLoginDate(loginDate);
					new AdminBizImpl().updateAdminStatus(admin);
				   //保存Session
					HttpSession session=request.getSession();
					session.setAttribute("admin", admin);
					out.write("ok");
					}
				}else {
					out.write("error");
			}
		}else{
			out.write("vcError");
		}
		out.flush();
		out.close();		
		
	}
}
