<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
    <h1>Delete Book</h1>
    <%
        
        int id = Integer.parseInt(request.getParameter("book_id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
            String sql = "delete from bookinfo where book_id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
    			%>
    				<p>Book with ID <%=id%> has been deleted.</p>
    			<%
            } 
            else {
    			%>
    				<p>Failed to delete Book with ID <%=id%>.</p>
    			<%
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
   	%>
    		<p>An error occurred while deleting the Book.</p>
    <% } %>
    <a href="bookdisplay.jsp">Back to Dashboard</a>
</body>
</html>