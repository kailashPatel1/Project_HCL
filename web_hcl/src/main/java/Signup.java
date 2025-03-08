import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signup")
public class Signup extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String contactNo = request.getParameter("contact_no");
        String address = request.getParameter("address");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kailash", "9559");
            
            String sql = "INSERT INTO customers (FIRST_NAME, LAST_NAME, DOB, EMAIL, CONTACT_NO, ADDRESS, CREATED_AT) VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, SYSTIMESTAMP)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, dob.isEmpty() ? null : dob);
            pstmt.setString(4, email);
            pstmt.setString(5, contactNo);
            pstmt.setString(6, address);
            
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("home.jsp");
            } else {
                out.println("<h3>Signup Failed. Please try again.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}






