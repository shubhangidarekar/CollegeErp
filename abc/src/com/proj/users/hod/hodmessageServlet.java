package com.proj.users.hod;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class hodmessageServlet
 */
@WebServlet("/hodmessageServlet")
public class hodmessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hodmessageServlet() {
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
		HttpSession session=request.getSession();
		int senderid=Integer.parseInt(request.getParameter("senderid"));
		int reciverid=Integer.parseInt(request.getParameter("reciverid"));
		String msgcontent=request.getParameter("msgcontent");
		out.println("recived hoid id (sender of message) is "+request.getParameter("senderid"));
		out.println("recived guidid (reciver of message is )"+request.getParameter("reciverid"));
		out.println("Content of reciver of message is "+msgcontent);
		
		Connection con=DBClass.DBConnectMethod();
		try {
			PreparedStatement ps = con.prepareStatement("insert into message values(?,?,?,?,?,?)");
			ps.setInt(1,0);
			ps.setInt(2,senderid);
			ps.setString(3,request.getParameter("msgcontent"));
			ps.setString(4,request.getParameter("time"));
			ps.setString(5,session.getAttribute("sessionfname").toString());
			ps.setInt(6,reciverid);
			int rs=ps.executeUpdate();
			 response.sendRedirect("Messageshod.jsp?guideid="+reciverid);
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
	}

}
