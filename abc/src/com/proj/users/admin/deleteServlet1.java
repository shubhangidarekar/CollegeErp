package com.proj.users.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class deleteServlet1
 */
@WebServlet("/deleteServlet1")
public class deleteServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		out.println("inside get method");
		
		
		Connection con=DBClass.DBConnectMethod();
		String type=request.getParameter("type");
		out.println("Type is "+type);
		String id1=request.getParameter("id");
		String colname=request.getParameter("colname");
		System.out.println("colname : "+colname);
		
		
	/*	out.println("id1="+id1);
		out.println(request.getParameter("id"));
		String hid=request.getParameter("id");
		int id=Integer.parseInt(hid);
		out.println("id of hid = "+hid);*/
		
		try {
			PreparedStatement ps=con.prepareStatement("delete from "+type+ " where "+colname+"=?");
			ps.setString(1,id1);	
			ps.execute();
			response.sendRedirect("admin.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
			out.println(e);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
doGet(request, response);
System.out.println("inside post method");
		
		
	}

}
