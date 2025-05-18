<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.studentapp.model.Student" %>
<%
    Student s = (Student) request.getAttribute("student");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= s == null ? "Add" : "Edit" %> Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .form-container {
            width: 40%;
            margin: 40px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .form-container h2 {
            text-align: center;
            color: #4CAF50;
        }
        label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
            padding: 10px 20px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
        }
        .back-button:hover {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <h2><%= s == null ? "Add" : "Edit" %> Student</h2>
    </header>
    <div class="form-container">
        <form action="student" method="post">
            <input type="hidden" name="id" value="<%= s != null ? s.getId() : "" %>"/>
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" value="<%= s != null ? s.getName() : "" %>" required/><br/>
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" value="<%= s != null ? s.getEmail() : "" %>" required/><br/>
            <input type="submit" value="Submit"/>
        </form>
        <a href="student" class="back-button">Back to Student List</a>
    </div>
</body>
</html>
