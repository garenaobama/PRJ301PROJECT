/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Option;

/**
 *
 * @author pc
 */
@WebServlet(name="search", urlPatterns={"/search"})
public class search extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet search</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet search at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            String word = request.getParameter("search");
            request.setAttribute("word", word);
            ProductDAO pd = new ProductDAO();
            //
            List<Option> list = pd.GetNumProductBySearchKey(word);
            //
            request.setAttribute("data", list);
            request.getRequestDispatcher("searchresult.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            String orderby = (String)request.getParameter("orderby");
            String word = ((String)request.getParameter("word")).trim();
            double from =-1;
            double to =-1;
            if((String)request.getParameter("from") != null){
                from = Double.parseDouble((String)request.getParameter("from"));
                to = Double.parseDouble((String)request.getParameter("to"));
                request.setAttribute("choosefrom", from);
                request.setAttribute("chooseto", to);
            }
            //session store
            request.setAttribute("word", word);
            request.setAttribute("chooseorder", orderby);
            //
            ProductDAO pd = new ProductDAO();
            List<Option> list = pd.GetNumProductBySearchKey(word, orderby, from, to);
            request.setAttribute("data", list);
            request.getRequestDispatcher("searchresult.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
