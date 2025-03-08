<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:8081/ecommerce_db";
    String dbUser = "root";
    String dbPassword = "password";
    
    // Fetch user ID from session
    String userId = (String) session.getAttribute("userId");
    
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not authenticated
    }
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    String name = "", email = "", phone = "", address = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        String sql = "SELECT name, email, phone, address FROM customers WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, userId);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            address = rs.getString("address");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Details - E-Commerce</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }
        .profile-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
            text-align: left;
        }
        h2 {
            color: #333;
        }
        .profile-item {
            margin: 10px 0;
        }
        .edit-btn, .logout-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .edit-btn {
            background-color: #28a745;
        }
        .logout-btn {
            background-color: red;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2>Profile Details</h2>
        <p class="profile-item"><strong>Name:</strong> <%= name %></p>
        <p class="profile-item"><strong>Email:</strong> <%= email %></p>
        <p class="profile-item"><strong>Phone:</strong> <%= phone %></p>
        <p class="profile-item"><strong>Address:</strong> <%= address %></p>
        <a href="editProfile.jsp" class="edit-btn">Edit Profile</a>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>
</body>
</html>
