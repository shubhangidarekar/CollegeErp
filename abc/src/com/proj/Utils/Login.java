package com.proj.Utils;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		System.out.println("inside login servlet in Post Method");
		PrintWriter out=response.getWriter();
		
		
		Connection con=DBClass.DBConnectMethod();
		String type=request.getParameter("type");
		System.out.println("form data ");
		System.out.println("uname :"+request.getParameter("uname"));
		System.out.println("password :"+request.getParameter("password"));
		System.out.println(request.getParameter("type"));

		try {
			PreparedStatement ps=con.prepareStatement("select * from "+type+" where uname=? and password=?");
			System.out.println("below ps statement");
			ps.setString(1,request.getParameter("uname"));
			ps.setString(2,request.getParameter("password"));
			ResultSet rs=ps.executeQuery();
			System.out.println("below Execute Query");
					if(rs.next()){
						System.out.println("inside match found in db");
						HttpSession session=request.getSession(true);	//setting a new session is ensured only if getSession() method is passed with true as argument.
						session.setAttribute("sessionUname",request.getParameter("uname"));
						session.setAttribute("sessionType",request.getParameter("type"));
						session.setAttribute("sessionPassword",request.getParameter("password"));
						session.setAttribute("sessionDname",rs.getString(4));
						
						
						System.out.println("............Session Data........................");
						System.out.println("username   "+session.getAttribute("sessionUname"));
						System.out.println("type       "+session.getAttribute("sessionType"));
						System.out.println("password   "+session.getAttribute("sessionPassword"));
						System.out.println("dname   "+session.getAttribute("sessionDname"));
						
						System.out.println("user Fname"+session.getAttribute("sessionfname"));
						System.out.println(".................................................");
					
						if(request.getParameter("type").equals("admin")){
							
							response.sendRedirect("admin.jsp");
						}
						else if(request.getParameter("type").equals("hod")){
								response.sendRedirect("hodHome.jsp");
								session.setAttribute("hid",rs.getInt(1) );
								session.setAttribute("senderid",rs.getInt(1) );
								session.setAttribute("sessionfname",rs.getString("fname"));
								
								System.out.println("hid"+session.getAttribute("hid"));
								System.out.println("senderid "+session.getAttribute("senderid"));
								
								
								System.out.println(".................................................");
						}
						else if(request.getParameter("type").equals("mentor")){
							System.out.println("inside equals for mentor");
							session.setAttribute("mid",rs.getInt(1) );
							session.setAttribute("senderid",rs.getInt(1) );
							session.setAttribute("sessionfname",rs.getString("fname"));
							System.out.println("mid"+session.getAttribute("mid"));
							System.out.println(".................................................");
							response.sendRedirect("mentorHome.jsp");
						}else if(request.getParameter("type").equals("mentee")){	
							System.out.println("Fname fetced from Student table......"+rs.getString("menteename"));
							session.setAttribute("sessionmenteeid",rs.getInt(1));
							session.setAttribute("sessionfname",rs.getString("menteename"));///Madam Module make appropriate change in pageredirect
							session.setAttribute("senderid",rs.getInt(1) );
							response.sendRedirect("MenteeReg1.jsp");
						}
						else if(request.getParameter("type").equals("pms")){		///Madam Module make appropriate change in pageredirect
							session.setAttribute("sessionfname",rs.getString("fname"));
							session.setAttribute("senderid",rs.getInt(1) );
							response.sendRedirect("pmsHome.jsp");
							
						}
					}
					else{
						
						out.println("Login Failed...Try again");
						response.sendRedirect("login.jsp");
					}
				
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
