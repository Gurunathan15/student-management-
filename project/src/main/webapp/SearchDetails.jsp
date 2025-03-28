<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"%>
    <%@ page import="Dto.Student"%>
    <%@ page import="Dto.GetDetails"%>
    <%@ page import="Dao.DeleteStudent"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student Details</title>
<style>
		body {
        background-image: url('images/school-management.jpg');
        background-size: cover;
        background-position: center;
        height: 100vh;
        font-family: 'Roboto', sans-serif;
       
    }
     table {
            width: 70%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: 150px;
            background-color: rgba(256, 256, 256, 0.9)
        }

        table td {
            padding: 10px;
            text-align: center;
            border: none;
        }

        table th {
        	padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
            background-color: #808080;
            color: white;
        }
        
        .message {
            color: green;
            margin-top: 10px;
        }
        .no-students {
            text-align: center;
        }
        h1 {
            text-align: center;
            text-shadow: 2px 2px 8px rgba(255, 255, 255, 0.8);
            color: white;
        }
        #searchbar {
            text-align: center;
            margin-bottom: -50px;
            margin-bottom: 20px;
            margin-left: 150px;
        	width:360px;
        	display:flex;
        }

        #searchbar input[type="text"] {
            padding: 5px;
            width: 60%;
            margin-right: 10px;
            font-size: small;
        }

        #searchbar input[type="submit"] {
        	background-color: #FFA500;
        	border: 1px solid #FFA500;
        	color:white;
            padding: 2px;
            border-radius:5px;
            font-size: medium;
            cursor: pointer;
            width: 30%;
        }
         #searchbar input[type="submit"]:hover{
         			background-color: #FFB84D;
         }
        button {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        #student{
        	margin-top:20px;
        	margin-left:730px;
        }
    </style>
</head>
<body>
	<h1>Search Details</h1>
	
	<main>
	<form action="stdsearch" method="post" id="searchbar">
        <input type="text" name="search" placeholder="Enter Student ID or Name">
        <input type="submit" value="Search">
    </form>
        <table border="1">
        	<table>
            <thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Contact</th>
					<th>Physics</th>
					<th>Chemistry</th>
					<th>Maths</th>
					<th>Total</th>
				</tr>
			</thead>
            <tbody>
				<%  
				List<Student> students = (List<Student>) request.getAttribute("student");
                if (students != null) {
                    for (Student std : students) {
                    	int totalMarks = std.getMaths() + std.getChemistry() + std.getPhysics();
                    	boolean Failed = totalMarks<105;
            %>
				<tr style="<%= totalMarks < 105 ? "color: red;" : "" %>" >
					<td><%= std.getId() %></td>
					<td><%= std.getName() %></td>
					<td><%= std.getContact() %></td>
					<td style="<%= std.getPhysics() < 35 ? "color: red;" : "" %>"><%= std.getPhysics() %></td>
					<td style="<%= std.getChemistry() < 35 ? "color: red;" : "" %>"><%= std.getChemistry() %></td>
					<td style="<%= std.getMaths() < 35 ? "color: red;" : "" %>"><%= std.getMaths() %></td>
					<td style="<%= Failed ? "color: red;" : "" %>"><%= totalMarks %></td>
					
				</tr>
				<% 
                        }
                    } else {
                %>
                    <tr class="no-students">
                        <td colspan="9">No students available</td>
                    </tr>
                <%
                    }
                %>
            
			</tbody>
			</table>
			<form action="back" method="post">
					        <button type="submit" formaction="Welcome.jsp" id="student">View All Details</button>
					    </form>
			</main>
</body>
</html>