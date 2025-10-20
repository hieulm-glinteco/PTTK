<%-- 
    Document   : listDishView
    Created on : Oct 6, 2025, 6:18:04 PM
    Author     : TT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f8f9fa;
                text-align: center;
                padding: 40px;
            }

            h1 {
                color: #2a5298;
                margin-bottom: 30px;
                text-transform: uppercase;
            }

            table {
                margin: 0 auto;
                border-collapse: collapse;
                width: 60%;
                background-color: #fff;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            th, td {
                padding: 12px 16px;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #2a5298;
                color: #fff;
                letter-spacing: 0.5px;
            }

            tr:hover {
                background-color: #f8f9fa;
            }

            /* --- Nút sửa --- */
            .btn-edit {
                background-color: #28a745;
                border: none;
                color: white;
                padding: 8px 16px;
                border-radius: 6px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn-edit:hover {
                background-color: #218838;
                transform: translateY(-2px);
            }

            .btn-edit a {
                color: white;
                text-decoration: none;
            }

            /* --- Nút quay lại --- */
            a.button {
                display: inline-block;
                margin-top: 30px;
                padding: 10px 22px;
                background-color: #2a5298;
                color: white;
                text-decoration: none;
                border-radius: 6px;
                font-weight: 500;
                transition: 0.3s;
            }

            a.button:hover {
                background-color: #2a5299;
                transform: translateY(-2px);
            }

        </style>
    </head>
    <body>
        <h1>List Dish: "<c:out value="${dishName}"/>"</h1>

        <c:if test="${empty dishList}">
            <p>Not found any dish which have name like ${dishName}.</p>
        </c:if>

        <c:if test="${not empty dishList}">
            <table>
                <thead>
                    <tr>
                        <th>Dish Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="d" items="${dishList}">
                        <tr>
                            <td>${d.name}</td>
                            <td>
                                <!-- Form riêng cho từng món -->
                                <form action="${pageContext.request.contextPath}/manager/dishdetailservlet" style="display:inline;">
                                    <input type="hidden" name="dishid" value="${d.id}">
                                    <button type="submit" class="btn-edit">Edit</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>


        <a href="editDishView.jsp" class="button">Back</a>
    </body>
</html>
