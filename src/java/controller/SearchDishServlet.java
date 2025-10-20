/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DishDAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Dish;

/**
 *
 * @author TT
 */
@WebServlet(name = "SearchDishServlet", urlPatterns = {"/customer/searchdishservlet"})
public class SearchDishServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchDishServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchDishServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String trId = request.getParameter("reservationid");
        System.out.println(trId);

        //khoi tao 1 order va them vao csdl
        try {
            OrderDAO oDao = new OrderDAO();
            int orderId = oDao.addOrder(Integer.parseInt(trId));

            request.setAttribute("orderid", orderId);
            request.getRequestDispatcher("/customer/searchDishView.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

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
        String name = request.getParameter("dishname");
        String btnSearch = request.getParameter("dishsearch");
        String orderid = request.getParameter("orderid");
        System.out.println("orderId = " + orderid);

        if (btnSearch != null) {
            try {
                DishDAO dishDao = new DishDAO();
                List<Dish> list = dishDao.getListDishByName(name);
                request.setAttribute("dishList", list);
                request.setAttribute("dishName", name);
                request.setAttribute("orderid", orderid);
                request.getRequestDispatcher("/customer/listDishView.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
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
