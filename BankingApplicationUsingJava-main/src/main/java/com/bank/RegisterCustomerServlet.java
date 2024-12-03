package com.bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterCustomerServlet")
public class RegisterCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String aadharno = request.getParameter("aadharno");
        String phoneno = request.getParameter("phoneno");
        String address = request.getParameter("address");
        String balanceStr = request.getParameter("balance");
        double balance = Double.parseDouble(balanceStr);

        // Generate unique account number
        String accountno = generateAccountNumber();

        // Generate temporary password
        String tempPassword = generateTempPassword();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "Narasimha@45");

            PreparedStatement pst = conn.prepareStatement("INSERT INTO customer1 (accountno, firstname, lastname, email, aadharno, phoneno, address, password, balance, temp_colum) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, accountno);
            pst.setString(2, firstname);
            pst.setString(3, lastname);
            pst.setString(4, email);
            pst.setString(5, aadharno);
            pst.setString(6, phoneno);
            pst.setString(7, address);
            pst.setString(8, tempPassword);
            pst.setDouble(9, balance);
            pst.setInt(10, 1); // Set temp_colum to 1
            int rowCount = pst.executeUpdate();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Customer Registration</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f9; color: #333; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }");
            out.println(".container { background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); width: 80%; max-width: 600px; text-align: center; }");
            out.println("h1 { color: #4CAF50; margin-bottom: 20px; }");
            out.println("p { font-size: 16px; line-height: 1.6; }");
            out.println(".success { color: #27ae60; }");
            out.println(".error { color: #e74c3c; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h1>Customer Registration</h1>");
            
            if (rowCount > 0) {
                out.println("<p class='success'>Customer registered successfully.</p>");
                out.println("<p><strong>Account Number:</strong> " + accountno + "</p>");
                out.println("<p><strong>Temporary Password:</strong> " + tempPassword + "</p>");
            } else {
                out.println("<p class='error'>Failed to register customer.</p>");
            }

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><body><h3 class='error'>An error occurred: " + e.getMessage() + "</h3></body></html>");
        } finally {
            out.close();
        }
    }

    private String generateAccountNumber() {
        Random rand = new Random();
        int num = 1000000 + rand.nextInt(9000000);
        return String.valueOf(num);
    }

    private String generateTempPassword() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(randomIndex));
        }
        return sb.toString();
    }
}
