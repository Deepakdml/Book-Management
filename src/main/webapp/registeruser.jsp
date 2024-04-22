<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String message = "";

        if (username != null && email != null && password != null) {
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");

                String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                	RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            		dispatcher.include(request, response);
                } else {
                	RequestDispatcher dispatcher = request.getRequestDispatcher("registeruserform.jsp");
            		dispatcher.include(request, response);
                }
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            } finally {
                try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
                try { if (conn != null) conn.close(); } catch (Exception e) {}
            }
        }
    %>

</body>
</html>