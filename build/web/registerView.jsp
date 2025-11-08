<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
            backdrop-filter: blur(8px);
        }

        h2 {
            margin-bottom: 25px;
            font-size: 1.8rem;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
        }

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="email"] {
            width: 85%;
            padding: 12px;
            margin: 8px 0;
            border: none;
            border-radius: 8px;
            outline: none;
            font-size: 1rem;
        }

        input[type="submit"] {
            width: 90%;
            background-color: #ffffff;
            color: #1e3c72;
            font-weight: bold;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        input[type="submit"]:hover {
            background-color: #2a5298;
            color: #fff;
            transform: translateY(-2px);
        }

        .error-message {
            color: #ffb3b3;
            background-color: rgba(255, 0, 0, 0.15);
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
        }

        .login-link a {
            color: #fff;
            text-decoration: underline;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: #ffeb3b;
        }
    </style>
</head>
<body>
    <form action="register" method="post">
        <h2>Đăng ký tài khoản</h2>

        <!-- Thông tin đăng nhập -->
        <input type="text" name="username" placeholder="Tên đăng nhập" required>
        <input type="password" name="password" placeholder="Mật khẩu" required>
        <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>

        <!-- Thông tin cá nhân -->
        <input type="text" name="name" placeholder="Họ và tên" required>
        <input type="date" name="dob" placeholder="Ngày sinh" required>
        <input type="text" name="address" placeholder="Địa chỉ" required>
        <input type="text" name="phone" placeholder="Số điện thoại" required pattern="[0-9]{10,11}" title="Chỉ nhập số, từ 10-11 ký tự">
        <input type="email" name="email" placeholder="Email" required>

        <input type="submit" value="Đăng ký">

        <c:if test="${not empty err}">
<!--            <div class="error-message">
                ${err}
            </div>-->
        </c:if>

        <div class="login-link">
            Đã có tài khoản? <a href="loginView.jsp">Đăng nhập ngay</a>
        </div>
    </form>

    <script>
        // Kiểm tra mật khẩu trùng khớp trước khi gửi form
        document.querySelector("form").addEventListener("submit", function (e) {
            const pass = document.querySelector('input[name="password"]').value;
            const confirm = document.querySelector('input[name="confirmPassword"]').value;
            if (pass !== confirm) {
                e.preventDefault();
                alert("Mật khẩu nhập lại không khớp. Vui lòng kiểm tra lại!");
            }
        });
    </script>
</body>
</html>
