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
            margin-top: 120px;
            text-align: center;
        }

        h1 {
            font-size: 2.2rem;
            margin-bottom: 40px;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
        }

        button {
            background-color: #ffffff;
            border: none;
            padding: 15px 30px;
            border-radius: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        button a {
            text-decoration: none;
            color: #1e3c72;
            font-weight: bold;
            font-size: 1rem;
        }

        button:hover {
            background-color: #2a5298;
            transform: translateY(-2px);
        }

        button:hover a {
            color: #fff;
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
        <button><a href="manageDishView.jsp">Manage Dish</a></button>
    </main>
</body>
</html>
