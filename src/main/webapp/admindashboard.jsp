<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
	body{
			background-image: url('image/novel.jpg');
    		background-size: cover;
    		background-repeat: no-repeat;
		}
	body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

h2 {
    color: #555;
    margin-top: 20px;
    text-align: center;
}

ul {
    list-style-type: none;
    padding: 0;
    text-align: center;
}

ul li {
    margin-bottom: 10px;
    text-align: center;
}

ul li a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

ul li a:hover {
    background-color: #0056b3;
}


a {
    text-decoration: none;
    color: #007bff;
    transition: color 0.3s;
    text-align: center;
}

a:hover {
    color: #0056b3;
    text-align: center;
}

	
</style>
</head>
<body>
    <h1>Welcome, Admin!</h1>
    <h2>Manage Inventory</h2>
    <ul>
        <li><a href="addbook.jsp">Add Book</a></li>
        
        <li><a href="bookdisplay.jsp">Books</a></li>
    </ul>
    <h2>Reports</h2>
    <ul>
        <li><a href="salesReport.jsp">Sales Report</a></li>
        
    </ul>
    
    <a href="index.jsp">Logout</a>
</body>
</html>