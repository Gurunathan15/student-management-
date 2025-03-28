package Dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Adddetail")
public class AddStudentDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String stdid = req.getParameter("id");
        String stdname = req.getParameter("name");
        long stdcontact = Long.parseLong(req.getParameter("contact"));
        int stdphysics = Integer.parseInt(req.getParameter("physics"));
        int stdchemistry = Integer.parseInt(req.getParameter("chemistry"));
        int stdmaths = Integer.parseInt(req.getParameter("maths"));

        try {
        	Connection con = Dto.GetConnection.getConnection();
           PreparedStatement ps = con.prepareStatement("SELECT name FROM student WHERE name = ?");
            ps.setString(1, stdname);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    req.setAttribute("error", "Name is already registered. Please use a different name.");
                    RequestDispatcher rd = req.getRequestDispatcher("AddStudent.jsp");
                    rd.forward(req, resp);
                    return;
                }
            }
            PreparedStatement pst = con.prepareStatement("INSERT INTO student VALUES(?,?,?,?,?,?)");
            pst.setString(1, stdid);
            pst.setString(2, stdname);
            pst.setLong(3, stdcontact);
            pst.setInt(4, stdphysics);
            pst.setInt(5, stdchemistry);
            pst.setInt(6, stdmaths);
            
            int data = pst.executeUpdate();
            
            if (data > 0) {
                resp.sendRedirect("Welcome.jsp");
            } else {
                req.setAttribute("error", "Add Details failed. Please try again.");
                RequestDispatcher rd = req.getRequestDispatcher("AddStudent.jsp");
                rd.forward(req, resp);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
