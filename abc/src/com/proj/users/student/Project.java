package com.proj.users.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class Project
 */
@WebServlet("/Project")
public class Project extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        try {

	            Connection con = DBClass.DBConnectMethod();
	            PreparedStatement ps = con.prepareStatement("select * from mentee where uname=? and password=?");
	            ps.setString(1, request.getParameter("uname"));
	            ps.setString(2, request.getParameter("password"));
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                ps = con.prepareStatement("update mentee set projecttitle=?, domainname=?, sponsered=?, guidename=?, prodescrip=? where uname=? and password=?");
	               
	                ps.setString(1, request.getParameter("projecttitle"));
	                ps.setString(2, request.getParameter("domainname"));
	                ps.setString(3, request.getParameter("sponsered"));
	                ps.setString(4, request.getParameter("guidename"));
	                ps.setString(5, request.getParameter("prodescrip"));
	                ps.setString(6, request.getParameter("uname"));
	                ps.setString(7, request.getParameter("password"));
	                int i = ps.executeUpdate();
	                if (i > 0) {
	                    out.println("<script>");
	                out.println("alert('Update Successfully')");
	                out.println("window.location = 'MenteeReg1.jsp'");
	                out.println("</script>");
	                    
	                    
	                } else {
	                    System.out.println("Update Failed ..");
	                }

	            } else {
	                ps = con.prepareStatement("insert into mentee values(?,?,?,?,?,?,?,?)");
	                ps.setInt(1, 0);
	                 ps.setString(2, request.getParameter("projecttitle"));
	                ps.setString(3, request.getParameter("domainname"));
	                ps.setString(4, request.getParameter("sponsered"));
	                ps.setString(5, request.getParameter("guidename"));
	                ps.setString(6, request.getParameter("prodescrip"));
	                ps.setString(7, request.getParameter("uname"));
	                ps.setString(8, request.getParameter("password"));
	                int i = ps.executeUpdate();
	                if (i > 0) {
	                    out.println("<script>");
	                out.println("alert('Insert Succesfully')");
	                out.println("window.location = 'MenteeReg1.jsp'");
	                out.println("</script>");
	                  
	                } else {
	                    System.out.println("Insert Failed ..");
	                }
	            }
	        } catch (Exception e) {
	            out.println(e);
	        }
		
		
	}

}