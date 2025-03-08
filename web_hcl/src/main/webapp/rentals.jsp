<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*" %>

<%
    // Check if the user is logged in
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Database Connection
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "password");
        String query = "SELECT * FROM rentals"; // Assuming there's a rentals table
        pstmt = con.prepareStatement(query);
        rs = pstmt.executeQuery();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Rentals</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }
        .header {
            background: #333;
            color: white;
            padding: 15px;
            font-size: 20px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .rental-item {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 250px;
        }
        img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .logout {
            float: right;
            color: white;
            text-decoration: none;
            font-size: 16px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        Welcome, <%= user %> | <a href="logout.jsp" class="logout">Logout</a>
    </div>

    <h2>Available Rentals</h2>
    <div class="container">
        <% 
        if (rs != null) {
            while (rs.next()) { %>
                <div class="rental-item">
                    <img src="<%= rs.getString("image") %>" alt="Rental">
                    <h3><%= rs.getString("name") %></h3>
                    <p>Price per day: ₹<%= rs.getDouble("price_per_day") %></p>
                    <p><%= rs.getString("description") %></p>
                    <form action="rentProduct.jsp" method="post">
                        <input type="hidden" name="rental_id" value="<%= rs.getInt("id") %>">
                        <button type="submit">Rent Now</button>
                    </form>
                </div>
        <%  } 
        } else { %>
            <p>No rental items available.</p>
        <% } %>
    </div>
</body>
</html>

<% 
    // Close resources
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (con != null) con.close();
%>
