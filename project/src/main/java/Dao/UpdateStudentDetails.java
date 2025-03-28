package Dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateStudentDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("studentId");
        String updateField = req.getParameter("updateField");
        String name = req.getParameter("name");
        String contactStr = req.getParameter("contact");
        String physicsStr = req.getParameter("physics");
        String chemistryStr = req.getParameter("chemistry");
        String mathsStr = req.getParameter("maths");


        try {
            int studentIdInt = Integer.parseInt(studentId);

            if ("name".equals(updateField) ) {
                updateName(studentIdInt, name);
                
            } else if ("contact".equals(updateField)) {
            	long contact = Long.parseLong(contactStr);
                updateContact(studentIdInt, contact);
                
            } else if ("physics".equals(updateField)) {
                int physics = Integer.parseInt(physicsStr);
                updatePhysicsGrade(studentIdInt, physics);

            } else if ("chemistry".equals(updateField)) {
                int chemistry = Integer.parseInt(chemistryStr);
                updateChemistryGrade(studentIdInt, chemistry);
                
            } else if ("maths".equals(updateField)) {
                int maths = Integer.parseInt(mathsStr);
                updateMathsGrade(studentIdInt, maths);
                
            } else {
                resp.getWriter().write("update failedd");
                return;
            }
            req.setAttribute("error", "Updated Successfully.");
            RequestDispatcher rd = req.getRequestDispatcher("Update.jsp");
            rd.forward(req, resp);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void updateName(int studentId, String name) throws SQLException {
        try (Connection conn = Dto.GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE student SET name = ? WHERE id = ?")) {
            stmt.setString(1, name);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
        }
    }

    private static void updateContact(int studentId, long contact) throws SQLException {
        try (Connection conn = Dto.GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE student SET contact = ? WHERE id = ?")) {
            stmt.setLong(1, contact);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
        }
    }

    private static void updatePhysicsGrade(int studentId, int physics) throws SQLException {
        try (Connection conn = Dto.GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE student SET physics = ? WHERE id = ?")) {
            stmt.setInt(1, physics);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
        }
    }

    private static void updateChemistryGrade(int studentId, int chemistry) throws SQLException {
        try (Connection conn = Dto.GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE student SET chemistry = ? WHERE id = ?")) {
            stmt.setInt(1, chemistry);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
        }
    }

    private static void updateMathsGrade(int studentId, int maths) throws SQLException {
        try (Connection conn = Dto.GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE student SET maths = ? WHERE id = ?")) {
            stmt.setInt(1, maths);
            stmt.setInt(2, studentId);
            stmt.executeUpdate();
        }
    }
}




