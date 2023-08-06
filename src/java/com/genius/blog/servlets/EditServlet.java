/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.genius.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.genius.blog.Entities.Users;
import com.genius.blog.helper.FactoryProvider;
import com.genius.blog.helper.Helper;
import com.genius.blog.msg.Message;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author sarwe
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
//            Getting data from update form
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            Part part = request.getPart("pro-img");

            String imgName = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            Users us = (Users) s.getAttribute("currentUser");
            String oldImg = us.getProfile();
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            Users user = session.load(Users.class, us.getId());
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setGender(gender);
            user.setProfile(imgName);
            tx.commit();
            Users u = session.load(Users.class,user.getId());
            session.close();
            s.removeAttribute("currentUser");
            s.setAttribute("currentUser", u);
            String path = request.getRealPath("/") + "img" + File.separator + "profile" + File.separator;
            if (!oldImg.equalsIgnoreCase("Deafult.png")) {
                Helper.deleteFile(path + oldImg);
            }
            if (Helper.saveFile(part.getInputStream(), path + imgName)) {
                Message msg = new Message("Profile details updated successfully...", "alert-success");
                s.setAttribute("msg", msg);
            } else {
                Message msg = new Message("Something went wrong..! Please try again", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
