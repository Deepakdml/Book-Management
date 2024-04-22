<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<style>
	body{
			background-image: url('image/adnovel.jpg');
    		background-size: cover;
    		background-repeat: no-repeat;
		}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 20px;
}

form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: lightblue;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="number"],
input[type="submit"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}
h1{
text-align : center;
}


</style>
<body>
    <h1>Edit Book</h1>
    <%
        
        String book_id =request.getParameter("book_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
            String sql = "SELECT * FROM bookinfo WHERE book_id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, request.getParameter("book_id"));
            ResultSet rs = pst.executeQuery();

            
            if (rs.next()) {
                
                String title = rs.getString("title");
                String author = rs.getString("author");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
    %>
    <form action="updatebook.jsp" method="post">
        
        <input type="hidden" name="book_id" value="<%=request.getParameter("book_id")%>">
        
        Title: <input type="text" name="title" value="<%=title%>"><br>
        Author: <input type="text" name="author" value="<%=author%>"><br>
        Price: <input type="number" name="price" value="<%=price%>"><br>
        Quantity: <input type="number" name="quantity" value="<%=quantity%>"><br>
        
        <input type="submit" value="Update">
    </form>
    <% } else { %>
    <p>Book not found.</p>
    <% }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

</body>
</html>
