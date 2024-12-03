package com.bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CloseCustomerServlet")
public class CloseCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountno = request.getParameter("accountno");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "Narasimha@45");

            PreparedStatement pst = conn.prepareStatement("UPDATE customer1 SET active = 0 WHERE accountno = ?");
            pst.setString(1, accountno);
            int rowCount = pst.executeUpdate();

            PrintWriter out = response.getWriter();
            if (rowCount > 0) {
                out.println("Customer account closed successfully.");
            } else {
                out.println("Customer not found.");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
