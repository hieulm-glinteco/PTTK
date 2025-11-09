<%-- 
    Document   : editDishView
    Created on : Oct 6, 2025, 5:55:10 PM
    Author     : TT
--%>

<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Dish</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f8f9fa;
                color: #333;
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
                background-color: #fff;
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
                margin-top: 130px;
                text-align: center;
            }

            h1 {
                font-size: 2rem;
                color: #2a5298;
                margin-bottom: 40px;
            }

            /* ==== FORM ==== */
            .search-form {
                background-color: #fff;
                padding: 40px 50px;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 25px;
                width: 380px;
            }

            input[type="text"] {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 1rem;
                outline: none;
                transition: border-color 0.3s ease;
            }

            input[type="text"]:focus {
                border-color: #2a5298;
            }

            /* ==== BUTTON ==== */
            .btn {
                background-color: #2a5298;
                color: white;
                font-weight: 500;
                border: none;
                border-radius: 8px;
                padding: 12px 20px;
                cursor: pointer;
                font-size: 1rem;
                transition: all 0.3s ease;
                width: 100%;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            }

            .btn:hover {
                background-color: #1e3c72;
                transform: translateY(-2px);
            }

            .btn a {
                color: white;
                text-decoration: none;
            }

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
            Member member = (Member) session.getAttribute("member");
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
