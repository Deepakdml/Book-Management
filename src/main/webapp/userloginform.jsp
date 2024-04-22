<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
</head>
<style>
		body{
			background-image: url('image/book.png');
    		background-size: cover;
    		background-repeat: no-repeat;
		}
h2 {
        color: #333;
        font-size: 24px;
        text-align: center;
        margin-bottom: 20px;
    }
	
form {
    max-width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: lightblue;
}


label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}


input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box; 
}


input[type="submit"] {
    width: 100%;
    padding: 8px;
    border: none;
    border-radius: 3px;
    background-color: blue;
    color: white;
    cursor: pointer;
}


input[type="submit"]:hover {
    background-color: darkblue;
}


input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #4CAF50;
    
}

	
</style>
<body>
   
    
    <form action="userlogin.jsp" method="post">
     <h2>User Login</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
    
</body>
</html>
