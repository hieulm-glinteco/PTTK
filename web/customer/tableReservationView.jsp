<%-- 
    Document   : tableReservationView
    Created on : Oct 7, 2025, 11:55:09 AM
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

            form {
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

            input[type="submit"] {
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

            input[type="submit"]:hover {
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
        <h1>Search Table Reservation</h1>
        <form action="${pageContext.request.contextPath}/customer/listtableservlet" method="post">
            <div>
                <input type="text" name="nameorphone" placeholder="Enter name or phone number"/>
                <input type="submit" name="tablesearch" value="Search"/>
            </div>
            <div>
                <input type="submit" name="editreturn" value="Back"/>
            </div>
        </form>
    </body>
</html>
