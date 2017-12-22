package com.proj.users.student;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class StudentRetriveImage
 */
@WebServlet("/StudentRetriveImage")
public class StudentRetriveImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRetriveImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		Connection con=DBClass.DBConnectMethod();
		ResultSet rs=null;
		OutputStream outstream=response.getOutputStream();
		String uname=request.getParameter("uname");
		System.out.println("inside RetriveImage servlet"+uname);
		
		
		try {
			PreparedStatement ps=con.prepareStatement("select pic from mentee where uname=?");
			ps.setString(1,uname);
			rs=ps.executeQuery();
			if(rs.next()){
				System.out.println("After Result set of RetriveImage");
				byte[]img=rs.getBytes("pic");
				outstream.write(img);
				System.out.println("After Writing the Image ....");
			}
			response.setContentType("image/jpg");
			
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
	}

}
