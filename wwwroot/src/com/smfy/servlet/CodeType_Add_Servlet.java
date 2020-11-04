package com.smfy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smfy.biz.impl.CodeTypeBizImpl;
import com.smfy.entity.CodeType;

/**
 * Servlet implementation class CodeType_Add_Servlet
 */
public class CodeType_Add_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodeType_Add_Servlet() {
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
		int tid=Integer.parseInt(request.getParameter("tid"));
		String name=request.getParameter("typeName");
		String ico=request.getParameter("typeIco");
		
		CodeType codeType=new CodeType();
		codeType.setName(name);
		codeType.setIco(ico);
		int result=0;
		if(tid==0){//Ìí¼Ó
			result=new CodeTypeBizImpl().addCodeType(codeType);
		}else{
			codeType.setId(tid);
			result=new CodeTypeBizImpl().updateCodeType(codeType);
		}		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		if(result>0){
			out.write("ok");
		}else{
			out.write("error");
		}
		out.flush();
		out.close();
	}

}
