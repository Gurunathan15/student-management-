package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 

@WebServlet("/Login")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
			Connection con = Dto.GetConnection.getConnection();

            PreparedStatement pst = con.prepareStatement("select email, password ,name from userdetail where email = ?");
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                if (rs.getString("password").equalsIgnoreCase(password) && rs.getString("email").equalsIgnoreCase(email) ) {
                   
                    HttpSession session = req.getSession();
                    session.setAttribute("name", rs.getString("name"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("password", rs.getString("password"));
                    session.setAttribute("loggedIn", true);
                    resp.sendRedirect("home.jsp"); 

                } 
                else {
                    req.setAttribute("errorMessage", "Invalid Password or password.");
                    req.getRequestDispatcher("Login.jsp").forward(req, resp);
                }
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	}
	

