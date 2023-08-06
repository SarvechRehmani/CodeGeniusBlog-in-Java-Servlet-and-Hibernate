/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.genius.blog.servlets;

import com.genius.blog.Entities.*;
import com.genius.blog.helper.FactoryProvider;
import com.genius.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author sarwe
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            int catId = Integer.parseInt(request.getParameter("category"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Part part = request.getPart("pic");
            String imgName = part.getSubmittedFileName();
            try {
                Session s = FactoryProvider.getFactory().openSession();
                Category category = s.load(Category.class, catId);
                HttpSession session = request.getSession();
                Users user = (Users) session.getAttribute("currentUser");
                Post post = new Post(title, content, imgName, new Date(), category, user);
                Transaction tx = s.beginTransaction();
                s.save(post);
                tx.commit();
                s.close();
                String path = request.getRealPath("/") + "img" + File.separator + "blogPics" + File.separator + imgName;
                Helper.saveFile(part.getInputStream(), path);
                out.print("done");
            } catch (Exception e) {
                e.printStackTrace();
                out.print(e);
            }
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
