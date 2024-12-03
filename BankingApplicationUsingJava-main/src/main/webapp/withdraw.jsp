<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Withdraw Money</title>
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
        .form-container {
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
        label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Withdraw Money</h1>
        <form action="WithdrawServlet" method="post">
            <input type="hidden" name="accountno" value="<%= request.getParameter("accountno") %>">
            <label for="amount">Amount to Withdraw:</label>
            <input type="number" id="amount" name="amount" step="0.01" required>
            <input type="submit" value="Withdraw">
        </form>
    </div>
</body>
</html>
