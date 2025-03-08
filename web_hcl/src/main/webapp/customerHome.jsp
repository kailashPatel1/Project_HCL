<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Home - E-commerce</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            box-shadow: 0px 0px 10px gray;
            border-radius: 10px;
        }
        .nav {
            padding: 10px;
            background: #007bff;
            color: white;
        }
        .nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .product-card {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 8px;
            width: 200px;
            background: #fff;
        }
        .product-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<%
    
    String customerName = (String) session.getAttribute("customerName");
    if (customerName == null) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>

<div class="container">
    <div class="nav">
        <h2>Welcome, <%= customerName %>!</h2>
        <a href="viewProducts.jsp">Browse Products</a>
        <a href="orderHistory.jsp">My Orders</a>
        <a href="profile.jsp">Profile</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <h3>🔥 Trending Products 🔥</h3>
    
    <div class="products">
        <%
            try {
                // Database Connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "kailash", "9559");

                String query = "SELECT id, name, price, image FROM products ORDER BY RAND() LIMIT 4";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <div class="product-card">
                <img src="<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>">
                <h4><%= rs.getString("name") %></h4>
                <p>₹ <%= rs.getDouble("price") %></p>
                <a href="productDetails.jsp?id=<%= rs.getInt("id") %>">View Details</a>
            </div>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>

</body>
</html>
