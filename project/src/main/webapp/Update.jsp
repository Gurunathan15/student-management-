<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/update.jpg');
	        background-size: cover;
	        background-position: center;
            margin: 30px;
            height: 90vh;
	        display: flex;
	        flex-direction:column;
	        justify-content: center;
	        align-items: center;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
             background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 15px;
            margin-left: 20px;
        }
        label {
            font-weight: bold;
            
        }
        input[type="text"] {
            width: 80%;
            padding: 8px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-top: 8px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        h3{
         	text-align:center;
        }
        #updateField{
        	padding:5px 10px;
        	border-radius:5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Update Student Details</h3>
        <form action="update" method="post">
        	<div id="error">
        	<%
        	String errorM = (String) request.getAttribute("error");
        	if (errorM != null) {
            out.println("<p style='color: green;'>" + errorM + "</p>");
       		}
   			%></div>
        	
            <input type="hidden" name="studentId" value="<%= request.getParameter("studentId") %>">
            <div class="form-group">
                <label for="updateField">Select to Update:</label>
                <select id="updateField" name="updateField" required>
                    <option value="name">Name</option>
                    <option value="contact">Contact Number</option>
                    <option value="physics">Physics Marks</option>
                    <option value="chemistry">Chemistry Marks</option>
                    <option value="maths">Maths Marks</option>
                </select>
            </div>
            <div class="form-group" id="nameGroup" style="display:none;">
                <label for="name">New Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter new name" />
            </div>
            <div class="form-group" id="contactGroup" style="display:none;">
                <label for="contact">New Contact Number:</label>
                <input type="text" id="contact" name="contact" placeholder="Enter new contact number" pattern="\d{10}" title="Please enter a 10-digit contact number" />
            </div>
            <div class="form-group" id="physicsGroup" style="display:none;">
                <label for="physics">New Physics Marks:</label>
                <input type="text" id="physics" name="physics" placeholder="Enter new physics marks" />
            </div>
            <div class="form-group" id="chemistryGroup" style="display:none;">
                <label for="chemistry">New Chemistry Marks:</label>
                <input type="text" id="chemistry" name="chemistry" placeholder="Enter new chemistry marks" />
            </div>
            <div class="form-group" id="mathsGroup" style="display:none;">
                <label for="maths">New Maths Marks:</label>
                <input type="text" id="maths" name="maths" placeholder="Enter new maths marks" />
            </div>
            <div class="form-group">
                <button type="submit">Update Student Information</button>
                <button type="submit" formaction="Welcome.jsp">Back</button>
            </div>
        </form>
    </div>

    <script>
        document.getElementById('updateField').addEventListener('change', function() {
            document.getElementById('nameGroup').style.display = 'none';
            document.getElementById('contactGroup').style.display = 'none';
            document.getElementById('physicsGroup').style.display = 'none';
            document.getElementById('chemistryGroup').style.display = 'none';
            document.getElementById('mathsGroup').style.display = 'none';
            document.getElementById('error').style.display = 'none';
            var selectedField = this.value;
            if (selectedField === 'name') {
                document.getElementById('nameGroup').style.display = 'block';
            } else if (selectedField === 'contact') {
                document.getElementById('contactGroup').style.display = 'block';
            } else if (selectedField === 'physics') {
                document.getElementById('physicsGroup').style.display = 'block';
            } else if (selectedField === 'chemistry') {
                document.getElementById('chemistryGroup').style.display = 'block';
            } else if (selectedField === 'maths') {
                document.getElementById('mathsGroup').style.display = 'block';
            }
        });

        // Set default field to show on page load
        document.getElementById('updateField').value = "name";
        document.getElementById('nameGroup').style.display = 'block';
    </script>
</body>
</html>


