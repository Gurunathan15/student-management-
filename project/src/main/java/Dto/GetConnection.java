package Dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class GetConnection {

    public static Connection getConnection() throws SQLException {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "root", "root");
            
        } catch (Exception e) {
            e.printStackTrace();
        } 
        if(con == null) {
            createDatabase();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "root", "root");
        }
        return con; 
    }

    public static void createDatabase() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "root");
            Statement st = con.createStatement();
            
            String dataBase = "studentmanagement";
            st.execute("CREATE DATABASE IF NOT EXISTS " + dataBase);
            
         
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dataBase, "root", "root");
            st = con.createStatement();

            
            st.execute("CREATE TABLE IF NOT EXISTS userdetail (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(45) NOT NULL, email VARCHAR(55) UNIQUE NOT NULL, password VARCHAR(25) NOT NULL)");
            st.execute("CREATE TABLE IF NOT EXISTS student (id INT  PRIMARY KEY, name VARCHAR(25) NOT NULL, contact BIGINT NOT NULL, physics INT NOT NULL, chemistry INT NOT NULL, maths INT NOT NULL)");

            st.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


