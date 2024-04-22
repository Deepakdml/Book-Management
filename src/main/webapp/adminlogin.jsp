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
	String password = request.getParameter("password");
	String message = "";

	if (username != null && password != null) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");

			String sql = "SELECT * FROM admin WHERE username=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("admindashboard.jsp");
		dispatcher.include(request, response);
			} else {
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminloginform.jsp");
		dispatcher.include(request, response);
			}
		} catch (Exception e) {
			message = "Error: " + e.getMessage();
		} finally {
			try {
		if (rs != null)
			rs.close();
			} catch (Exception e) {
			}
			try {
		if (pstmt != null)
			pstmt.close();
			} catch (Exception e) {
			}
			try {
		if (conn != null)
			conn.close();
			} catch (Exception e) {
			}
		}
	}
	%>

</body>
</html>