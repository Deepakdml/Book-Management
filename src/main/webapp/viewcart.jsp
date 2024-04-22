<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>

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

tr:nth-child(even) {
    background-color: #f2f2f2;
}
	
</style>
</head>
<body>
	<h2>Book added to cart successfully!</h2>
	<%
	String bookId = request.getParameter("book_id");
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book", "root", "root");
		String sql = "SELECT * FROM bookinfo WHERE book_id=?";
		pst = conn.prepareStatement(sql);
		pst.setInt(1, Integer.parseInt(bookId));
		rs = pst.executeQuery();
		if (rs.next()) {
	%>

	<table>
		<tr>
			<th>Book ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Price</th>
			<th>Quantity</th>
			

		</tr>



		<tr>
			<td><%=rs.getInt("book_id")%></td>
			<td><%=rs.getString("title")%></td>
			<td><%=rs.getString("author")%></td>
			<td><%=rs.getDouble("price")%></td>
			<td><%=rs.getInt("quantity")%></td>


		</tr>

	</table>
	<%
	} else {
	%>
	<p>Book not found.</p>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {

	try {
	if (rs != null)
		rs.close();
	if (pst != null)
		pst.close();
	if (conn != null)
		conn.close();
	} catch (Exception ex) {
	ex.printStackTrace();
	}
	}
	%>

</body>
</html>