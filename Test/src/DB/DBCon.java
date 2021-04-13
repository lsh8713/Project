package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement; // 2018.11.21 Ãß°¡
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBCon {
    Connection conn=null;
    Statement stmt=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String Drv= "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/mydatabase";
	String dbID = "root";
	String dbPassword = "1125";

    public Connection getCon(){
        try {
            Class.forName(Drv);
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
           // stmt = conn.createStatement();
           // rs = stmt.executeQuery(sql);
        }catch(ClassNotFoundException ex){
            System.out.println("CNF Err1:"+ex.getException());
        }catch(SQLException ex){
            System.out.println("SQL Err2:"+ex.getSQLState());
        }
        return conn;
    }

    public PreparedStatement getPStmt(String sql){     
        try {
            Class.forName(Drv);
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
            pstmt = conn.prepareStatement(sql);
            //rs = stmt.executeQuery(sql);
        }catch(ClassNotFoundException ex){
            System.out.println("Err1:"+ex.getException());
        }catch(SQLException ex){
            System.out.println("Err2:"+ex.getErrorCode());
        }
        return pstmt;
    }

    public ResultSet getRS(String sql){
        try {
            Class.forName(Drv);
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        }catch(ClassNotFoundException ex){
            System.out.println("Err1: CNFE");
        }catch(SQLException ex){
            System.out.println("Err2:"+ex.getSQLState());
        }
        return rs;
    }
}
