/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TableReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.TableReservation;

/**
 *
 * @author TT
 */
@WebServlet(name = "ListTableReservationServlet", urlPatterns = {"/customer/listtableservlet"})
public class ListTableReservationServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListTableReservationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListTableReservationServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        request.setCharacterEncoding("UTF-8");
        String nameorphone = request.getParameter("nameorphone");
        String btnSearch = request.getParameter("tablesearch");
        String btnReturn = request.getParameter("editreturn");
        
        if(btnReturn != null){
            request.getRequestDispatcher("/customer/customerHomeView.jsp").forward(request, response);
        }
        if(btnSearch != null){
            try{
                TableReservationDAO trDao = new TableReservationDAO();
                List<TableReservation> list;
                if(!nameorphone.matches("0\\d{8,10}")){
                    list = trDao.getTableReservationByCustomerName(nameorphone);
                }else{
                    list = trDao.getTableReservationByPhone(nameorphone);
                }
                request.setAttribute("trList", list);
                request.setAttribute("nameorphone", nameorphone);
                request.getRequestDispatcher("/customer/listTableReservationView.jsp").forward(request, response);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
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
