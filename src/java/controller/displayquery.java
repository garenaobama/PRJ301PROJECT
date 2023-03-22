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
@WebServlet(name="displayquery", urlPatterns={"/displayquery"})
public class displayquery extends HttpServlet {
   
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
            out.println("<title>Servlet displayquery</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet displayquery at " + request.getContextPath () + "</h1>");
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
        HttpSession session=request.getSession();
        //
        ProductDAO pd = new ProductDAO();
        int sort = 1;
        try{
            if(request.getParameter("sort") != null){
                 sort=Integer.parseInt(request.getParameter("sort").trim());
            }
            if(request.getParameter("proidn") != null){
                int pid = Integer.parseInt(request.getParameter("proidn"));
                sort = pd.GetPurposeIdByID(pid);
            }
        }
        catch(NumberFormatException e){
            
        }
        CategoryDAO cdd = new CategoryDAO();
        List<Option> list = pd.GetNumProductByCategoryDescribe(sort, 1);
        List<Category> cl = cdd.GetAllCategoryByPurposeID(sort);
        session.setAttribute("pur", sort);
        request.setAttribute("purpose", pd.GetPurposeByID(sort));
        request.setAttribute("data", list);
        session.setAttribute("catelist", cl);
        request.getRequestDispatcher("productquery.jsp").forward(request, response);
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
            HttpSession session=request.getSession();
            int pur =(int) session.getAttribute("pur");
            int cate = Integer.parseInt((String)request.getParameter("cate"));
            String orderby = (String)request.getParameter("orderby");
            double from =-1;
            double to =-1;
            if(request.getParameter("from") != null){
                from = Double.parseDouble((String)request.getParameter("from"));
                to = Double.parseDouble((String)request.getParameter("to"));
                session.setAttribute("choosefrom", from);
                session.setAttribute("chooseto", to);
            }
            //session store
            session.setAttribute("choosecate", cate);
            session.setAttribute("chooseorder", orderby);
            //
            ProductDAO pd = new ProductDAO();
            request.setAttribute("purpose", pd.GetPurposeByID(pur));
            CategoryDAO cdd = new CategoryDAO();
            List<Category> cl = cdd.GetAllCategoryByPurposeID(pur);
            List<Option> list = pd.GetNumProductByQueryAttribute(pur, 1, cate, from, to, orderby);
            request.setAttribute("data", list);
            request.getRequestDispatcher("productquery.jsp").forward(request, response);
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
