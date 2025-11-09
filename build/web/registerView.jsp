<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Account</title>
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
            width: 400px;
            text-align: left;
        }

        h2 {
            color: #2a5298;
            margin-bottom: 25px;
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
        input[type="password"],
        input[type="date"],
        input[type="email"] {
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

        .login-link {
            margin-top: 20px;
            font-size: 0.95rem;
            text-align: center;
        }

        .login-link a {
            color: #2a5298;
            text-decoration: underline;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: #1e3c72;
        }
    </style>
</head>
<body>
    <form action="register" method="post">
        <h2>Register Account</h2>

        <!-- Thông tin đăng nhập -->
        <label for="username">Username <span class="required">*</span></label>
        <input type="text" id="username" name="username" placeholder="Enter username" required>

        <label for="password">Password <span class="required">*</span></label>
        <input type="password" id="password" name="password" placeholder="Enter password" required>

        <label for="confirmPassword">Confirm Password <span class="required">*</span></label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password" required>

        <!-- Thông tin cá nhân -->
        <label for="name">Full Name <span class="required">*</span></label>
        <input type="text" id="name" name="name" placeholder="Enter full name" required>

        <label for="dob">Date of Birth <span class="required">*</span></label>
        <input type="date" id="dob" name="dob" required>

        <label for="address">Address <span class="required">*</span></label>
        <input type="text" id="address" name="address" placeholder="Enter address" required>

        <label for="phone">Phone Number <span class="required">*</span></label>
        <input type="text" id="phone" name="phone" placeholder="Enter phone number" required pattern="[0-9]{10,11}" title="Only numbers, 10-11 digits">

        <label for="email">Email <span class="required">*</span></label>
        <input type="email" id="email" name="email" placeholder="Enter email" required>

        <input type="submit" value="Register">

        <c:if test="${not empty err}">
            <div class="error-message">${err}</div>
        </c:if>

        <div class="login-link">
            Already have an account? <a href="loginView.jsp">Login here</a>
        </div>
    </form>

    <script>
        document.querySelector("form").addEventListener("submit", function (e) {
            const pass = document.querySelector('#password').value;
            const confirm = document.querySelector('#confirmPassword').value;
            if (pass !== confirm) {
                e.preventDefault();
                alert("Passwords do not match. Please check again!");
            }
        });
    </script>
</body>
</html>
