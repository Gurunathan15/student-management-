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
<title>Welcome page</title>
 <style>
        body {
            background-image: url('images/student-management-system.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height:90vh;
            font-family: 'Roboto', sans-serif;
        }

        h1 {
            text-align: center;
            text-shadow: 2px 2px 8px rgba(255, 255, 255, 0.8);
            color: #006666;
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
		a{
		    color:white;
			text-decoration:none;
		}
		span{
			text-align:center;
			padding:10px;
			height:17px;
			background-color:black;
			border: 1px solid black;
			border-radius:5px;
			position:relative;
			top:0px;
			left:320px;
			width:60px;
		}
		span:hover{
			background-color:blue;
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
        td[style*="color: red;"] {
            color: red;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }

        .no-students {
            text-align: center;
            font-size: 18px;
            color: #555;
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
		h4{
			padding:10px;
			color:#990000;
			background-color: rgba(255, 255, 255, 0.8);
			box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        	width: 680px;
			word-wrap: normal;
			margin-left:155px;
			text-align:center;
		}
    </style>
</head>
<body>
    <h1>Student Details</h1>
    <main>
        <%
            HttpSession check = request.getSession(false);
            if (check == null || check.getAttribute("loggedIn") == null) {
                response.sendRedirect("Login.jsp");
                return;
            }
        %>

        <form action="stdsearch" method="post" id="searchbar">
            <input type="text" name="search" placeholder="Enter Student ID or Name">
            <input type="submit" value="Search">
            <span><a href="home.jsp">Back</a></span>
        </form>

        <table>
            <% String errorMessage = (String) request.getAttribute("message");
                if (errorMessage != null) {
            %>
                <p class="message"><%= errorMessage %></p>
            <% } %>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
                    <th>Total</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            	
                <%
                    int failedCount = 0;
                    int failedPhysics = 0;
                    int failedChemistry = 0;
                    int failedMaths = 0;
                    List<Student> student = GetDetails.getStudentData();
                    if (student != null) {
                        for (Student std : student) {
                            int totalMarks = std.getMaths() + std.getChemistry() + std.getPhysics();
                            boolean Failed = totalMarks < 105;
                            if (Failed) {
                                failedCount++;
                            }
                            if (std.getPhysics() < 35) {
                                failedPhysics++;
                            }
                            if (std.getChemistry() < 35) {
                                failedChemistry++;
                            }
                            if (std.getMaths() < 35) {
                                failedMaths++;
                            }
                %>
                <tr style="<%= totalMarks < 105 ? "color: red;" : "" %>" >
					<td><%= std.getId() %></td>
					<td><%= std.getName() %></td>
					<td><%= std.getContact() %></td>
					<td style="<%= std.getPhysics() < 35 ? "color: red;" : "" %>"><%= std.getPhysics() %></td>
					<td style="<%= std.getChemistry() < 35 ? "color: red;" : "" %>"><%= std.getChemistry() %></td>
					<td style="<%= std.getMaths() < 35 ? "color: red;" : "" %>"><%= std.getMaths() %></td>
					<td style="<%= Failed ? "color: red;" : "" %>"><%= totalMarks %></td>
					<td>
                        <form action="update" method="post">
                            <input type="hidden" name="studentId" value="<%= std.getId() %>">
                            <button type="submit" formaction="Update.jsp">Update</button>
                        </form>
                    </td>
                    <td>
                        <form action="DeleteStudent" method="post">
                            <button value="<%= std.getId() %>" name="del">Delete</button>
                        </form>
                    </td>
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
        <h4>Failed Students =  Physics: <% out.print(failedPhysics); %> |  Chemistry: <% out.print(failedChemistry); %> |  Maths: <% out.print(failedMaths); %> | All Subjects: <% out.print(failedCount); %> </h4>
    </main>
</body>

</html>