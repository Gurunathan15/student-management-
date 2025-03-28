<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup page</title>
 <style>
        body {
        	background-image: url('images/sign.jpg');
	        background-size: cover;
	        background-position: center;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
            font-family: 'Roboto', sans-serif;
        }
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 350px;
            margin: auto;
        }
        h1 {
            text-align: center;
        }
		label {
		    font-weight: bold;
		    display: inline-block;
		    margin-top: 10px;
		    width: 30%;
		    text-align: right; 
		    padding-right: 10px; 
		}
		input {
		    width: 50%;
		    padding: 10px;
		    margin-top: 5px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		    display: inline-block;
		}
        button {
            
            background-color: rgb(0, 191, 0);
        	transition: transform 0.3s ease, background 0.3s ease;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 50%;
            margin-top: 10px;
            margin-left: 90px;
        }
        button:hover {
            background-color: green;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        #pass{
        	color:red;
        	text-align:center;
        }
        div{
        font-size:small;
        text-align:center;
        }
    </style>
     <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("cpassword").value;
            if (password !== confirmPassword) {
                document.getElementById("pass").innerText = "Passwords do not match.";
                return false;
            }
        }
    </script>
</head>
<body>
	<form method="post" action="signup" onsubmit="return validateForm()">
		<h1>SignUp</h1>
		<div>
			<%
        	String errorM = (String) request.getAttribute("error");
        	if (errorM != null) {
            out.println("<p style='color: red;'>" + errorM + "</p>");
       		}
   			%>
			<%
			String successM = (String) request.getAttribute("success");
			if (successM != null) {
   			 out.println("<p style='color: green;'>" + successM + "</p>");
			}
			%>
		</div>
		<label>Name</label><input placeholder="Enter Name" name="name" type="text"><br>
		<label>Email-Id</label><input placeholder="Enter Email-Id" name="email" type="email"><br>
		<label>Password</label><input placeholder="Enter Password" name="password" type="password" id="password"><br>
		<label>Confirm Password</label><input placeholder="Enter ConfirmPassword" name="cpassword" type="password" id="cpassword"><br>
		<p id="pass"></p>
		<a href="Login.jsp">Already Have an Account? Sign-In</a>
		<button>Submit</button>
	</form>
</body>
</html>