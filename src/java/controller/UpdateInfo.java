/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import model.User;

/**
 *
 * @author pc
 */
@WebServlet(name="UpdateInfo", urlPatterns={"/UpdateInfo"})
public class UpdateInfo extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateInfo</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateInfo at " + request.getContextPath () + "</h1>");
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
        UserDAO ud = new UserDAO();
        HttpSession session = request.getSession();
        int uid =((User)session.getAttribute("account")).getId();
       // Get an Enumeration of all parameter names
        Enumeration<String> paramNames = request.getParameterNames();
        // Loop through each parameter name
        while (paramNames.hasMoreElements()) {
            // Get the parameter name
            String paramName = paramNames.nextElement();
            // Get the parameter value
            if(paramName.equals("name")){
                String name = request.getParameter("name").trim();
                if(name.length()<1) {
                    request.setAttribute("ms1", "Tên không thể để trống");
                    request.setAttribute("num", 1);
                    request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
                    return;
                }
                ud.UpdateName(uid, name);
                session.setAttribute("account", ud.refresh(uid));
                request.setAttribute("succms", "true");
                //response.sendRedirect("UserDetail?index=myprofile");
                request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
            }
            if(paramName.equals("oldpass")){
                String password = ((User)session.getAttribute("account")).getPassword().trim(); //trim to remove spaces
                String oldpass = (String)request.getParameter("oldpass");
                String newpass = (String)request.getParameter("newpass");
     
                String newpassagain = (String)request.getParameter("newpassagain");
                if(oldpass.equals(password) == false){
                    String ms="Sai mật khẩu";
                    request.setAttribute("ms", ms);
                    request.setAttribute("num", 5);
                    request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
                    //response.sendRedirect("UserDetail?index=myprofile");
                    return;
                }
                if(newpass.length()<6){
                    //request.setAttribute("ms3","Mật khẩu cần có nhiều hơn 6 kí tự");
                    String ms="Mật khẩu cần có ít nhất 6 kí tự";
                    request.setAttribute("ms", ms);
                    request.setAttribute("num", 5);
                    request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
                    //response.sendRedirect("UserDetail?index=myprofile");
                    return;
                }
                if(oldpass.equals(newpass)){
                    //request.setAttribute("ms1","Mật khẩu mới phải khác mật khẩu cũ");
                    String ms="Mật khẩu mới phải khác mật khẩu cũ";
                    request.setAttribute("ms", ms);
                    request.setAttribute("num", 5);
                    //response.sendRedirect("UserDetail?index=myprofile");
                    request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
                    return;
                }
                if(!newpass.equals(newpassagain)){
                    //request.setAttribute("ms2","mật khẩu không khớp");
                    String ms="mật khẩu nhập lại không khớp";
                    request.setAttribute("ms", ms);
                    request.setAttribute("num", 5);
                    //response.sendRedirect("UserDetail?index=myprofile");
                    request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
                    return;
                }
                ud.UpdatePassword(uid, newpass);
                session.setAttribute("account", ud.refresh(uid));
                request.setAttribute("succms", "true");
                request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
            }
            if(paramName.equals("phone")) {
                String phone = (String) request.getParameter("phone");
                ud.UpdatePhone(uid, phone);
                session.setAttribute("account", ud.refresh(uid));
                request.setAttribute("succms", "true");
                request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
            }
            if(paramName.equals("gender")){
                String gender = (String) request.getParameter("gender");
                ud.UpdateGender(uid, gender);
                session.setAttribute("account", ud.refresh(uid));
                request.setAttribute("succms", "true");
                request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
            }
            if(paramName.equals("address")){
                String address = (String) request.getParameter("address");
                ud.UpdateAddress(uid,address);
                session.setAttribute("account", ud.refresh(uid));
                request.setAttribute("succms", "true");
                request.getRequestDispatcher("UserDetail?index=myprofile").forward(request, response);
            }
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
