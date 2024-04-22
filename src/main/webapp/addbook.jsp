<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%
    
    Connection conn = null;
    Statement stmt = null;
    int n=0;
  
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
    } catch (Exception e) {
        e.printStackTrace();
    }

    
    if (request.getMethod().equalsIgnoreCase("post")) {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        try {
            stmt = conn.createStatement();
            String sql = "INSERT INTO bookinfo (title, author, price, quantity) VALUES ('" + title + "', '" + author + "', " + price + ", " + quantity + ")";
            n=stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
    	body{
			background-image: url('image/book.png');
    		background-size: cover;
    		background-repeat: no-repeat;
		}
    	form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: lightblue;
}

h2 {
    text-align: center;
    color: #333;
}

label {
    font-weight: bold;
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
    background-color: darkblue;
    color: white;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: blue;
}
    	
    </style>
</head>
<body>
    
    <form method="post">
    <h2>Add Book</h2>
        <label>Title:</label><br>
        <input type="text" name="title" required><br>
        <label>Author:</label><br>
        <input type="text" name="author" required><br>
        <label>Price:</label><br>
        <input type="number" step="0.01" name="price" required><br>
        <label>Quantity:</label><br>
        <input type="number" name="quantity" required><br>
        <input type="submit" value="Add Book">
    </form>
    <% if(n>0) 
    {%> <script type="text/javascript">
        alert("Data added Successfully!");
    </script><%}%>
    
</body>
</html>

<%
    
    try {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
