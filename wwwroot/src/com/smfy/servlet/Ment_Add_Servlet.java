package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.MentBizImpl;
import com.smfy.entity.Ment;

/**
 * Servlet implementation class Ment_Add_Servlet
 */
public class Ment_Add_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ment_Add_Servlet() {
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
		int mentId=Integer.parseInt(request.getParameter("mentId"));//评论Id		

		Ment ment=new Ment();
		
		if(mentId==0){//添加
			int cid=Integer.parseInt(request.getParameter("cid"));//源码Id
			int uid=Integer.parseInt(request.getParameter("uid"));//用户Id
			String content=request.getParameter("content");//评论内容
			ment.setCid(cid);
			ment.setUid(uid);
			ment.setContent(content);
			

		}else{
			String reply=request.getParameter("reply");//回复内容
			Date reDate=new Date(System.currentTimeMillis());//回复时间
			ment.setId(mentId);
			ment.setReply(reply);
			ment.setReDate(reDate);
		}
				
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int result=0;
		if(mentId==0){//添加评论
			String code=request.getParameter("code");
			String numrand=(String) request.getSession().getAttribute("code");//取出系统生成的验证码
			if(code.equalsIgnoreCase(numrand)){//判断验证码
				result=new MentBizImpl().addMent(ment);
				if(result>0){
					out.write("ok");
				}else{
					out.write("error");
				}	
			}else{
				out.write("vcError");
			}
		}else{//回复评论
			result=new MentBizImpl().reMent(ment);
			if(result>0){
				out.write("ok");
			}else{
				out.write("error");
			}	
		}				
	
		out.flush();
		out.close();
	}

}
