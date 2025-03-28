package Dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Dto.Student;
public class GetDetails {
	public static List<Student> getStudentData() throws SQLException{
		Connection con = Dto.GetConnection.getConnection();
		PreparedStatement pst = con.prepareStatement("select id, name,contact, physics,chemistry,maths from studentmanagement.student");
		ResultSet rst=pst.executeQuery();
		List<Student> Studentdetail=new ArrayList<Student>();
		while(rst.next()) {
			Student std = new Student(rst.getInt("id"), rst.getString("name"),rst.getLong("contact") ,rst.getInt("physics"), rst.getInt("chemistry"),rst.getInt("maths"));
		    Studentdetail.add(std);
		}
		return Studentdetail;
		
		
	}
	public static List<Student> getStudentsById(int id) {
		List<Student> stud = new ArrayList<Student>();
        try {
        	Connection conn = Dto.GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM student WHERE id = ?"); 
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                
                while (rs.next()) {
                    Student stds=new Student(rs.getInt("id"),rs.getString("name"),rs.getLong("contact"),rs.getInt("physics"),rs.getInt("chemistry"),rs.getInt("maths"));
                    stud.add(stds);
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stud;
    }

    public static List<Student> getStudentsByName(String name) {
        List<Student> students = new ArrayList<>();
        try  {
        	Connection conn = Dto.GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM student WHERE name LIKE ?");
                ps.setString(1, "%" + name + "%");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    students.add(new Student(rs.getInt("id"), rs.getString("name"),rs.getLong("contact"),rs.getInt("physics"), rs.getInt("chemistry"),rs.getInt("maths")));
                }
            
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions
        }
        return students;
    }
}
