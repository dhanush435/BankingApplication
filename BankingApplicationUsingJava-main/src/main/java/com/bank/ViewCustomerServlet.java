package com.bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountno = request.getParameter("accountno");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if (accountno == null || accountno.trim().isEmpty()) {
            out.println("<html><body><h3 class='error'>Account number is missing.</h3></body></html>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "Narasimha@45");
                 PreparedStatement pst = conn.prepareStatement("SELECT accountno, firstname, lastname, email, aadharno, phoneno, address, balance FROM customer1 WHERE accountno = ?")) {

                pst.setString(1, accountno);
                try (ResultSet rs = pst.executeQuery()) {
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Customer Details</title>");
                    out.println("<style>");
                    out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f9; color: #333; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }");
                    out.println(".container { background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); width: 80%; max-width: 800px; }");
                    out.println("h1 { color: #4CAF50; margin-bottom: 20px; }");
                    out.println("p { font-size: 16px; line-height: 1.6; }");
                    out.println(".error { color: #e74c3c; }");
                    out.println(".info { color: #2c3e50; }");
                    out.println(".info strong { color: #34495e; }");
                    out.println("</style>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class='container'>");
                    out.println("<h1>Customer Details</h1>");
                    
                    if (rs.next()) {
                        out.println("<p class='info'><strong>Account Number:</strong> " + rs.getString("accountno") + "</p>");
                        out.println("<p class='info'><strong>First Name:</strong> " + rs.getString("firstname") + "</p>");
                        out.println("<p class='info'><strong>Last Name:</strong> " + rs.getString("lastname") + "</p>");
                        out.println("<p class='info'><strong>Email:</strong> " + rs.getString("email") + "</p>");
                        out.println("<p class='info'><strong>Aadhar Number:</strong> " + rs.getString("aadharno") + "</p>");
                        out.println("<p class='info'><strong>Phone Number:</strong> " + rs.getString("phoneno") + "</p>");
                        out.println("<p class='info'><strong>Address:</strong> " + rs.getString("address") + "</p>");
                        out.println("<p class='info'><strong>Balance:</strong> $" + rs.getDouble("balance") + "</p>");
                    } else {
                        out.println("<p class='error'>Customer not found.</p>");
                    }
                    
                    out.println("</div>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><body><h3 class='error'>An error occurred: " + e.getMessage() + "</h3></body></html>");
        } finally {
            out.close();
        }
    }
}
