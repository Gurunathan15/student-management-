package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
        	Connection con = Dto.GetConnection.getConnection();

        	PreparedStatement ps = con.prepareStatement("SELECT email FROM userdetail WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("error", "Email is already registered.Please use a different email.");
                RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
                rd.forward(req, resp);
                
            }
            PreparedStatement pst = con.prepareStatement("INSERT INTO userdetail(name, email, password) VALUES(?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            int data = pst.executeUpdate();

            if (data > 0) {
                req.setAttribute("success", "Signup successful!");
            } else {
                req.setAttribute("error", "Signup failed. Please try again.");
            }

            RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
        	req.setAttribute("error", "Signup failed. Please try again.");
        	RequestDispatcher rd = req.getRequestDispatcher("Signup.jsp");
            rd.forward(req, resp);
            e.printStackTrace();
        }
    }
}
