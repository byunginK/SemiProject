package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;


import db.DBClose;
import db.DBConnection;
import dto.suggestDto;

public class suggestDao {

	
	
	private static suggestDao dao = new suggestDao();

	private suggestDao() {
		DBConnection.initConnection();
	}

	public static suggestDao getInstance() {
		return dao;
	}
	 public String arrow(int depth){
		 
		 String rs = "<img src='./image/arrow.png' width='20px' height='20px'/> ";
		 String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		 
		 String ts = "";
		 for(int i = 0; i < depth; i++){
			 ts += nbsp; 
		 }
		 
		 return depth==0?"":ts + rs;
	 }
	private int[] paging(int page) throws Exception {
		
		String sql = "SELECT COUNT(*) FORM FIVE_SUGGEST";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 전체 게시물 갯수로 총 페이지 수 산출 (하나도 없으면 null 리턴)
				int totalContent = 0;
				int totalPage = 0;
				int[] startEnd = new int[2];
		
		// result 객체는 호출한 곳에서 재활용할 것이므로 자원해제
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				totalContent += rs.getInt(1);
			}
			if (totalContent == 0) {
				return null;
			}
			totalPage = totalContent / 10; // 최종 전체 페이지 갯수
			if (totalContent % 10 > 0) {
				totalPage++;	// 나머지가 있다면 1을 더해줌
			}
			// 페이징 범위 계산
			int startPage, endPage; // 시작과 끝 페이지
			startPage = ((page - 1) / 10) * 10
					+ 1;
			endPage = startPage +10 - 1;
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			 // 결과를 전달해줄 배열
			startEnd[0] = startPage;
			startEnd[1] = endPage;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return startEnd;
	}
     
     
     
	public List<suggestDto> getBbsList() {
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, " + " TITLE, CONTENT, WDATE, " + " DEL, READCOUNT "
				+ " FROM FIVE_SUGGEST " + " ORDER BY REF DESC, STEP ASC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<suggestDto> list = new ArrayList<suggestDto>();
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList success");

			while (rs.next()) {
				int i = 1;
				suggestDto dto = new suggestDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),
						rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getInt(i++));
				list.add(dto);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	public boolean writeBbs(suggestDto dto) {
		String sql = " INSERT INTO FIVE_SUGGEST " + " (SEQ, ID, REF, STEP, DEPTH, " + " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT) " + " VALUES( SEQ_FIVE_SUGGEST.NEXTVAL, ?, "
				+ " (SELECT NVL(MAX(REF), 0)+1 FROM FIVE_SUGGEST), 0, 0, " + " ?, ?, SYSDATE, " + " 0, 0)";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeBbs success");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			System.out.println("2/6 writeBbs success");

			count = psmt.executeUpdate();
			System.out.println("3/6 writeBbs success");

		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {

			DBClose.close(psmt, conn, null);

		}
		return count > 0 ? true : false;
	}

	
	  public suggestDto getSuggest(int seq) { 
	 
         String sql =" SELECT SEQ, ID, REF, STEP, DEPTH, " 
                      + " TITLE, CONTENT, WDATE, " 
        		      + " DEL, READCOUNT " 
	  				   + " FROM FIVE_SUGGEST " 
	                   +" WHERE SEQ =? ";
	  
	  Connection conn = null; 
	  PreparedStatement psmt = null; 
	  
	  ResultSet rs = null;
	  
	  suggestDto dto = null;
	  
	  
	  try { 
      
	  conn = DBConnection.getConnection();
	  System.out.println("1/6 getDetailWrite success");
	  
	  psmt = conn.prepareStatement(sql);
	  System.out.println("2/6 getDetailWrite success");
	  
	  psmt.setInt(1, seq);
	  
	  rs = psmt.executeQuery();
	  
	  System.out.println("3/6 getDetailWrite success");
	  
	  if(rs.next()) {
			int i = 1;
			dto = new suggestDto(rs.getInt(i++), 
							rs.getString(i++), 
							rs.getInt(i++), 
							rs.getInt(i++), 
							rs.getInt(i++), 
							rs.getString(i++), 
							rs.getString(i++), 
							rs.getString(i++), 
							rs.getInt(i++), 
							rs.getInt(i++));
		}
	  } 
	  catch (Exception e) {
	   e.printStackTrace(); 
	  }finally { 
		   DBClose.close(psmt,conn, rs);
		   } 
	        return dto;
	        }
	 

	public void readcount(int seq) {
		
		String sql = "  UPDATE FIVE_SUGGEST "
				+ "	SET READCOUNT=READCOUNT+1 "
				+ " WHERE SEQ=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readcount success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);			
			System.out.println("2/6 readcount success");
			
			psmt.executeUpdate();
			System.out.println("3/6 readcount success");
			
		} catch (Exception e) {
			System.out.println("readcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}

		
	}
	
	public boolean answer(int seq, suggestDto bbs) {
		// update
				String sql1 = " UPDATE FIVE_SUGGEST "
							+ " SET STEP=STEP+1 "
							+ " WHERE REF = (SELECT REF FROM BBS WHERE SEQ=? ) "
							+ " 	AND STEP > (SELECT STEP FROM BBS WHERE SEQ=? ) ";
				
				// insert
				String sql2 = " INSERT INTO FIVE_SUGGEST "
							+ " (SEQ, ID, "
							+ " REF, STEP, DEPTH, "
							+ " TITLE, CONTENT, WDATE, DEL, READCOUNT) "
							+ " VALUES(SEQ_FIVE_SUGGEST.NEXTVAL, ?, "
							+ "		(SELECT REF FROM FIVE_SUGGEST WHERE SEQ=?), "
							+ "		(SELECT STEP FROM FIVE_SUGGEST WHERE SEQ=?) + 1, "
							+ "     (SELECT DEPTH FROM FIVE_SUGGEST WHERE SEQ=?) + 1, "
							+ "		?, ?, SYSDATE, 0, 0) ";
				
				Connection conn = null;
				PreparedStatement psmt = null;
				
				int count = 0;
				
				try {
					conn = DBConnection.getConnection();
					conn.setAutoCommit(false);
					System.out.println("1/6 answer success");
					
					// update
					psmt = conn.prepareStatement(sql1);
					psmt.setInt(1, seq);
					psmt.setInt(2, seq);
					System.out.println("2/6 answer success");
					
					count = psmt.executeUpdate();
					System.out.println("3/6 answer success");
					
					// psmt 초기화
					psmt.clearParameters();
					
					// insert
					psmt = conn.prepareStatement(sql2);
					psmt.setString(1, bbs.getId());
					psmt.setInt(2, seq);
					psmt.setInt(3, seq);
					psmt.setInt(4, seq);
					psmt.setString(5, bbs.getTitle());
					psmt.setString(6, bbs.getContent());
					System.out.println("4/6 answer success");
					
					count = psmt.executeUpdate();
					System.out.println("5/6 answer success");
					
					conn.commit();
					
				} catch (Exception e) {			
					e.printStackTrace();			
					try {
						conn.rollback();
					} catch (Exception e1) {				
						e1.printStackTrace();
					}
				} finally {			
					try {
						conn.setAutoCommit(true);
					} catch (Exception e) {				
						e.printStackTrace();
					}
					DBClose.close(psmt, conn, null);
					System.out.println("6/6 answer success");
				}
				return count>0?true:false;
			}
	
	public boolean deletebbs(int seq) {
		
		String sql = " UPDATE FIVE_SUGGEST "
				     + " SET DEL=DEL+1 "
				     + " WHERE REF=? ";		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 deletebbs success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
		
			System.out.println("2/6 deletebbs success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 deletebbs success");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
			System.out.println("4/6 deletebbs success");
		}
		
		
		return count>0?true:false;
	}
	public List<suggestDto> getBbsList(String option, String select) {
		int co = 0;
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, " 
		               + " TITLE, CONTENT, WDATE, " + " DEL, READCOUNT "
				       + " FROM FIVE_SUGGEST ";
		String sqlword= "";
		if(option.equals("all")) {
			
		 sqlword =  " WHERE ID LIKE ? "
					+ " OR TITLE LIKE ? "
					+ " OR CONTENT LIKE ? " ;
			
			co = 1;
		}
		 if(option.equals("id")) {
			
			 sqlword = " WHERE ID LIKE ? ";
		}
		else if(option.equals("title")) {
			
			sqlword = " WHERE TITLE LIKE ? ";		
		}else if(option.equals("content")) {
			
			sqlword =  " WHERE CONTENT LIKE ? ";
		}
		 
		sql = sql + sqlword;
		sql += " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<suggestDto> list = new ArrayList<suggestDto>();
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList success");

			
			psmt = conn.prepareStatement(sql);
			
			if(co==1) {
				psmt.setString(1, "%"+select.trim()+"%");
				psmt.setString(2, "%"+select.trim()+"%");
				psmt.setString(3, "%"+select.trim()+"%");
			
			}else {
			
				psmt.setString(1, "%"+select.trim()+"%");
				
			}
			System.out.println("2/6 getBbsList success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList success");

			while (rs.next()) {
				int i = 1;
				suggestDto dto = new suggestDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),
						rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getInt(i++));
				list.add(dto);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
      public void suggestUpdate(String title, String content, int seq) {
		
		String sql = " UPDATE FIVE_SUGGEST "
				+ "	SET TITLE=? , CONTENT=?, WDATE=SYSDATE"
				+ " WHERE SEQ=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readcount success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			System.out.println("2/6 readcount success");
			
			psmt.executeUpdate();
			System.out.println("3/6 readcount success");
			
		} catch (Exception e) {
			System.out.println("readcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}
	}
      
      //글의 갯수
      public int getALllBbs(String option, String select) {
		
    	  int co = 0;
    	  
  		  String sql = " SELECT COUNT(*) "
				        + " FROM FIVE_SUGGEST ";
  		  
    		String sqlword= "";
      		if(option.equals("all")) {
      			
      		 sqlword =  " WHERE DEL = 0 "
      		 		    + " AND ID LIKE ? "
      					+ " OR TITLE LIKE ? "
      					+ " OR CONTENT LIKE ? " ;
      			
      			co = 1;
      		}
      		 if(option.equals("id")) {
      			
      			 sqlword = " WHERE ID LIKE ? AND DEL=0 ";
      		}
      		else if(option.equals("title")) {
      			
      			sqlword = " WHERE TITLE LIKE ? AND DEL=0 ";		
      		}else if(option.equals("content")) {
      			
      			sqlword =  " WHERE CONTENT LIKE ? AND DEL=0 ";
      		}
      		 
      		sql = sql + sqlword;
      		
      		
    		Connection conn = null;
    		PreparedStatement psmt = null;
    		ResultSet rs = null;
    		
    	int len = 0;
    	
    	
    	try {
    		conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			if(co==1) {
  				psmt.setString(1, "%"+select.trim()+"%");
  				psmt.setString(2, "%"+select.trim()+"%");
  				psmt.setString(3, "%"+select.trim()+"%");

  			
  			}else {
  			
  				psmt.setString(1, "%"+select.trim()+"%");
  				
  			}
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				len = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
    	return len;
	}
      
      
      
      
      public List<suggestDto> getSuggestList(String option, String select, int page) {
		
    	  int co = 0;
    	  
    		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, " 
		               + " TITLE, CONTENT, WDATE, " 
				       + " DEL, READCOUNT "
				       + " FROM ";
    		
    		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM, " + 
    				"	SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT " + 
    				" FROM FIVE_SUGGEST ";
    	
  		String sqlword= "";
  		if(option.equals("all")) {
  			
  		 sqlword =  " WHERE DEL = 0 "
  		 		    + " AND ID LIKE ? "
  					+ " OR TITLE LIKE ? "
  					+ " OR CONTENT LIKE ? " ;
  			
  			co = 1;
  		}
  		 if(option.equals("id")) {
  			
  			 sqlword = " WHERE ID LIKE ? AND DEL=0 ";
  		}
  		else if(option.equals("title")) {
  			
  			sqlword = " WHERE TITLE LIKE ? AND DEL=0 ";		
  		}else if(option.equals("content")) {
  			
  			sqlword =  " WHERE CONTENT LIKE ? AND DEL=0 ";
  		}
  		 
  		sql = sql + sqlword;
  		sql += " ORDER BY REF DESC, STEP ASC) ";
  		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
  		
  		int start, end;
  		start = 1 + 10 * page;  // 시작 글의 번호
  		end = 10 + 10 * page;   // 끝 글의 번호
    	  
    	  
  		Connection conn = null;
  		PreparedStatement psmt = null;
  		ResultSet rs = null;

  		List<suggestDto> list = new ArrayList<suggestDto>();
  		try {
  			conn = DBConnection.getConnection();
  			System.out.println("1/6 getBbsList success");

  			
  			psmt = conn.prepareStatement(sql);
  			
  			if(co==1) {
  				psmt.setString(1, "%"+select.trim()+"%");
  				psmt.setString(2, "%"+select.trim()+"%");
  				psmt.setString(3, "%"+select.trim()+"%");
  				psmt.setInt(4, start);
  				psmt.setInt(5, end);
  			
  			}else {
  			
  				psmt.setString(1, "%"+select.trim()+"%");
  				psmt.setInt(2, start);
  				psmt.setInt(3, end);
  				
  			}
  			System.out.println("2/6 getBbsList success");

  			rs = psmt.executeQuery();
  			System.out.println("3/6 getBbsList success");

  			while (rs.next()) {
  				int i = 1;
  				suggestDto dto = new suggestDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),
  						rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),
  						rs.getInt(i++));
  				list.add(dto);
  			}
  			System.out.println("4/6 getBbsList success");
  		} catch (Exception e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		} finally {
  			DBClose.close(psmt, conn, rs);
  		}
  		return list;
  	}
}

















