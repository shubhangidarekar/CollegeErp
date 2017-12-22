/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.proj.users.student;

import com.proj.Utils.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class Log extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type");
            String uname = request.getParameter("uname");
            String password = request.getParameter("password");
           
            //System.out.println(type);
            //out.println(type);


           java.sql.Connection con=DBClass.DBConnectMethod();
            java.sql.PreparedStatement ps = con.prepareStatement("select * from " + type + " where uname=? and password=?");

            ps.setString(1, request.getParameter("uname"));
            ps.setString(2, request.getParameter("password"));
            //ps.setString(3,request.getParameter("type"));
            ResultSet rs = ps.executeQuery();


            if (rs.next()) {
                System.out.println("inside match found in db");
                HttpSession session = request.getSession(true);

                session.setAttribute("sessionUname", request.getParameter("uname"));
                session.setAttribute("sessionType", request.getParameter("type"));
                session.setAttribute("sessionPassword", request.getParameter("password"));
                session.setAttribute("sessionDname", rs.getString(4));
                System.out.println("............Session Data........................");
                System.out.println("username   " + session.getAttribute("sessionUname"));
                System.out.println("type       " + session.getAttribute("sessionType"));
                System.out.println("password   " + session.getAttribute("sessionPassword"));
                System.out.println("dname   " + session.getAttribute("sessionDname"));
                System.out.println(".................................................");

                if (request.getParameter("type").equals("admin")) {

                    response.sendRedirect("admin.jsp");
                } else if (request.getParameter("type").equals("hod")) {
                    response.sendRedirect("hodHome.jsp");
                } else if (request.getParameter("type").equals("mentor")) {
                    System.out.println("inside equals for mentor");
                    response.sendRedirect("mentorHome.jsp");
                } else if (request.getParameter("type").equals("mentee")) {		///Madam Module make appropriate change in pageredirect
                    response.sendRedirect("MenteeReg1.jsp");
                } else if (request.getParameter("type").equals("pms")) {		///Madam Module make appropriate change in pageredirect
                    response.sendRedirect("pmsHome.jsp");
                }
            } else {

                out.println("Login Failed...Try again");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
