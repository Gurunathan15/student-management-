<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 body {
            font-family: 'Poppins', sans-serif;
            background-image: url('images/student-management-software.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display:flex;
            flex-direction:column;
            align-items:center;
            justify-content:center;
            height:100vh;
        }
	h1 {
            color: #333;
            font-size: 26px;
        }
    .dropdown-content {
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            border-radius: 5px;
            min-width: 150px;
            text-align: left;
        }

        .dropdown-content a {
            padding: 12px;
            display: inline-block;
            text-decoration: none;
            color: black;
            transition: 0.3s;
        }

        .dropdown-content a:hover {
            background: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        #btn {
            display: inline-block;
            background: #28a745;
            color: white;
            padding: 12px 20px;
            margin: 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
           
        }

        #btn:hover{
            background-color: #FF6666;
        }
	.footer {
            margin-top: 79px;
            font-size: 14px;
            color: #555;
        }
        p{
        	font-size:larger;
        }
</style>
</head>
<body>
	<% 
    HttpSession check = request.getSession(false);
    if (check.getAttribute("loggedIn") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
	<h1>Welcome!!</h1>
	<p>Hello, <strong><%= (String) session.getAttribute("name") %></strong>! You are logged in.</p>
	
	<div class="dropdown">
            <div class="dropdown-content">
                <a href="Welcome.jsp">View Student Details</a>
                <a href="AddStudent.jsp">Add Student Details</a>
            </div>
        </div>

        <a href="Login.jsp" id="btn">Logout</a>

        <div class="footer">© 2025 Student Management System | Designed by Guru</div>
    </div>
</body>
</html>