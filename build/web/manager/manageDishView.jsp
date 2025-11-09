<%-- 
    Document   : manageDishView
    Created on : Oct 6, 2025, 5:47:59 PM
    Author     : TT
--%>

<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Dish</title>
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

        .button-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 25px;
        }

        .btn {
            background-color: #2a5298;
            color: white;
            font-weight: 500;
            border: none;
            padding: 15px 40px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 220px;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #1e3c72;
            transform: translateY(-2px);
        }

        .btn a {
            color: white;
            text-decoration: none;
            display: block;
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
        <h1>Manage Dish</h1>
        <div class="button-group">
            <button class="btn"><a href="editDishView.jsp">Edit Dish</a></button>
            <button class="btn"><a href="homeManagerView.jsp">Back</a></button>
        </div>
    </main>
</body>
</html>
