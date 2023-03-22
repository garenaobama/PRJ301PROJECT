/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Order;
import model.SubOrder;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name="SubmitOrder", urlPatterns={"/SubmitOrder"})
public class SubmitOrder extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected String[] al;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int uid = Integer.parseInt((String)request.getParameter("uid"));
        al =request.getParameterValues("option");
        CartDAO cd = new CartDAO();
        List<Cart> listc = new ArrayList<>();
        for(int i =0;i<al.length;i++){
            listc.add(cd.GetCartByProId(Integer.parseInt(al[i]),uid));
        }
        request.setAttribute("data", listc);
        request.getRequestDispatcher("submitOrder.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        int uid =((User)session.getAttribute("account")).getId();
        String clientname =(String) request.getParameter("clientname");
        String phonenumber =(String) request.getParameter("phonenumber");
        double totalprice = Double.parseDouble((String) request.getParameter("totalprice"));
        String deliveryaddress = ((String) request.getParameter("province")) + ", " + ((String) request.getParameter("address"));
        OrderDAO od = new OrderDAO();
        Order order = new Order(uid,clientname,phonenumber,totalprice,deliveryaddress);
        
        CartDAO cd = new CartDAO();
        List<Cart> listcart = new ArrayList<>();
        for(int i =0;i<al.length;i++){
            listcart.add(cd.GetCartByProId(Integer.parseInt(al[i]),uid));
        }
        List<SubOrder> lo = od.ListCartToListSubOrder(listcart);
        od.CreateOrder(order, lo);
        response.sendRedirect("UserDetail?index=myorder");
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
