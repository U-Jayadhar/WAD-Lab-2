<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Get form data
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String department = request.getParameter("department");
    String dob = request.getParameter("dob");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    // Database credentials
    String url = "jdbc:mysql://localhost:3306/EmployeeDB?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String password = "66511045";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to MySQL Database
        conn = DriverManager.getConnection(url, user, password);

        // Insert Query (FIXED)
        String sql = "INSERT INTO employees (name, gender, department, dob, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, gender);
        stmt.setString(3, department);
        stmt.setString(4, dob); // Corrected Date Handling
        stmt.setString(5, email);
        stmt.setString(6, phone);

        int rows = stmt.executeUpdate();

        if (rows > 0) {
            out.println("<h2>Employee registered successfully!</h2>");
        } else {
            out.println("<h2>Registration failed!</h2>");
        }
    } catch (SQLException e) {
        out.println("<h2>Database Error: " + e.getMessage() + "</h2>");
    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
