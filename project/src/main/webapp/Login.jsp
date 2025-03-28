<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<style>
    body {
        background-image: url('images/backdrop.jpg');
        background-size: 100%;
        background-position: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
 	form {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
		display:inline;
    }
    input {
        width: 60%;
        padding: 10px;
        margin: 10px 0;
        margin-left:5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    button {
        padding: 10px 15px;
        background-color: rgb(0, 191, 0);
        transition: transform 0.3s ease, background 0.3s ease;
        margin-top: 8px;
        margin-left: 70px;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 60%;
    }
    button:hover {
        background-color: green;
    }
    a {
        display: inline-block;
        margin-top: 5px;
        margin-left:60px;
        text-decoration: none;
        color: #007BFF;
        
    }
    a:hover {
        text-decoration: underline;
    }
    h1{
    	text-align:center;
    	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
    }
    div{
    	text-align:center;
    }
    label{
    	font-weight:bold;
    }
</style>
</head>
<body>
	<form method="post" action="Login">
	<div>
		<%
	        String errorMessage = (String) request.getAttribute("errorMessage");
	       		 if (errorMessage != null) {
	            out.println("<p style='color: red;'>" + errorMessage + "</p>");
	        		}
   		 %>
	</div>
	<h1>Login</h1>
	<label>Email-Id</label><input placeholder="Enter Email-id" name="email" required type="text">
	<label>Password</label><input  placeholder="Enter Password" name="password" required type="password">
	<a href="Signup.jsp">Create an Account? SignUp</a>
	<button>Submit</button>
	</form>
</body>
</html>