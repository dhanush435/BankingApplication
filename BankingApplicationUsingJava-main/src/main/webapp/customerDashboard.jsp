<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .dashboard-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align: center;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .details {
            text-align: left;
            margin-bottom: 20px;
        }
        .details p {
            margin: 10px 0;
        }
        .actions ul {
            list-style-type: none;
            padding: 0;
        }
        .actions li {
            margin: 10px 0;
        }
        .actions a, .actions input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border: none;
            display: inline-block;
        }
        .actions a:hover, .actions input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Customer Dashboard</h1>
        <div class="details">
            <%
                String accountno = request.getParameter("accountno");
                Connection conn = null;
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_system", "root", "Narasimha@45");

                    pst = conn.prepareStatement("SELECT * FROM customer1 WHERE accountno = ?");
                    pst.setString(1, accountno);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        out.println("<p><strong>Account Number:</strong> " + rs.getString("accountno") + "</p>");
                        out.println("<p><strong>First Name:</strong> " + rs.getString("firstname") + "</p>");
                        out.println("<p><strong>Last Name:</strong> " + rs.getString("lastname") + "</p>");
                        out.println("<p><strong>Email:</strong> " + rs.getString("email") + "</p>");
                        out.println("<p><strong>Aadhar Number:</strong> " + rs.getString("aadharno") + "</p>");
                        out.println("<p><strong>Phone Number:</strong> " + rs.getString("phoneno") + "</p>");
                        out.println("<p><strong>Address:</strong> " + rs.getString("address") + "</p>");
                        out.println("<p><strong>Balance:</strong> " + rs.getDouble("balance") + "</p>");
                    } else {
                        out.println("<p>Customer not found.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pst != null) pst.close();
                        if (conn != null) conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
        <h2>Actions:</h2>
        <div class="actions">
            <ul>
                <li><a href='deposit.jsp?accountno=<%= accountno %>'>Deposit</a></li>
                <li><a href='withdraw.jsp?accountno=<%= accountno %>'>Withdraw</a></li>
                <li>
                    <form action="CloseAccountServlet" method="post" style="display:inline;">
                        <input type="hidden" name="accountno" value="<%= accountno %>">
                        <input type="submit" value="Close Account">
                    </form>
                </li>
                <li><a href='TransactionsServlet?accountno=<%= accountno %>'>View Transactions</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
