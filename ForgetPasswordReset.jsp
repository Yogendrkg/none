<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Log in</title>
<style type="text/css">
/* Style inputs with type="text", select elements and textareas */
input[type=text], select, textarea {
    width: 100%; /* Full width */
    padding: 12px; /* Some padding */ 
    border: 1px solid #ccc; /* Gray border */
    border-radius: 4px; /* Rounded borders */
    box-sizing: border-box; /* Make sure that padding and width stays in place */
    margin-top: 6px; /* Add a top margin */
    margin-bottom: 16px; /* Bottom margin */
    resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}
 /* Style inputs with type="text", select elements and textareas */
input[type=password], select, textarea {
    width: 20%; /* Full width */
    padding: 12px; /* Some padding */ 
    border: 1px solid #ccc; /* Gray border */
    border-radius: 4px; /* Rounded borders */
    box-sizing: border-box; /* Make sure that padding and width stays in place */
    margin-top: 6px; /* Add a top margin */
    margin-bottom: 16px; /* Bottom margin */
    resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=reset] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: 2px;
    border-radius: 4px;
    cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=reset]:hover {
    background-color: #45a049;
}
/* Style the submit button with a specific background color etc */
input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: 2px;
    border-radius: 4px;
    cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
    background-color: #45a049;
}

/* Add a background color and some padding around the form */
.container {
    border-radius: 8px;
    background-color: #f2f2f2;
    padding: 20px;
	align
	 
}
.right {	text-align: right;
}
</style>
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body background="b98c9470ddaeaeb750279ccd1e38ee40.jpg">

<center> 
<form action="PasswordSet.jsp" method="post">
  <table width="993" height="102" border="0">
    <tr>
      <td width="400" height="96"><img src="head.png" width="400" height="88" alt="Logo" /></td>
      <td width="726" class="right">24X7 Customer Support - <a href="ContactUs.jsp">Contact us</a> | <a href="home.jsp">Home</a> |<a href="login.jsp">Login</a></td>
    </tr>
  </table>
  <hr color="blue"/>
  <%@ page language="java" %>
<%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  <%

		
try
{
	PreparedStatement ps;
	Connection conn;
	ResultSet rs= null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@YOGI-PC:1521:xe","system","12345");
		String sql= "SELECT id from register1 where dateb=?";
		ps = conn.prepareStatement (sql);
		ps.setString (1,request.getParameter("dob"));
        rs = ps.executeQuery ();
		if (rs.next ())			
		{ 
session.setAttribute("id", rs.getString ("id"));	%>
<table>
<br>
<br>
<br>
<br>
<br>
<tr>
<td> NEW Password:</td><td><input type="text" name="password1"></td>
</tr>
<br>
<br>
<tr>
<td>Confirm Password:</td><td><input type="text" name="password2"></td>
</tr>
</table>
<br>
<center><input type="submit" value="Confirm">
<input type="reset" id="rest" value="Clear">

			
        <%
		} else { 
			   %> 
			   <center><h2>
			   </h2>   <center>
			   <jsp:forward page="ForgetPassword.jsp" />

<%			   
		}
		conn.close();
		ps.close();
		rs.close();
		}
catch(Exception e)
{
	out.println(e);
}
%>
</form>

</body>
</html>