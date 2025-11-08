<%-- 
    Document   : listDishView
    Created on : Oct 12, 2025, 8:52:53 AM
    Author     : TT
--%>

<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f8f9fa;
                text-align: center;
                padding: 40px;
            }

            /* ==== HEADER ==== */
            .header {
                width: 100%;
                background-color: rgba(255, 255, 255, 0.1);
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 40px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.2);
                position: fixed;
                top: 0;
                left: 0;
                box-sizing: border-box;
            }

            .header-title {
                font-size: 1.6rem;
                font-weight: bold;
                letter-spacing: 1px;
            }

            .user-info {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .user-info strong {
                color: #2a5298;
            }

            .logout-btn {
                background-color: #2a5298;
                border: none;
                padding: 8px 18px;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
                font-weight: bold;
                color: #fff;
            }

            .logout-btn:hover {
                background-color: #ffffff;
                color: #1e3c72;
                transform: translateY(-2px);
            }

            /* ==== MAIN ==== */
            main {
                margin-top: 120px; /* tránh bị header che */
                text-align: center;
            }

            h1 {
                color: #2a5298;
                margin-bottom: 30px;
                text-transform: uppercase;
            }

            table {
                margin: 0 auto;
                border-collapse: collapse;
                width: 60%;
                background-color: #fff;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            th, td {
                padding: 12px 16px;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #2a5298;
                color: #fff;
                letter-spacing: 0.5px;
            }

            tr:hover {
                background-color: #f8f9fa;
            }

            /* --- Nút sửa --- */
            .btn-edit {
                background-color: #28a745;
                border: none;
                color: white;
                padding: 8px 16px;
                border-radius: 6px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn-edit:hover {
                background-color: #218838;
                transform: translateY(-2px);
            }

            .btn-edit a {
                color: white;
                text-decoration: none;
            }

            /* --- Nút quay lại --- */
            a.button {
                display: inline-block;
                margin-top: 30px;
                padding: 10px 22px;
                background-color: #2a5298;
                color: white;
                text-decoration: none;
                border-radius: 6px;
                font-weight: 500;
                transition: 0.3s;
            }

            a.button:hover {
                background-color: #2a5299;
                transform: translateY(-2px);
            }

            /*nhap so luong*/
            input[type="number"] {
                width: 70px;
                padding: 6px;
                border: 1px solid #ccc;
                border-radius: 6px;
                text-align: center;
                transition: 0.3s;
                font-size: 14px;
            }

            input[type="number"]:focus {
                border-color: #2a5298;
                outline: none;
                box-shadow: 0 0 5px rgba(42, 82, 152, 0.3);
            }
        </style>
    </head>
    <body>
        <%
            // Lấy đối tượng member từ session
            Member member = (Member) session.getAttribute("member");

            // Kiểm tra nếu chưa đăng nhập
            if (member == null) {
                response.sendRedirect("../loginView.jsp");
                return;
            }
        %>

        <!-- ==== HEADER ==== -->
        <div class="header">
            <div class="header-title">Restaurant Management</div>
            <div class="user-info">
                <div>Welcome <strong><%= member.getName()%></strong></div>
                <form action="${pageContext.request.contextPath}/logout" method="get" style="margin:0;">
                    <button type="submit" class="logout-btn">Logout</button>
                </form>
            </div>
        </div>

        <!-- ==== MAIN CONTENT ==== -->
        <main>
            <h1>List Dish: "<c:out value="${dishName}"/>"</h1>

            <c:if test="${empty dishList}">
                <p>Not found any dish which have name like ${dishName}.</p>
            </c:if>

            <c:if test="${not empty dishList}">
                <table>
                    <thead>
                        <tr>
                            <th>Dish Name</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${dishList}">
                        <form action="${pageContext.request.contextPath}/customer/addservlet" method="post">
                            <input type="hidden" name="orderid" value="<%= request.getAttribute("orderid")%>">
                            <input type="hidden" name="dishid" value="${d.id}">
                            <tr>
                                <td>${d.name}</td>
                                <td>
                                    <input type="number" name="quantity" value="1" min="1">
                                </td>
                                <td>
                                    <button type="submit" class="btn-edit">Add to Order</button>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>


            <a href="searchDishView.jsp" class="button">Back</a>
        </main>

    </body>
</html>
