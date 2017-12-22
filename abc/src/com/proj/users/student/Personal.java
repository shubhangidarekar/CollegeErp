/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.proj.users.student;

import com.proj.Utils.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Personal extends HttpServlet {

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

            Connection con = DBClass.DBConnectMethod();
            PreparedStatement ps = con.prepareStatement("select * from mentee where uname=? and password=?");
            ps.setString(1, request.getParameter("uname"));
            ps.setString(2, request.getParameter("password"));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps = con.prepareStatement("update mentee set menteeid=?, menteename=?, deptname=?, mobileno=?, email=?, address=?, fathername=?, mothername=?, gender=?, bloodgroup=?, aadhar=? where uname=? and password=?");
                ps.setInt(1, 0);
                ps.setString(2, request.getParameter("menteename"));
                ps.setString(3, request.getParameter("deptname"));
                ps.setString(4, request.getParameter("mobileno"));
                ps.setString(5, request.getParameter("email"));
                ps.setString(6, request.getParameter("address"));
                ps.setString(7, request.getParameter("fathername"));
                ps.setString(8, request.getParameter("mothername"));
                ps.setString(9, request.getParameter("gender"));
                ps.setString(10, request.getParameter("bloodgroup"));
                ps.setString(11, request.getParameter("aadhar"));
                ps.setString(12, request.getParameter("uname"));
                ps.setString(13, request.getParameter("password"));
                int i = ps.executeUpdate();
                if (i > 0) {
                    out.println("<script>");
                out.println("alert('Update Successfully')");
                out.println("window.location = 'MenteeReg1.jsp'");
                out.println("</script>");
                    
                    
                } else {
                    System.out.println("Update Failed ..");
                }

            } else {
                ps = con.prepareStatement("insert into mentee values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, 0);
                ps.setString(2, request.getParameter("menteename"));
                ps.setString(3, request.getParameter("deptname"));
                ps.setString(4, request.getParameter("mobileno"));
                ps.setString(5, request.getParameter("email"));
                ps.setString(6, request.getParameter("address"));
                ps.setString(7, request.getParameter("fathername"));
                ps.setString(8, request.getParameter("mothername"));
                ps.setString(9, request.getParameter("gender"));
                ps.setString(10, request.getParameter("bloodgroup"));
                ps.setString(11, request.getParameter("aadhar"));
                ps.setString(12, request.getParameter("uname"));
                ps.setString(13, request.getParameter("password"));
                int i = ps.executeUpdate();
                if (i > 0) {
                    out.println("<script>");
                out.println("alert('Insert Succesfully')");
                out.println("window.location = 'MenteeReg1.jsp'");
                out.println("</script>");
                  
                } else {
                    System.out.println("Insert Failed ..");
                }
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
