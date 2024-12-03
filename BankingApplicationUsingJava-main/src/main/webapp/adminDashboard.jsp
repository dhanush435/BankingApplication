<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .dashboard-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 15px 0;
        }
        a {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #45a049;
        }
        .logout-button {
            position: fixed;
            top: 20px; /* Adjust as needed */
            right: 20px; /* Adjust as needed */
        }
        .logout-button input[type="submit"] {
            background-color: #dc3545; /* Light red for the button */
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .logout-button input[type="submit"]:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Admin Dashboard</h1>
        <ul>
            <li><a href="registerCustomer.jsp">Register a Customer</a></li>
            <li><a href="viewCustomer.jsp">View Customer Details</a></li>
            <li><a href="closeCustomer.jsp">Close Customer Account</a></li>
            <li><a href="editCustomer.jsp">Edit Customer Details</a></li>
        </ul>
    </div>
    <div class="logout-button">
        <form action="LogoutServlet" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
