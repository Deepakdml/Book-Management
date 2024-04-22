<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
   
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from bookinfo");
 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
			background-image: url('image/book2.jpeg');
    		background-size: cover;
    		background-repeat: no-repeat;
		}
	body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

a.eu {
    display: inline-block;
    padding: 6px 12px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

a.eu:hover {
    background-color: #0056b3;
}
	
</style>
</head>
<body>
		<table>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th  colspan="3">Action</th>
            
        </tr>
        
        
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><a class="eu" href="editbook.jsp?book_id=<%=rs.getInt("book_id")%>">Update Books</a></td>
            <td><a class="eu" href="deletebook.jsp?book_id=<%=rs.getInt("book_id")%>" >Delete Books</a></td>
        </tr>
        <% } %>
    </table>

</body>
</html>

<%
    
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>