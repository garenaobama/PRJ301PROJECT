/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

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
import model.Order;
import model.SubOrder;

/**
 *
 * @author pc
 */
@WebServlet(name="AdminPage", urlPatterns={"/AdminPage"})
public class AdminPage extends HttpServlet {
   
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
            out.println("<title>Servlet AdminPage</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminPage at " + request.getContextPath () + "</h1>");
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
        OrderDAO od = new OrderDAO();
        try{
            String func="";
            if((String)request.getParameter("func") != null){
                func = (String)request.getParameter("func");
            }
            if(func.equals("showdetail")){
                int oid =Integer.parseInt((String)request.getParameter("oid"));
                request.setAttribute("target", oid);
            }
            if(func.equals("UpdateStatus")){
                int oid =Integer.parseInt((String)request.getParameter("oid"));
                int sid =Integer.parseInt((String)request.getParameter("sid"));
                od.UpdateStatus(oid,sid);
            }
        }
        catch(NumberFormatException e){
            
        }
        List<Order> data;
            int sid=-1;
            if(request.getParameter("sid") != null){
                sid=Integer.parseInt(request.getParameter("sid"));
            }
            String orderby ="desc";
            if(request.getParameter("orderby") != null){
                orderby = request.getParameter("orderby");
            }
            String dfrom = "normal";
            String dto = "normal";
            if(request.getParameter("dfrom") != null){
                    if(!request.getParameter("dfrom").equals("")){
                    dfrom = request.getParameter("dfrom");
                    dto = request.getParameter("dto");
                }
            }
            int num = 1;
            if(request.getParameter("num") != null){
                num = Integer.parseInt(request.getParameter("num"));
            }
          data = od.GetAllByQuery(sid,orderby,dfrom,dto,num);
        request.setAttribute("data", data);
        request.getRequestDispatcher("adminpage.jsp").forward(request, response);
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
        try{
            int oid =Integer.parseInt((String)request.getParameter("oid"));
            OrderDAO od = new OrderDAO();
            Order a = od.GetOrderById(oid);
            List<Order> data = new ArrayList<>();
            data.add(a);
            request.setAttribute("data", data);
            request.getRequestDispatcher("adminpage.jsp").forward(request, response);
        }
        catch(ServletException | IOException | NumberFormatException e){
            
        }
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
