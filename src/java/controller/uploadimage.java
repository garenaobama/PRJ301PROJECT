/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author pc
 */
@WebServlet(name = "uploadimage", urlPatterns = {"/uploadimage"})
@MultipartConfig
public class uploadimage extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadimage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadimage at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) //upload = url link
            throws ServletException, IOException {
        int proid = Integer.parseInt(request.getParameter("proid"));
        String savePath = "C:\\Users\\pc\\OneDrive\\Documents\\NetBeansProjects\\PRJPROJECT\\web\\image\\product\\" + proid;
        
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) //dopost xu li upload tu may tinh
            throws ServletException, IOException {
        int proid = Integer.parseInt(request.getParameter("proid"));
        //String savePath = "C:\\Users\\pc\\OneDrive\\Documents\\NetBeansProjects\\PRJPROJECT\\web\\image\\product\\" + proid;
        //String saveBuildPath =  getServletContext().getRealPath("/image/product/") + proid;  // for built folder
        String saveBuildPath = getServletContext().getResource("/image/product/").getPath() + proid;
        File fileSaveBuildDir = new File(saveBuildPath);
        if (!fileSaveBuildDir.exists()) {
            fileSaveBuildDir.mkdir();
        }
        //save 
        Part imagePart = request.getPart("image"); //get uploaded file
        Part imageBuildPart = imagePart; //get uploaded file
        String fileName = imagePart.getSubmittedFileName(); // get cai image name 
        // luu vo o dia
        imageBuildPart.write(saveBuildPath + File.separator + fileName); // luu vo o build
        // rename nek
        String oldFileName = fileName;
        String newFileName = "1.jpg";
        File oldBuildFile = new File(saveBuildPath + "\\" + oldFileName);
        File newBuildFile = new File(saveBuildPath + "\\" + newFileName);
        oldBuildFile.renameTo(newBuildFile); //rename 
        response.sendRedirect("ProductDisplay?id="+proid);
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
