<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
</head>
<style>

		body{
			background-image: url('image/book.png');
    		background-size: cover;
    		background-repeat: no-repeat;
		}
		



form {
    max-width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: lightblue;
}


h2 {
    text-align: center;
    color: lightblue;
    margin-bottom: 20px;
}
h2 {
        color: #333;
        font-size: 24px;
        text-align: center;
        margin-bottom: 20px;
    }


label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}


input[type="text"],
input[type="password"],
input[type="submit"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}


input[type="submit"] {
    background-color: #3498db;
    color: white;
    border: none;
    cursor: pointer;
}


input[type="submit"]:hover {
    background-color: #2980b9;
}
		
		
</style>
<body>
    
    
    <form action="adminlogin.jsp" method="post">
    <h2>Admin Login</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
    <%-- <p><%= message %></p> --%>
</body>
</html>
