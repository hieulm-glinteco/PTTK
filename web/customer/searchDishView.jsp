<%-- 
    Document   : searchDishView
    Created on : Oct 12, 2025, 8:52:40 AM
    Author     : TT
--%>

<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Dish</title>
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
            margin-top: 120px;
            text-align: center;
        }

        h1 {
            color: #2a5298;
            text-transform: uppercase;
            margin-bottom: 40px;
        }

        /* ==== FORM ==== */
        .search-form {
            background-color: #fff;
            padding: 30px 35px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            width: 380px;
            box-sizing: border-box;
            margin: auto;
        }

        .search-form input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
            box-sizing: border-box;
        }

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
            cursor: pointer;
            border: none;
            width: 100%;
        }

        .btn-nav:hover {
            background-color: #1e3c72;
            transform: translateY(-2px);
        }

        .form-row {
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
        <div>Welcome <strong><%= member.getName()%></strong></div>
        <form action="${pageContext.request.contextPath}/logout" method="get" style="margin:0;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</div>

<!-- ==== MAIN CONTENT ==== -->
<main>
    <h1>Search Dish</h1>

    <form class="search-form" action="${pageContext.request.contextPath}/customer/searchdishservlet" method="post">
        <div class="form-row">
            <input type="text" name="dishname" placeholder="Enter dish name" required/>
            <input type="hidden" name="orderid" 
                   value="<%= request.getAttribute("orderid") != null ? request.getAttribute("orderid") : ""%>"/>
            <button type="submit" name="dishsearch" class="btn-nav">Search</button>
        </div>
        <div class="form-row">
            <button type="button" name="editreturn" class="btn-nav"
                    onclick="window.location.href='${pageContext.request.contextPath}/customer/tableReservationView.jsp';">Back</button>
        </div>
    </form>
</main>
</body>
</html>
