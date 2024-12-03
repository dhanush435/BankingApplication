<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: #4CAF50;
        }
        p {
            font-size: 1.2em;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            display: inline;
            margin: 0 15px;
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
    </style>
</head>
<body>
    <h1>Welcome!</h1>
    <p>Please select your role to login:</p>
    <ul>
        <li><a href="customerLogin.jsp">Customer Login</a></li>
        <li><a href="adminLogin.jsp">Admin Login</a></li>
    </ul>
</body>
</html>
