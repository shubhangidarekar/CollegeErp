package com.proj.users.student;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class ImgUpload
 */
@WebServlet("/ImgUpload")
@javax.servlet.annotation.MultipartConfig
public class ImgUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgUpload() {
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

	            Part filePart = request.getPart("file");
	            InputStream inputStream = filePart.getInputStream();
	            String imagename = getSubmittedFileName(filePart);

	        
	            Connection con = DBClass.DBConnectMethod();
	          
	            
	            java.sql.PreparedStatement ps = con.prepareStatement("update mentee set file=?,imagename=? where uname=? and password=?");


	            ps.setBinaryStream(1, inputStream);
	            ps.setString(2, imagename);
	            ps.setString(3, request.getParameter("uname"));
	            ps.setString(4, request.getParameter("password"));

	            int i = ps.executeUpdate();
	            if (i > 0) {
	                out.println("<script>");
	                out.println("alert('Upload Document Successfully')");
	                out.println("window.location = 'MenteeReg1.jsp?data=data'");
	                out.println("</script>");
	                
	                
	             
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
