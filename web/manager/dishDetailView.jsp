<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết món ăn</title>
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
                text-transform: uppercase;
                margin-bottom: 30px;
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
                text-align: left;
            }

            th {
                width: 30%;
                background-color: #2a5298;
                color: white;
                letter-spacing: 0.5px;
            }

            td input {
                width: 100%;
                padding: 10px 12px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
                box-sizing: border-box;
            }

            td input[readonly] {
                background-color: #f1f1f1;
                cursor: not-allowed;
            }

            /* --- Khu vực nút --- */
            form .submit-btn {
                margin-top: 30px;
            }

            input[type="submit"] {
                background-color: #28a745;
                border: none;
                color: white;
                padding: 10px 22px;
                border-radius: 6px;
                cursor: pointer;
                font-size: 15px;
                font-weight: 500;
                transition: all 0.3s ease;
                margin-right: 15px;
            }

            input[type="submit"]:hover {
                background-color: #218838;
                transform: translateY(-2px);
            }

            a {
                background-color: #2a5298;
                color: white;
                padding: 10px 22px;
                border-radius: 6px;
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            a:hover {
                background-color: #1e3c72;
                transform: translateY(-2px);
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
            <h1>Dish Detail</h1>
            <form action="${pageContext.request.contextPath}/manager/dishdetailservlet" method="post">
                <table>
                    <tr>
                        <th>ID</th>
                        <td><input type="text" name="id" value="${d.id}" readonly /></td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td><input type="text" name="name" value="${d.name}" /></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td><input type="text" name="price" value="${d.price}" /></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td><input type="text" name="description" value="${d.description}" /></td>
                    </tr>
                </table>

                <div class="submit-btn">
                    <input type="submit" value="Update">
                    <a href="manageDishView.jsp">Back</a>
                </div>
            </form>
        </main>

    </body>
</html>
