/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Option;
import model.Product;

/**
 *
 * @author pc
 */
@WebServlet(name="UpdateProduct", urlPatterns={"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath () + "</h1>");
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
        int pid = Integer.parseInt(request.getParameter("id"));
        ProductDAO pd = new ProductDAO();
        Product p = pd.GetProductByID(pid);
        request.setAttribute("product", p);
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
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
        int pid = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name").trim();
        int cateid = Integer.parseInt(request.getParameter("cateid"));
        String describe = request.getParameter("describe").trim();
        String material = request.getParameter("material").trim();
        String size = request.getParameter("size").trim();
        String color = request.getParameter("color").trim();
        
        //
        String aopid[] = request.getParameterValues("opid");
        String aopdes[] = request.getParameterValues("opdes");
        String aprice[] = request.getParameterValues("price");
        String adiscount[] = request.getParameterValues("discount");
        
        //
        
        Product p = new Product(pid,cateid,name,describe,material,size,color);
        ProductDAO pd = new ProductDAO();
        List<Option> listo = new ArrayList<>();
        for(int i =0;i<aopdes.length;i++){
            Option a = new Option(Integer.parseInt(aopid[i]), aopdes[i].trim(),Double.parseDouble(aprice[i]), Integer.parseInt(adiscount[i]));
            listo.add(a);
            //
            //PrintWriter out = response.getWriter();
            //out.println(a.getOptiondescribe()+"===");
            //
        }
        for (int i =0;i<listo.size();i++){
            pd.UpdateProductById(p, listo.get(i));
        }
        
        }catch(NumberFormatException e){
            
       }
       request.getRequestDispatcher("AdminPage2").forward(request, response);
       
       
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
