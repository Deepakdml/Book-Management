<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Management</title>
<style>

		body{
			background-image: url('image/book.png');
    		background-size: cover;
    		background-repeat: no-repeat;
		}
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: lightblue;
            text-align: center;
        }

        h2 {
            margin-top: 50px;
            color: #333;
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
		<h2>Login Page</h2>
		<a href="userloginform.jsp" class="button">User Login</a>
    	<a href="adminloginform.jsp" class="button">Admin Login</a>
    	<a href="registeruserform.jsp" class="button">User Registration</a>
    
</body>
</html>