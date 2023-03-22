/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
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
import model.Cart;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name="Register", urlPatterns={"/Register"})
public class Register extends HttpServlet {
   
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
            out.println("<title>Servlet Register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        UserDAO ud= new UserDAO();
        String name = request.getParameter("name").trim();
        String gender = request.getParameter("gender");
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String passwordagain = request.getParameter("passwordagain").trim();
        
        if(name.length()<1){
            request.setAttribute("ms", "Tên không được để trống");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        if(ud.isExist(username)){
            request.setAttribute("ms", "Tài khoản đã tồn tại");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        if(password.length()<6){
            request.setAttribute("ms", "Mật khẩu phải nhiều hơn 6 kí tự");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        if(!password.equals(passwordagain)){
            request.setAttribute("ms", "Mật khẩu nhập lại không đúng");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        boolean gen = gender.equals("true");
        User a = new User(name,gen,username,password);
        ud.RegisterNewAccount(a);
        a=ud.check(username, password);
        HttpSession session = request.getSession();
        session.setAttribute("account", a);
        CartDAO cd = new CartDAO();
        List<Cart> cart = cd.GetCartbyUserID(a.getId());
        session.setAttribute("cart", cart);
        request.setAttribute("regsuc", "Đăng kí thành công ! Hãy cho chúng tôi biết thêm thông tin về bạn");
        request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
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
