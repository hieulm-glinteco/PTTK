/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DishDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dish;

/**
 *
 * @author TT
 */
@WebServlet(name = "DishDetailServlet", urlPatterns = {"/manager/dishdetailservlet"})
public class DishDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet DishDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DishDetailServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("dishid");
        System.out.println("ID nhận được: " + id);

        DishDAO dao = new DishDAO();
        Dish dish = dao.getDishById(id);

        request.setAttribute("d", dish);
        request.getRequestDispatcher("/manager/dishDetailView.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price_raw = request.getParameter("price");
        String description = request.getParameter("description");
        DishDAO dao = new DishDAO();
        Dish dish = dao.getDishById(id);
        float price;
        try {
            price = Float.parseFloat(price_raw.trim());
            dao.updateDish(dish, name, price, description);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(
                "<!DOCTYPE html>"
                + "<html><head>"
                + "<meta charset='UTF-8'>"
                + "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>"
                + "</head><body>"
                + "<script>"
                + "Swal.fire({"
                + "  title: '✅ Update successful!',"
                + "  text: 'All data have updated into database.',"
                + "  icon: 'success',"
                + "  confirmButtonText: 'OK',"
                + "  confirmButtonColor: '#3085d6'"
                + "}).then((result) => {"
                + "  if (result.isConfirmed) {"
                + "    window.location = 'editDishView.jsp';"
                + "  }"
                + "});"
                + "</script>"
                + "</body></html>"
        );

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
