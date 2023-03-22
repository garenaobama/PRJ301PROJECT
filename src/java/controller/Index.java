/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Option;
import model.Product;

/**
 *
 * @author pc
 */
@WebServlet(name="Index", urlPatterns={"/index"})
public class Index extends HttpServlet {
   
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
            doGet(request, response);
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
    protected int numberOfProduct=8;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();
        //int cateid =Integer.parseInt((String)request.getParameter("categoryid"));
        //int num = Integer.parseInt((String)request.getParameter("num"));
        List<Option> list1 = pd.GetAllProductByCategory(1, numberOfProduct);//PHONG KHACH
        List<Option> list2 = pd.GetAllProductByCategory(9, numberOfProduct);//PHONG NGU
        List<Option> list3 = pd.GetAllProductByCategory(13, numberOfProduct);//PHONG AN
        request.setAttribute("data1", list1);
        request.setAttribute("svip1", pd.GetSVIPProductByCategory(1));
        request.setAttribute("data2", list2);
        request.setAttribute("svip2", pd.GetSVIPProductByCategory(9));
        request.setAttribute("data3", list3);
        request.setAttribute("svip3", pd.GetSVIPProductByCategory(13));
        //========
        String addtocart =(String)request.getParameter("addtocart"); // returns "true" or "false"
        if (addtocart != null && addtocart.equals("true")) {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Item added to cart');");
            out.println("</script>");
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        processRequest(request, response);
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
