package com.proj.users.mentor;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class MentorRegisterServlet
 */
@WebServlet("/MentorRegisterServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class MentorRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentorRegisterServlet() {
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
		PrintWriter out=response.getWriter();
		try {
		
		 // input stream of the upload file
		Part filePart=request.getPart("photo"); // obtains the upload file part in this multipart request
		InputStream inputStream=filePart.getInputStream();	
		if(filePart!=null){
				// prints out some information for debugging
				System.out.println(filePart.getName());
				System.out.println(filePart.getSize());
				System.out.println(filePart.getContentType());
				
				inputStream=filePart.getInputStream();  // obtains input stream of the upload file
			
			}
		
		
		out.println("inside POST method..");
		out.println(request.getParameter("fname"));
		out.println(request.getParameter("lname"));
		out.println(request.getParameter("phn"));
		out.println(request.getParameter("email"));
		out.println(request.getParameter("domain"));
		Connection con=DBClass.DBConnectMethod();
	
			PreparedStatement ps=con.prepareStatement("update mentor set fname=?,lname=?,phn=?,email=?,domain=?,pic=? where uname=?");
			ps.setString(1,request.getParameter("fname"));
			ps.setString(2,request.getParameter("lname"));
			ps.setString(3,request.getParameter("phn"));
			ps.setString(4,request.getParameter("email"));
			ps.setString(5,request.getParameter("domain"));
			
				//ps.setBlob(6,inputStream); // fetches input stream of the upload file for the blob column
				ps.setBinaryStream(6,inputStream);
		
			ps.setString(7,request.getParameter("uname"));
			
			ps.executeUpdate();
			response.sendRedirect("mentorprofile.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			out.println(e);
		}
		
		
	}

}
