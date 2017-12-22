package com.proj.users.mentor;
import com.proj.*;
import com.proj.Utils.DBClass;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RetriveImageServlet
 */
@WebServlet("/RetriveImageServlet")
public class RetriveImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetriveImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//PrintWriter out=response.getWriter();
		Connection con=DBClass.DBConnectMethod();
		ResultSet rs=null;
		OutputStream outstream=response.getOutputStream();
		String uname=request.getParameter("uname");
		System.out.println("inside RetriveImage servlet"+uname);
		
		
		try {
			PreparedStatement ps=con.prepareStatement("select pic from mentor where uname=?");
			ps.setString(1,uname);
			rs=ps.executeQuery();
			if(rs.next()){
				System.out.println("Afeter Result set of RetriveImage");
				byte[]img=rs.getBytes("pic");
				outstream.write(img);
			}
			//response.setContentType("image/jpg");
			
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
