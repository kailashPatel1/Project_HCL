<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/your_database";
    String dbUser = "root";
    String dbPassword = "password";

    // Get user ID from request
    String userId = request.getParameter("id");
    String name = "", email = "", password = "";

    if (userId != null && !userId.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
            ps.setInt(1, Integer.parseInt(userId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                password = rs.getString("password");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <h2>Edit User</h2>
    <form action="UpdateUserServlet" method="post">
        <input type="hidden" name="id" value="<%= userId %>">
        
        <label>Name:</label>
        <input type="text" name="name" value="<%= name %>" required>
        <br>
        
        <label>Email:</label>
        <input type="email" name="email" value="<%= email %>" required>
        <br>
        
        <label>Password:</label>
        <input type="password" name="password" value="<%= password %>" required>
        <br>
        
        <input type="submit" value="Update User">
    </form>
    
    <br>
    <a href="userList.jsp">Back to User List</a>
</body>
</html>
