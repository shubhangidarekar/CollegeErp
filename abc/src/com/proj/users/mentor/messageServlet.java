package com.proj.users.mentor;

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
import javax.websocket.Session;

import com.proj.Utils.DBClass;

/**
 * Servlet implementation class messageServlet
 */
@WebServlet("/messageServlet")
public class messageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		int senderid=Integer.parseInt(request.getParameter("senderid"));
		int reciverid =Integer.parseInt(request.getParameter("reciverid"));
		String msgcontent=request.getParameter("msgcontent");
		
		out.println("Sender id"+senderid);
		out.println("Reciver id "+reciverid);
		out.println(msgcontent);
		//String senderName=session.getAttribute("sessionfname").toString();
		//out.print("sender name "+senderName);
		
		Connection con=DBClass.DBConnectMethod();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("insert into message values(?,?,?,?,?,?)");
			ps.setInt(1,0);
			ps.setInt(2, senderid);
			ps.setString(3,msgcontent);
			ps.setString(4,request.getParameter("time") );
			ps.setString(5,session.getAttribute("sessionfname").toString());
			ps.setInt(6,reciverid);
			 int rs=ps.executeUpdate();
			 response.sendRedirect("Messages.jsp?senderid="+senderid+"&reciverid="+reciverid);
		} catch (SQLException e) {
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
