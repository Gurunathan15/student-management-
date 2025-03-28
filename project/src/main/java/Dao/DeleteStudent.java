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

@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet {
	   
	  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	        String studentIdStr = req.getParameter("del");
	                int studentId = Integer.parseInt(studentIdStr);
					try {
						int Deleted = DeleteStudentById(studentId);
						 if (Deleted>0) {
			                    req.setAttribute("message", "Student deleted successfully.");
			                    RequestDispatcher rd = req.getRequestDispatcher("Welcome.jsp");
			                    rd.forward(req, res);
			                    RequestDispatcher r = req.getRequestDispatcher("SearchDetails.jsp");
			                    r.forward(req, res);
			                } else {
			                    req.setAttribute("message", "Student deletion failed.");
			                    RequestDispatcher rd = req.getRequestDispatcher("Welcome.jsp");
			                    rd.forward(req, res);
			                    res.sendRedirect("SearchDetails.jsp");
			                }
						 
					} catch (SQLException e) {
					
						e.printStackTrace();
					} 
       } 
	    
	
	public static int DeleteStudentById(int id) throws SQLException {
		Connection con = Dto.GetConnection.getConnection();
		PreparedStatement pst = con.prepareStatement("Delete from student where id=?");
		pst.setInt(1, id);
		return pst.executeUpdate();
	}
}
