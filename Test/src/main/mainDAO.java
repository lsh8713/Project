package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Board.Board;
import DB.DBCon;

public class mainDAO {
	private Connection conn;
	private ResultSet rs;
	DBCon dbc = new DBCon();
	
	public int getNext() { 
		String SQL = "SELECT Number FROM maindata ORDER BY Number DESC";

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
	
	public ArrayList<main> getList(int pageNumber){

		String SQL = "SELECT * FROM maindata WHERE Number < ? ORDER BY Number DESC LIMIT 10";
		ArrayList<main> list = new ArrayList<main>();

		try {
		//	PreparedStatement pstmt = conn.prepareStatement(SQL);
			PreparedStatement pstmt = dbc.getPStmt(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				main md = new main();
				md.setNumber(rs.getInt(1));
				md.setSex(rs.getString(2));
				md.setCount(rs.getInt(3));
				md.setAge(rs.getString(4));
				md.setLevel(rs.getString(5));
				md.setDate(rs.getString(6));
				md.setLocation(rs.getString(7));
				
				list.add(md);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list; 
	}
	
	/*
	
	public ArrayList<main> getSearchedList(String searchWord ,int pageNumber){

		String SQL = "SELECT * FROM maindata WHERE Number < ? AND LIKE '?' ORDER BY Number DESC LIMIT 10";
		ArrayList<main> list = new ArrayList<main>();

		try {
		//	PreparedStatement pstmt = conn.prepareStatement(SQL);
			PreparedStatement pstmt = dbc.getPStmt(SQL);
			
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			pstmt.setString(2, searchWord);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				main md = new main();
				md.setNumber(rs.getInt(1));
				md.setSex(rs.getString(2));
				md.setCount(rs.getInt(3));
				md.setAge(rs.getString(4));
				md.setLevel(rs.getString(5));
				md.setDate(rs.getString(6));
				md.setLocation(rs.getString(7));
				
				list.add(md);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list; 
	}
	
	*/
	
	// ∆‰¿Ã¬°
	
	public boolean nextPage (int pageNumber) {
		String SQL = "SELECT * FROM maindata WHERE Number < ? ORDER BY Number DESC LIMIT 10";
		ArrayList<main> list = new ArrayList<main>();
		
		try {
			
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
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
	
}
