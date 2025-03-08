<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Check if user is logged in
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Stop execution
    }

    // Database Connection
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure JDBC driver is loaded
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "password");
        stmt = con.prepareStatement("SELECT * FROM products");
        rs = stmt.executeQuery();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database Connection Failed: " + e.getMessage() + "</p>");
        e.printStackTrace(); // Debugging
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home</title>
</head>
<body>
    <h2>Available Products</h2>
    <div class="container">
        <% if (rs != null) { %>
            <% while (rs.next()) { %>
                <div class="product">
                    <img src="<%= rs.getString("image") %>" alt="Product">
                    <h3><%= rs.getString("name") %></h3>
                    <p>Price: ₹<%= rs.getDouble("price") %></p>
                </div>
            <% } %>
        <% } else { %>
            <p style="color: red;">No products found. Please check the database.</p>
        <% } %>
    </div>
</body>
</html>

<%
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
