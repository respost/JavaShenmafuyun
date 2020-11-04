package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.UserBizImpl;
import com.smfy.entity.User;

/**
 * Servlet implementation class User_Update_Servlet
 */
public class User_Update_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Update_Servlet() {
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
		String password=request.getParameter("password");
		int groupId=Integer.parseInt(request.getParameter("groupId"));
		
		User user=new User();
		user.setPassword(password);		
		user.setGroupId(groupId);
		int i=0;
		if(id!=0){//±à¼­
			String nick=request.getParameter("nick");		
			//nick=new String(nick.getBytes("ISO-8859-1"),"utf-8");
			float money=Float.parseFloat(request.getParameter("money"));
			int points=Integer.parseInt(request.getParameter("points"));			
			String phone=request.getParameter("phone");
			String qq=request.getParameter("qq");
			String email=request.getParameter("email");
			String realName=request.getParameter("realName");
			//realName=new String(realName.getBytes("ISO-8859-1"),"utf-8");
			String bankName=request.getParameter("bankName");
			//bankName=new String(bankName.getBytes("ISO-8859-1"),"utf-8");
			String bankCard=request.getParameter("bankCard");
			String bankAddress=request.getParameter("bankAddress");
			//bankAddress=new String(bankAddress.getBytes("ISO-8859-1"),"utf-8");
			user.setId(id);			
			user.setNick(nick);
			user.setMoney(money);
			user.setPoints(points);			
			user.setPhone(phone);
			user.setQq(qq);
			user.setEmail(email);
			user.setRealName(realName);
			user.setBankName(bankName);
			user.setBankCard(bankCard);
			user.setBankAddress(bankAddress);
			i=new UserBizImpl().updateUser(user);
		}else{//Ìí¼Ó
			String name=request.getParameter("name");
			user.setName(name);
			i=new UserBizImpl().addUser(user);
		}
		
		String ret="";
		if(i>0){
			ret="ok";
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
