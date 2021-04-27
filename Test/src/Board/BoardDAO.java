package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DB.DBCon;


public class BoardDAO {
		private Connection conn;
		private ResultSet rs;
		DBCon dbc = new DBCon();
/*
		public BoardDAO() {

			try {
				String dbURL = "jdbc:mysql://localhost:3306/mydatabase?&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
				String dbID = "root";
				String dbPassword = "1125";
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
*/
		public String getDate() { 
			String SQL = "SELECT NOW()";
			try {
			//	PreparedStatement pstmt = conn.prepareStatement(SQL);
				PreparedStatement pstmt = dbc.getPStmt(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "";
		}

		public int getNext() { 
				String SQL = "SELECT bdID FROM Board ORDER BY bdID DESC";

				try {
				//	PreparedStatement pstmt = conn.prepareStatement(SQL);
					PreparedStatement pstmt = dbc.getPStmt(SQL);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						return rs.getInt(1) + 1;
					}
					return 1;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1;
			}

		// 쓰기
		
		public int write(String bdTitle, String userID, String bdContent) {
				String SQL = "INSERT INTO Board VALUES(?, ?, ?, ?, ?, ?)";
				try {
				//	PreparedStatement pstmt = conn.prepareStatement(SQL);
					PreparedStatement pstmt = dbc.getPStmt(SQL);
					pstmt.setInt(1, getNext());
					pstmt.setString(2, bdTitle);
					pstmt.setString(3, userID);
					pstmt.setString(4, getDate());
					pstmt.setString(5, bdContent);
					pstmt.setInt(6,1);
					
					return pstmt.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1;
			}
			
		public ArrayList<Board> getList(int pageNumber){

				String SQL = "SELECT * FROM Board WHERE bdID < ? AND bdAvailable = 1 ORDER BY bdID DESC LIMIT 10";
				ArrayList<Board> list = new ArrayList<Board>();

				try {
				//	PreparedStatement pstmt = conn.prepareStatement(SQL);
					PreparedStatement pstmt = dbc.getPStmt(SQL);
					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
					rs = pstmt.executeQuery();
					while (rs.next()) {

						Board bd = new Board();
						bd.setBdID(rs.getInt(1));
						bd.setBdTitle(rs.getString(2));
						bd.setUserID(rs.getString(3));
						bd.setBdDate(rs.getString(4));
						bd.setBdContent(rs.getString(5));
						bd.setBdAvailable(rs.getInt(6));
						list.add(bd);

					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return list; 
			}
		
		public Board getBd(int bdID) {

			String SQL = "SELECT * FROM Board WHERE bdID = ?";

			try {

//				PreparedStatement pstmt = conn.prepareStatement(SQL);
				PreparedStatement pstmt = dbc.getPStmt(SQL);
				pstmt.setInt(1, bdID);
				rs = pstmt.executeQuery();

				if (rs.next()) {

					Board bd = new Board();

					bd.setBdID(rs.getInt(1));
					bd.setBdTitle(rs.getString(2));
					bd.setUserID(rs.getString(3));
					bd.setBdDate(rs.getString(4));
					bd.setBdContent(rs.getString(5));
					bd.setBdAvailable(rs.getInt(6));
					return bd;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;

		}
		
		// 페이징
		
		public boolean nextPage (int pageNumber) {
			String SQL = "SELECT * FROM Board WHERE bdID < ? AND bdAvailable = 1 ORDER BY bdID DESC LIMIT 10";
			ArrayList<Board> list = new ArrayList<Board>();
			
			try {
				
//				PreparedStatement pstmt = conn.prepareStatement(SQL);
				PreparedStatement pstmt = dbc.getPStmt(SQL);
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false; 		
		}
		
		//수정

		public int update(int bdID, String bdTitle, String bdContent) {

			String SQL = "UPDATE Board SET bdTitle = ?, bdContent = ? WHERE bdID = ?";
				
			try {
				PreparedStatement pstmt = dbc.getPStmt(SQL);
					
				pstmt.setString(1, bdTitle);
				pstmt.setString(2, bdContent);
				pstmt.setInt(3, bdID);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return -1;
		}
		
		//삭제

		public int delete(int bdID) {

			String SQL = "UPDATE Board SET bdAvailable = 0 WHERE bdID = ?";

			try {
				
				PreparedStatement pstmt = dbc.getPStmt(SQL);
				
				pstmt.setInt(1, bdID);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return -1;
		}
		
}
