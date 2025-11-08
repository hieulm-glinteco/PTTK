<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
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
                width: 350px;
                text-align: center;
                backdrop-filter: blur(8px);
            }

            h2 {
                margin-bottom: 30px;
                font-size: 1.8rem;
                text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
            }

            input[type="text"],
            input[type="password"] {
                width: 85%;
                padding: 12px;
                margin: 10px 0;
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
                margin-top: 20px;
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


            .register-link {
                margin-top: 20px;
                font-size: 0.95rem;
            }

            .register-link a {
                color: #fff;
                text-decoration: underline;
                transition: color 0.3s;
            }

            .register-link a:hover {
                color: #ffeb3b;
            }
        </style>
    </head>
    <body>
        <form action="login" method="post">
            <h2>Đăng nhập</h2>
            <input type="text" name="username" placeholder="Nhập tên đăng nhập" required/>
            <input type="password" name="password" placeholder="Nhập mật khẩu" required/>
            <input type="submit" name="submitLogin" value="Đăng nhập"/>

            <c:if test="${not empty err}">
                <div class="error-message">
                    ${err}
                </div>
            </c:if>

            <div class="register-link">
                Chưa có tài khoản? <a href="registerView.jsp">Đăng ký tại đây</a>
            </div>
        </form>
    </body>
</html>
