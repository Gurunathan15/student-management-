<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student details</title>
<style>
    body {
    	background-image: url('images/newstudentbackground.jpg');
        background-size: 100%;
        background-position: center;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 400px;
    }
    label {
		    font-weight: bold;
		    display: inline-block;
		    margin-top: 10px;
		    width: 30%;
		    text-align: right; 
		    padding-right: 10px; 
		    margin-bottom: 5px;
        	color: #333;
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
    input:focus {
        border-color: #4CAF50;
        outline: none;
    }
    button {
    	width: 40%;
        padding: 10px;
        border: none;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        display: inline-block;
        margin-left: 100px;
    }
    button:hover {
        background-color: #45a049;
    }
    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    h1{
    	text-align:center;
    }
    span a{
    	color:white;
    	text-decoration:none;
    }
    span{
   		width: 40%;
        padding: 10px;
    	margin-left:30px;
    	border-radius: 4px;
        cursor: pointer;
        
    	background-color: #4CAF50;
    }
    span:hover{
    	background-color: #45a049;
    }
</style>
</head>
<body>
	<div class="form-container">
	
		<form  method="post" action="Adddetail">
			<h1>New Student Details</h1>
			<label>Id</label><input placeholder="Enter Id Number" name="id" required>
			<label>Name</label><input placeholder="Enter Student Name" name="name" required>
			<label>Contact</label><input placeholder="Enter Contact Number" name="contact" required>
			<label>Physics Marks</label><input placeholder="Enter Physics Marks" name="physics">
			<label>Chemistry Marks</label><input placeholder="Enter Chemistry Marks" name="chemistry">
			<label>Maths Marks</label><input placeholder="Enter Maths Marks" name="maths">
			<button>Submit</button><span ><a href="home.jsp">Back</a></span>
		</form></div>
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
</body>
</html>