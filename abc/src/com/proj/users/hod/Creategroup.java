package com.proj.users.hod;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proj.Utils.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Creategroup
 */
@WebServlet("/Creategroup")
public class Creategroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Creategroup() {
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
		out.print("inside get method");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PreparedStatement ps,ps1=null;
		PrintWriter out=response.getWriter();
		out.print("inside get POST..!!!");
		HttpSession session=request.getSession();
		String guideName=request.getParameter("fname");
		String dept=(String) session.getAttribute("sessionDname").toString();
		int groupid=0;
		System.out.println("form data recived..");
		System.out.println("Student ID 1 recived is :"+request.getParameter("student1id"));
		System.out.println("Student ID 2 recived is :"+request.getParameter("student2id"));
		System.out.println("Student ID 3 recived is :"+request.getParameter("student3id"));
		System.out.println("Student ID 4 recived is :"+request.getParameter("student4id"));
		System.out.println("Recived Project title is :"+request.getParameter("projecttitle"));
		System.out.println("recived domain name is :"+request.getParameter("domain"));
		System.out.println("recived  fname is :"+request.getParameter("fname"));
		System.out.println("recived mid id "+request.getParameter("mid"));
		System.out.println("Department is : "+dept);
		Connection con=DBClass.DBConnectMethod();
		try {
			ps=con.prepareStatement("insert into projectgroup values(?,?,?,?,?,?,?,?,?)");  //we are inserting the data in projectgroup table with ps and along 
			ps.setInt(1,0);															//with this we are updating the mentee table with ps1 assignflag
			ps.setString(2, request.getParameter("student1id"));
			ps.setString(3, request.getParameter("student2id"));
			ps.setString(4, request.getParameter("student3id"));
			ps.setString(5, request.getParameter("student4id"));
			ps.setString(6, request.getParameter("projecttitle"));
			ps.setString(7, request.getParameter("domain"));
			ps.setString(8, request.getParameter("mid"));
			ps.setString(9,dept);
			int rs=ps.executeUpdate();
			
			
			
			ps=con.prepareStatement("select groupid from projectgroup where mid=? and menteeid1=? and menteeid2=? and menteeid3=? and menteeid4=?");
			ps.setInt(1,Integer.parseInt(request.getParameter("mid")));
			ps.setString(2,request.getParameter("student1id"));
			ps.setString(3,request.getParameter("student2id"));
			ps.setString(4,request.getParameter("student3id"));
			ps.setString(5,request.getParameter("student4id"));
			ResultSet rs1=ps.executeQuery();
			while(rs1.next()){
				groupid=rs1.getInt("groupid");
			}
			
			ps=con.prepareStatement("update mentee set guidename=?,mid=?,groupid=? where projecttitle=?");
			ps.setString(1, guideName);
			ps.setInt(2,Integer.parseInt(request.getParameter("mid")));
			ps.setInt(3,groupid);
			ps.setString(4,request.getParameter("projecttitle"));
		
			int rs2=ps.executeUpdate();
			if(rs>0&&rs2>0){
				System.out.println("Group Creation Succesfull");
				response.sendRedirect("CreateGroup.jsp");
			}else{
				System.out.println("Group Creation Failed");
				response.sendRedirect("CreateGroup.jsp");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

}
