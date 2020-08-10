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
		// TODO Auto-generated constructor stub\
		DBConnection.initConnection();
	}
	public static MemberDao getInstance() {
		return dao;
	}
	
	
	//id 중복확인
	public boolean getId(String id) {
		//id 확인 -> true/ false
		//return true;
		String sql = " SELECT ID"
				+ " FROM FIVE_MEMBER "
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id.trim());
				
				count = psmt.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		
		} finally {
			DBClose.close(psmt, conn, null);	
		}
		
		return count>0?true:false;
	}
	

	
	//신규회원 추가
	public boolean addMember(MemberDto dto) {
		//회원가입의 데이터 -> DB
		//return true;
		String sql = " INSERT INTO FIVE_MEMBER(ID, NAME, PASSWORD, PHONENUMBER, EMAIL, AUTH) "
				+ " VALUES(?, ?, ?, ?, ?, 3) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getName());
				psmt.setString(3, dto.getPwd());
				psmt.setInt(4, dto.getPhone());
				psmt.setString(5, dto.getEmail());
				psmt.setInt(6, dto.getAuth());
				
				count = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);	
		}
		return count>0?true:false;
	}
	
	public MemberDto login(String id, String pwd) {
		String sql = " SELECT ID, NAME, PASSWORD, PHONENUMBER, EMAIL, AUTH "
					+ " FROM FIVE_MEMBER "
					+ " WHERE ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 login success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			System.out.println("2/6 login success");
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String user_id = rs.getString(1);
				String name = rs.getString(2);
				int phone = rs.getInt(3);
				String email = rs.getString(4);
				int auth = rs.getInt(5);
				
				dto = new MemberDto(user_id, null, name, phone, email, auth);//pwd는 null로 뺌
			}
			System.out.println("3/6 login success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
		
	}
}
