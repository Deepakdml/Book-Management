<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Updation</title>
</head>
<body>
    <h1>Update Book</h1>
    <%
        
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
   

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
            String sql = "UPDATE bookinfo SET title=?, author=?, price=?, quantity=? WHERE book_id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, title);
            pst.setString(2, author);
            pst.setString(3, price);
            pst.setString(4, quantity);
            
            pst.setInt(5, book_id);

            
            int rowsAffected = pst.executeUpdate();

            
            if (rowsAffected > 0) {
    %>
    <p>Book with ID <%=book_id%> has been updated.</p>
    <%
            } else {
    %>
    <p>Failed to update student with ID <%=book_id%>.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <p>An error occurred while updating the student.</p>
    <%
        }
    %>
    <a href="bookdisplay.jsp">Back to Dashboard</a>
</body>
</html>