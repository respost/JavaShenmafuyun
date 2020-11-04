package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smfy.biz.impl.UserBizImpl;
import com.smfy.entity.User;

/**
 * Servlet implementation class User_Bank_Servlet
 */
public class User_Bank_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Bank_Servlet() {
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
		String realName=request.getParameter("realName");
		String bankName=request.getParameter("bankName");
		String bankCard=request.getParameter("bankCard");
		String bankAddress=request.getParameter("bankAddress");
		User user=new User();
		user.setId(id);
		user.setRealName(realName);
		user.setBankName(bankName);
		user.setBankCard(bankCard);
		user.setBankAddress(bankAddress);
		int result=new UserBizImpl().bindBank(user);
		String ret="";
		if(result>0){
			ret="ok";
			//获取session中保存的对象
			HttpSession session=request.getSession();
			User temp=(User)session.getAttribute("user");
			//保存银行信息
			temp.setRealName(realName);
			temp.setBankName(bankName);
			temp.setBankCard(bankCard);
			temp.setBankAddress(bankAddress);
			//重新存session
			session.setAttribute("user", temp);	
		}else {
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
