package com.proj.users.admin;
import java.sql.*;
import java.util.Random;

import com.proj.Utils.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String type=request.getParameter("type");
		out.println("Form data recived");
		out.println("uname :"+uname);
		out.println("type : "+type);
		System.out.println("Dept name :"+request.getParameter("dname"));
		System.out.println("Uname:"+request.getParameter("uname"));
	
		Random r=new Random();
		int numb=1000+(int)(r.nextFloat()*12348);
		String rpassword=String.valueOf(numb);
		
		 try {
			 
			 con=DBClass.DBConnectMethod();
				ps=con.prepareStatement("select * from mentee where uname=? and password=?");
				ps.setString(1,uname);
				ps.setString(2,rpassword);
				rs=ps.executeQuery();
				
				if(rs.next()){
					Random r1=new Random();
					int numb1=1000+(int)(r.nextFloat()*32457);
					String rpassword1=String.valueOf(numb1);
					System.out.println("password --"+rpassword1);
					ps = con.prepareStatement("insert into mentee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					 ps.setInt(1, 0);
			         ps.setString(2, request.getParameter("menteename"));
			         ps.setString(3, request.getParameter("dname"));
			         ps.setString(4, request.getParameter("mobileno"));
			         ps.setString(5, request.getParameter("email"));
			         ps.setString(6, request.getParameter("address"));
			         ps.setString(7, request.getParameter("uname"));
			         ps.setString(8,rpassword1);
			         ps.setString(9, request.getParameter("fathername"));
			         ps.setString(10, request.getParameter("mothername"));
			         ps.setString(11, request.getParameter("gender"));
			         ps.setString(12, request.getParameter("bloodgroup"));
			         ps.setString(13, request.getParameter("aadhar"));
			         ps.setString(14,"");
			         ps.setString(15,"");
			         ps.setString(16,"");
			         ps.setString(17,"");
			         ps.setString(18,"");
			         ps.setString(19,"");
			         ps.setString(20,"");
			         ps.setString(21,"");
			         ps.setString(22,"");
			         ps.setString(23,"");
			         ps.setString(24,"");
			         ps.setString(25,"");
			         ps.setString(26,"");
			         ps.setString(27,"");
			         ps.setString(28,"");
			         ps.setString(29,"");
			         ps.setString(30,"");
			         ps.setString(31,"");
			         ps.setInt(32, 0);
			         ps.setInt(33, 0);
			         ps.setInt(34, 0);
			         ps.setInt(35, 0);
			         ps.setString(36,"");
			         int i = ps.executeUpdate();
			         response.sendRedirect("admin.jsp");
				}
				else{
				   	System.out.println("password --"+rpassword);
					 ps = con.prepareStatement("insert into mentee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					 ps.setInt(1, 0);
			         ps.setString(2, request.getParameter("menteename"));
			         ps.setString(3, request.getParameter("dname"));
			         ps.setString(4, request.getParameter("mobileno"));
			         ps.setString(5, request.getParameter("email"));
			         ps.setString(6, request.getParameter("address"));
			         ps.setString(7, request.getParameter("uname"));
			         ps.setString(8,rpassword);
			         ps.setString(9, request.getParameter("fathername"));
			         ps.setString(10, request.getParameter("mothername"));
			         ps.setString(11, request.getParameter("gender"));
			         ps.setString(12, request.getParameter("bloodgroup"));
			         ps.setString(13, request.getParameter("aadhar"));
			         ps.setString(14,"");
			         ps.setString(15,"");
			         ps.setString(16,"");
			         ps.setString(17,"");
			         ps.setString(18,"");
			         ps.setString(19,"");
			         ps.setString(20,"");
			         ps.setString(21,"");
			         ps.setString(22,"");
			         ps.setString(23,"");
			         ps.setString(24,"");
			         ps.setString(25,"");
			         ps.setString(26,"");
			         ps.setString(27,"");
			         ps.setString(28,"");
			         ps.setString(29,"");
			         ps.setString(30,"");
			         ps.setString(31,"");
			         ps.setInt(32, 0);
			         ps.setInt(33, 0);
			         ps.setInt(34, 0);
			         ps.setInt(35, 0);
			      
			         ps.setString(36,"");
			         int i = ps.executeUpdate();	
			         response.sendRedirect("admin.jsp");
				}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String type=request.getParameter("type");
		out.println("Form data recived");
		out.println("uname :"+uname);
		out.println("type : "+type);
		
		Random r=new Random();
		int numb=1000+(int)(r.nextFloat()*12348);
		String rpassword=String.valueOf(numb);
		try{

			con=DBClass.DBConnectMethod();
			ps=con.prepareStatement("select * from mentor where uname=? and password=?");
			ps.setString(1,uname);
			ps.setString(2,rpassword);
			rs=ps.executeQuery();
			
				if(rs.next()){
					Random r1=new Random();
					int numb1=1000+(int)(r.nextFloat()*32457);
					String rpassword1=String.valueOf(numb1);
					
					ps=con.prepareStatement("insert into "+type+" values(?,?,?,?,?,?,?,?,?,?,?)");
					ps.setInt(1,0);
					ps.setString(2,"null");
					ps.setString(3,"null");
					ps.setString(4,request.getParameter("dname"));
					ps.setString(5,"null");
					ps.setString(6,"null");
					ps.setString(7,request.getParameter("uname"));
					ps.setString(8,rpassword);
					ps.setString(9,"null");
					ps.setString(10,"null");
					ps.setString(11,"null");
					
					int rs1=ps.executeUpdate();
					out.println("Record inserted Success  when rs.next() is true: "+rs1);
					response.sendRedirect("admin.jsp");	
				}
				else{
					ps=con.prepareStatement("insert into mentor values(?,?,?,?,?,?,?,?,?,?,?)");
					ps.setInt(1,0);
					ps.setString(2,"null");
					ps.setString(3,"null");
					ps.setString(4,request.getParameter("dname"));
					ps.setString(5,"null");
					ps.setString(6,"null");
					ps.setString(7,request.getParameter("uname"));
					ps.setString(8,rpassword);
					ps.setString(9,"null");
					ps.setString(10,"null");
					ps.setString(11,"null");
					int rs2=ps.executeUpdate();
					out.println("Record inserted Success  when rs.next() is false: "+rs2);
					response.sendRedirect("admin.jsp");	
				}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			out.println(e);
			e.printStackTrace();
		}
		
	}

}
