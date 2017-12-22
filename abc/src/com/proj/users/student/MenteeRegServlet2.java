package com.proj.users.student;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class MenteeRegServlet2
 */
@WebServlet("/MenteeRegServlet2")
@MultipartConfig(maxFileSize = 16177215)
public class MenteeRegServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenteeRegServlet2() {
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
        PreparedStatement  ps=null;
        Connection con=null;
        try {
            Part filePart = request.getPart("file");
            InputStream inputStream = filePart.getInputStream();
            String imagename = getSubmittedFileName(filePart);   
            con = DBClass.DBConnectMethod();
               ps = con.prepareStatement("update mentee set  menteename=?, deptname=?, mobileno=?, email=?, address=?, fathername=?, mothername=?, gender=?, bloodgroup=?, aadhar=?, pic=? where uname=? and password=?");
                
                ps.setString(1, request.getParameter("menteename"));
                ps.setString(2, request.getParameter("deptname"));
                ps.setString(3, request.getParameter("mobileno"));
                ps.setString(4, request.getParameter("email"));
                ps.setString(5, request.getParameter("address"));
                ps.setString(6, request.getParameter("fathername"));
                ps.setString(7, request.getParameter("mothername"));
                ps.setString(8, request.getParameter("gender"));
                ps.setString(9, request.getParameter("bloodgroup"));
                ps.setString(10, request.getParameter("aadhar"));
                ps.setBinaryStream(11, inputStream);
                ps.setString(12, request.getParameter("uname"));
                ps.setString(13, request.getParameter("password"));
           
               
                int i = ps.executeUpdate();
                if (i > 0) {
                    out.println("<script>");
                out.println("alert('Update Successfully')");
                out.println("window.location = 'MenteeReg1.jsp'");
                out.println("</script>");
                    
                    
                }
                else {
                    System.out.println("Update Failed ..");
                }

           
        } catch (Exception e) {
            out.println(e);
        }
		
		
	}
	
	private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

}
