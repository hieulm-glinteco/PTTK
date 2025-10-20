<%-- 
    Document   : homeManagerView
    Created on : Oct 6, 2025, 5:26:38 PM
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
        <h1>Home Manager</h1>
        <button><a href="manageDishView.jsp">Manage Dish</a></button>
    </body>
</html>
