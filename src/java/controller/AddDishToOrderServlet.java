/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DishDAO;
import dao.DishOrderDetailDAO;
import dao.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Dish;
import model.DishOrderDetail;
import model.Order;

/**
 *
 * @author TT
 */
@WebServlet(name = "AddDishToOrderServlet", urlPatterns = {"/customer/addservlet"})
public class AddDishToOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet AddDishToOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDishToOrderServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String orderId = request.getParameter("orderid");
        String dishId = request.getParameter("dishid");
        String quantity_raw = request.getParameter("quantity");
        int quantity;
        try {
            quantity = Integer.parseInt(quantity_raw);
            System.out.println(orderId + " " + dishId + " " + quantity);
            OrderDAO oDao = new OrderDAO();
            DishDAO dDao = new DishDAO();

            Order order = oDao.getOrderById(orderId);
            Dish dish = dDao.getDishById(dishId);

            DishOrderDetailDAO dodDao = new DishOrderDetailDAO();
            DishOrderDetail dod = new DishOrderDetail(order, dish, quantity);

            boolean success = dodDao.addDishToOrder(dod);
            if (success) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println(
                        "<!DOCTYPE html>"
                        + "<html><head>"
                        + "<meta charset='UTF-8'>"
                        + "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>"
                        + "</head><body>"
                        + "<script>"
                        + "Swal.fire({"
                        + "  title: '✅ Đặt món thành công!',"
                        + "  text: 'Bạn có thể tiếp tục đặt món hoặc xác nhận đơn hàng.',"
                        + "  icon: 'success',"
                        + "  showCancelButton: true,"
                        + "  confirmButtonText: 'Xác nhận order',"
                        + "  cancelButtonText: 'Tiếp tục đặt món',"
                        + "  confirmButtonColor: '#3085d6',"
                        + "  cancelButtonColor: '#aaa'"
                        + "}).then((result) => {"
                        + "  if (result.isConfirmed) {"
                        + "    window.location = '" + request.getContextPath() + "/customer/customerHomeView.jsp';"
                        + "  } else {"
                        + "    window.location = '" + request.getContextPath() + "/customer/searchDishView.jsp?orderid=" + orderId + "';"
                        + "  }"
                        + "});"
                        + "</script>"
                        + "</body></html>"
                );
            } else {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println(
                        "<!DOCTYPE html>"
                        + "<html><head>"
                        + "<meta charset='UTF-8'>"
                        + "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>"
                        + "</head><body>"
                        + "<script>"
                        + "Swal.fire({"
                        + "  title: '❌ Thêm món thất bại!',"
                        + "  text: 'Vui lòng thử lại.',"
                        + "  icon: 'error',"
                        + "  confirmButtonText: 'OK',"
                        + "  confirmButtonColor: '#d33'"
                        + "}).then(() => {"
                        + "  window.history.back();"
                        + "});"
                        + "</script>"
                        + "</body></html>"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
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
