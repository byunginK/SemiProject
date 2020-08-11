package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	public static MemberDao getInstance() {
		return dao;
	}
	
	
	public boolean CheckId(String id) {	
	
		String sql = " SELECT COUNT(*) FROM FIVE_MEMBER "	
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 CheckId success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 CheckId success");
			
			psmt.setString(1, id.trim());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 CheckId success");
			
			if(rs.next()) {	
				if(rs.getInt("COUNT(*)") != 0){
					
					findid = false;
				//	System.out.println(rs.getInt("COUNT(*)"));
				}
				else if(rs.getInt("COUNT(*)") == 0) {
					
					findid = true;
				}
				
			}			
			System.out.println(findid);
		} catch (Exception e) {			
			e.printStackTrace();
			System.out.println("getId fail");
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return findid;
	}
	
	public boolean addMember(MemberDto dto) {
	
		String sql = " INSERT INTO FIVE_MEMBER "
				+ "	(ID, PASSWORD, NAME, PHONENUMBER, EMAIL, AUTH) "
				+ " VALUES(?, ?, ?, ?, ?, 3) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setInt(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addMember fail");
		} finally {
			DBClose.close(psmt, conn, null);	
			System.out.println("4/6 addMember success");
		}
		
		return count>0?true:false;
	}
	
public MemberDto login(String id) {
		
		String sql = " SELECT ID, NAME, PHONENUMBER, EMAIL, AUTH "
				+ " FROM FIVE_MEMBER "
				+ " WHERE ID=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		ResultSet rs = null;
		
		MemberDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 login success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/6 login success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 login success");
			
			if(rs.next()) {
				String user_id = rs.getString(1);
				String name = rs.getString(2);
				int phone = rs.getInt(3);
				String email = rs.getString(4);
				int auth = rs.getInt(5);
				
				dto = new MemberDto(user_id, null, name, phone, email, auth);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
				
	}
}








