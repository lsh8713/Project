package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB.DBCon;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBCon dbc = new DBCon();

	public UserDAO() {
		/*
		try {
			String dbURL = "jdbc:mysql://localhost:3306/mydatabase";
			String dbID = "root";
			String dbPassword = "1125";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	*/
	}

	public int login (String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID =?";
		try {
			
		//	pstmt = conn.prepareStatement(SQL);
			pstmt = dbc.getPStmt(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				} else
					return 0;
			}
			return -1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;
		
	}
	
	public int join(user user) {

		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";

		try {

			// pstmt = conn.prepareStatement(SQL);
			pstmt = dbc.getPStmt(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//����
	
	public int update(user user) {

		String SQL = "UPDATE user SET userPassword=?, userName=?, userGender=?, userEmail=? WHERE userID = ?";
			
		try {
			PreparedStatement pstmt = dbc.getPStmt(SQL);
				
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserID());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	//Ż��
	
	public int delete(String userID){
		String SQL = "DELETE FROM user WHERE userID = ?";
		
		
		try {
		
			PreparedStatement pstmt = dbc.getPStmt(SQL);
			
			pstmt.setString(1, userID);
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;

	}
	
}
