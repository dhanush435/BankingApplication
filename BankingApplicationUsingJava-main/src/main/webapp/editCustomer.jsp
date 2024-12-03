<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer Details</title>
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
        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="checkbox"] {
            margin-top: 10px;
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
        <h1>Edit Customer Details</h1>
        <form action="EditCustomerServlet" method="post">
            <label for="accountno">Account Number:</label>
            <input type="text" id="accountno" name="accountno" required>
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required>
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="aadharno">Aadhar Number:</label>
            <input type="text" id="aadharno" name="aadharno" required>
            <label for="phoneno">Phone Number:</label>
            <input type="text" id="phoneno" name="phoneno" required>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            <label for="updatePassword">Generate New Password?</label>
            <input type="checkbox" id="updatePassword" name="updatePassword" value="yes">
            <input type="submit" value="Edit Customer">
        </form>
        <a href="adminDashboard.jsp" class="back-link">Back to Admin Dashboard</a>
    </div>
</body>
</html>
