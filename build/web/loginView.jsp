<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            width: 350px;
            text-align: left;
        }

        h2 {
            color: #2a5298;
            margin-bottom: 30px;
            font-size: 1.8rem;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        label .required {
            color: red;
            margin-left: 2px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #2a5298;
            color: #fff;
            font-weight: bold;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        input[type="submit"]:hover {
            background-color: #1e3c72;
            transform: translateY(-2px);
        }

        .error-message {
            color: #ff4d4f;
            background-color: rgba(255, 0, 0, 0.1);
            padding: 10px;
            border-radius: 8px;
            margin-top: 10px;
            font-size: 0.9rem;
        }

        .error-message:empty {
            display: none;
        }

        .register-link {
            margin-top: 20px;
            font-size: 0.95rem;
            text-align: center;
        }

        .register-link a {
            color: #2a5298;
            text-decoration: underline;
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: #1e3c72;
        }
    </style>
</head>
<body>
    <form action="login" method="post">
        <h2>Login</h2>

        <label for="username">Username <span class="required">*</span></label>
        <input type="text" id="username" name="username" placeholder="Enter username" required/>

        <label for="password">Password <span class="required">*</span></label>
        <input type="password" id="password" name="password" placeholder="Enter password" required/>

        <input type="submit" name="submitLogin" value="Login"/>

        <c:if test="${not empty err}">
            <div class="error-message">${err}</div>
        </c:if>

        <div class="register-link">
            Don't have an account? <a href="registerView.jsp">Register here</a>
        </div>
    </form>
</body>
</html>
