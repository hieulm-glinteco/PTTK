<%-- 
    Document   : manageDishView
    Created on : Oct 6, 2025, 5:47:59 PM
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
                text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
            }

            .button-group {
                display: flex;
                flex-direction: column; /* ✅ xếp nút theo chiều dọc */
                align-items: center;
                gap: 25px; /* ✅ khoảng cách giữa các nút */
            }

            button {
                background-color: #ffffff;
                border: none;
                padding: 15px 40px;
                border-radius: 8px;
                transition: all 0.3s ease;
                cursor: pointer;
                box-shadow: 0 4px 10px rgba(0,0,0,0.2);
                width: 200px; /* ✅ cho nút đều nhau, đẹp hơn */
            }

            button a {
                text-decoration: none;
                color: #1e3c72;
                font-weight: bold;
                font-size: 1rem;
                display: block;
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
        <h1>Manage Dish</h1>
        <div class="button-group">
            <button><a href="editDishView.jsp">Edit dish</a></button>
            <button><a href="homeManagerView.jsp">Back</a></button>
        </div>
    </body>
</html>
