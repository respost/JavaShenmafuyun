package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.MentBizImpl;
import com.smfy.entity.Ment;

/**
 * Servlet implementation class Ment_Update_Servlet
 */
public class Ment_Update_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ment_Update_Servlet() {
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
		int id=Integer.parseInt(request.getParameter("id"));//ÆÀÂÛId	
		int status=Integer.parseInt(request.getParameter("status"));//ÆÀÂÛ×´Ì¬	
		Ment ment=new Ment();
		ment.setId(id);
		ment.setStatus(status);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int result=new MentBizImpl().updateMnet(ment);
		
		if(result>0){
			out.write("ok");
		}else{
			out.write("error");
		}	
		
		out.flush();
		out.close();
	}

}
