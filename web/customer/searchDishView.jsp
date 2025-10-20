<%-- 
    Document   : searchDishView
    Created on : Oct 12, 2025, 8:52:40 AM
    Author     : TT
--%>

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
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            h1 {
                font-size: 2.2rem;
                margin-bottom: 40px;
                text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);
                letter-spacing: 1px;
            }

            /* Khung form */
            form {
                background-color: rgba(255, 255, 255, 0.1);
                padding: 40px 50px;
                border-radius: 15px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 25px;
                width: 380px;
                backdrop-filter: blur(6px);
            }

            /* Ô nhập liệu */
            input[type="text"] {
                width: 92%;
                padding: 12px 15px;
                border: none;
                border-radius: 8px;
                font-size: 1rem;
                outline: none;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
                color: #333;
                background-color: #fff;
                transition: all 0.3s ease;
            }

            input[type="text"]:focus {
                box-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
                transform: scale(1.02);
            }

            /* Nút bấm chung */
            input[type="submit"],
            input[type="button"] {
                background: linear-gradient(135deg, #ffffff, #e3e8ff);
                color: #1e3c72;
                font-weight: bold;
                border: none;
                border-radius: 8px;
                padding: 12px 20px;
                cursor: pointer;
                font-size: 1rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
                width: 100%;
                letter-spacing: 0.5px;
            }

            /* Hiệu ứng hover */
            input[type="submit"]:hover,
            input[type="button"]:hover {
                background: linear-gradient(135deg, #2a5298, #1e3c72);
                color: #fff;
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            }

            /* Khoảng cách giữa các phần tử */
            form div {
                display: flex;
                flex-direction: column;
                gap: 18px;
                width: 100%;
            }

            /* Hiệu ứng khi nhấn */
            input[type="submit"]:active,
            input[type="button"]:active {
                transform: translateY(0);
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <h1>Search Dish</h1>

        <form action="${pageContext.request.contextPath}/customer/searchdishservlet" method="post">
            <div>
                <input type="text" name="dishname" placeholder="Enter dish name" required/>
                <input type="hidden" name="orderid" 
                       value="<%= request.getAttribute("orderid") != null ? request.getAttribute("orderid") : ""%>"/>
                <input type="submit" name="dishsearch" value="Search"/>
            </div>
            <div>
                <input type="button" name="editreturn" value="Back"
                       onclick="window.location.href = '${pageContext.request.contextPath}/customer/tableReservationView.jsp';"/>
            </div>
        </form>
    </body>
</html>
