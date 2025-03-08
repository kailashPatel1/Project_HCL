<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 

    // Check if the user is logged in
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Handle file upload and database entry
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        Part filePart = request.getPart("image"); // Image file input
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = application.getRealPath("") + "uploads"; // Folder to store images

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath); // Save file to server

        // Database connection
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "password");

            String query = "INSERT INTO rentals (name, price_per_day, description, image) VALUES (?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, request.getParameter("name"));
            pstmt.setDouble(2, Double.parseDouble(request.getParameter("price")));
            pstmt.setString(3, request.getParameter("description"));
            pstmt.setString(4, "uploads/" + fileName); // Storing file path in DB

            int result = pstmt.executeUpdate();
            if (result > 0) {
                out.println("<p style='color:green;'>Rental item uploaded successfully!</p>");
            } else {
                out.println("<p style='color:red;'>Failed to upload rental item.</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    }
  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Rental Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: auto;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
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
    </style>
</head>
<body>
    <h2>Upload a Rental Item</h2>
    <div class="form-container">
        <form action="upload.jsp" method="post" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Rental Name" required><br>
            <input type="number" step="0.01" name="price" placeholder="Price per day (₹)" required><br>
            <textarea name="description" placeholder="Description" required></textarea><br>
            <input type="file" name="image" accept="image/*" required><br>
            <button type="submit">Upload</button>
        </form>
    </div>
</body>
</html>
    