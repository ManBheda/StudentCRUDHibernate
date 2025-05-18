<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.studentapp.model.Student" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            margin: 0 5px;
        }
        a:hover {
            background-color: #4CAF50;
            color: white;
        }
        .add-button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            margin: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .add-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h2>Student List</h2>
    </header>
    <div style="text-align: center;">
        <a href="student?action=new" class="add-button">Add New Student</a>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <%
            List<Student> students = (List<Student>) request.getAttribute("students");
            for(Student s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getEmail() %></td>
            <td>
                <a href="student?action=edit&id=<%= s.getId() %>">Edit</a> |
                <a href="student?action=delete&id=<%= s.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
