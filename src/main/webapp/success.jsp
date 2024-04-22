<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM bookinfo");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Dashboard</title>
    <style>
    	body{
    		background-color: lightblue;
    	}
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a.button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            color: #333;
            background-color: lightblue;
            text-decoration: none;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        a.button:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	
	response.setHeader("Pragma","no-cache");
	
	response.setHeader("Expires", "0");

	if(session.getAttribute("title")==null)
		response.sendRedirect("index.jsp");
%>
    <h2>Book Dashboard</h2>
    <a href="index.jsp" class="button">Logout</a>
    <table>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
            
        </tr>
        
        
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><a class="eu" href="viewcart.jsp?book_id=<%=rs.getInt("book_id")%>">Add to cart</a></td>
            
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
