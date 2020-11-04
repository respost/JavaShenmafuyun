package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.smfy.biz.impl.UserBizImpl;
import com.smfy.entity.User;

/**
 * Servlet implementation class User_Phone_Servlet
 */
public class User_Phone_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Phone_Servlet() {
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
		//使用手机动态登录
		String phone=request.getParameter("phone");
		//要返回客户端的用户对象
		User user=null;
		//查看号码是否存在
		User temp=new UserBizImpl().phoneLogin(phone);	
		if(temp!=null){//号码存在，直接登录
			user=new UserBizImpl().userLogin(temp);
		}else{//号码不存在，自动创建账号
			User regUser=new User();
			regUser.setName(phone);
			regUser.setPassword("123456");
			regUser.setPhone("");
			regUser.setQq("");
			regUser.setEmail("");
			int result=new UserBizImpl().addUser(regUser);
			if(result>0){
				user=new UserBizImpl().userLogin(regUser);
			}
		}
		response.setCharacterEncoding("utf-8");             
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		if(user!=null){
			int status=user.getStatus();
			if(status==1){
				 out.write("stop");//账号被停用
			}else{
				//更改在线状态
				user.setIslogin(1);
				//更新最新登录时间
				Timestamp dateNow=new Timestamp(System.currentTimeMillis());//获取当前系统时间
				user.setLoginDate(dateNow);
				new UserBizImpl().updateUserStatus(user);
				//使用JSON返回用户对象
				String json=JSON.toJSONString(user);
				//存session
				HttpSession session=request.getSession();
				session.setAttribute("user", user);				
			    out.write(json);
			}		
		}else{
			out.write("error");
		}
		out.flush(); 
		out.close(); 
		
	}

}
