<%-- 
    Document   : homeManagerView
    Created on : Oct 6, 2025, 5:26:38 PM
    Author     : TT
--%>

<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Manager</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f8f9fa;
                text-align: center;
                padding: 40px;
                margin: 0;
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
                background-color: #fff;
            }

            .header-title {
                font-size: 1.6rem;
                font-weight: bold;
                letter-spacing: 1px;
                color: #2a5298;
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
                margin-bottom: 40px;
            }

            /* ==== BUTTON ==== */
            .btn-nav {
                display: inline-block;
                background-color: #2a5298;
                color: white;
                padding: 12px 28px;
                border-radius: 6px;
                text-decoration: none;
                font-size: 1rem;
                font-weight: 500;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            }

            .btn-nav:hover {
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
                <div>Welcome <strong><%= member.getName() %></strong></div>
                <form action="${pageContext.request.contextPath}/logout" method="get" style="margin:0;">
                    <button type="submit" class="logout-btn">Logout</button>
                </form>
            </div>
        </div>

        <!-- ==== MAIN CONTENT ==== -->
        <main>
            <h1>Home Manager</h1>
            <a href="manageDishView.jsp" class="btn-nav">Manage Dish</a>
        </main>
    </body>
</html>
