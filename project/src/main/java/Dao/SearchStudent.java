package Dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dto.GetDetails;
import Dto.Student;

@WebServlet("/stdsearch")
public class SearchStudent extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String searchQuery = request.getParameter("search");

        if (searchQuery != null) {
            
            if (searchQuery.matches("\\d+")) {
                try {
                    int studentId = Integer.parseInt(searchQuery);
                    List<Student> studentsById = GetDetails.getStudentsById(studentId);
                    if (studentsById.isEmpty()) {
                        request.setAttribute("message", "No students found.");
                    } else {
                        request.setAttribute("student", studentsById);
                    }
                }  catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    List<Student> studentsByName = GetDetails.getStudentsByName(searchQuery);
                    if (studentsByName.isEmpty()) {
                        request.setAttribute("message", "No students found: " + searchQuery);
                    } else {
                        request.setAttribute("student", studentsByName);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } 

        RequestDispatcher dispatcher = request.getRequestDispatcher("SearchDetails.jsp");
        dispatcher.forward(request, response);
    }
}

