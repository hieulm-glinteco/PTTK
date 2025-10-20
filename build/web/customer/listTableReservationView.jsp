<%-- 
    Document   : listTableReservationView
    Created on : Oct 12, 2025, 8:52:23 AM
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
                width: 80%;
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

            /* --- Nút chi tiết --- */
            .btn-detail {
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

            .btn-detail:hover {
                background-color: #218838;
                transform: translateY(-2px);
            }

            .btn-detail a {
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
        <h1>List Table Reservation: "<c:out value="${nameorphone}"/>"</h1>

        <c:if test="${empty trList}">
            <p>Not found any reservation for "${nameorphone}".</p>
        </c:if>

        <c:if test="${not empty trList}">
            <table>
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Date</th>
                        <th>Customer Name</th>
                        <th>Phone</th>
                        <th>Table</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tr" items="${trList}">
                        <tr>
                            <td>${tr.id}</td>
                            <td>${tr.date}</td>
                            <td>${tr.customer.name}</td>
                            <td>${tr.customer.phone}</td>
                            <td>${tr.table.name}</td>
                            <td>
                                <!-- Form riêng cho từng đặt bàn -->
                                <form action="${pageContext.request.contextPath}/customer/searchdishservlet" method="get" style="display:inline;">
                                    <input type="hidden" name="reservationid" value="${tr.id}">
                                    <button type="submit" class="btn-detail">Choose</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <a href="tableReservationView.jsp" class="button">Back</a>
    </body>
</html>
