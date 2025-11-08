<%-- 
    Document   : editDishView
    Created on : Oct 6, 2025, 5:55:10 PM
    Author     : TT
--%>

<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #1e3c72, #2a5298);
                color: #fff;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                height: 100vh;
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
                color: #ffd700;
            }

            .logout-btn {
                background-color: #ffffff;
                border: none;
                padding: 8px 18px;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
                font-weight: bold;
                color: #1e3c72;
            }

            .logout-btn:hover {
                background-color: #2a5298;
                color: #fff;
                transform: translateY(-2px);
            }

            /* ==== MAIN ==== */
            main {
                margin-top: 120px; /* tránh bị header che */
                text-align: center;
            }

            h1 {
                font-size: 2.2rem;
                margin-bottom: 40px;
                text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
            }

            .search-form{
                background-color: rgba(255, 255, 255, 0.15);
                padding: 40px 50px;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.3);
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                width: 350px;
            }

            input[type="text"] {
                width: 92%;
                padding: 12px 15px;
                border: none;
                border-radius: 8px;
                font-size: 1rem;
                outline: none;
                box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            }

            .btn {
                background-color: #ffffff;
                color: #1e3c72;
                font-weight: bold;
                border: none;
                border-radius: 8px;
                padding: 12px 20px;
                cursor: pointer;
                font-size: 1rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(0,0,0,0.2);
                width: 100%;
            }
            
            .btn a{
                text-decoration: none;
                color: #1e3c72;
            }

            .btn:hover, .btn a:hover {
                background-color: #2a5298;
                color: #fff;
                transform: translateY(-2px);
            }

            /* Chỉnh khoảng cách giữa 2 hàng nút */
            form div {
                display: flex;
                flex-direction: column;
                gap: 15px;
                width: 100%;
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
            <h1>Search Dish</h1>
            <form class="search-form" action="${pageContext.request.contextPath}/manager/listdishservlet" method="post">
                <div>
                    <input type="text" name="dishname" placeholder="Enter dish name" required/>
                    <input class="btn" type="submit" name="dishsearch" value="Search"/>
                </div>
                <div>
                    <button class="btn"><a href="manageDishView.jsp">Back</a></button>
                </div>
            </form>
        </main>
    </body>
</html>
