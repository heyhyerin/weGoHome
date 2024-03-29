package com.lec.animalAdoption.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.animalAdoption.dto.ReviewBoardDto;

public class ReviewBoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	private static ReviewBoardDao instance = new ReviewBoardDao();
	
	public static ReviewBoardDao getInstance() {
		return instance;
	}
	
	private ReviewBoardDao() {
		
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	// 1. 후기게시판 글 목록 출력  --------------------------------------------------
	// 1-1. 등록 순 정렬
	public ArrayList<ReviewBoardDto> getReviewList(int startRow, int endRow){
		ArrayList<ReviewBoardDto> reviewList = new ArrayList<ReviewBoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT L.*," + 
				"        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || " + 
				"        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME " + 
				"        FROM (SELECT ROWNUM RN, RBOARD.* " + 
				"            FROM(SELECT * FROM REVIEWBOARD " + 
				"            ORDER BY RGROUP DESC, RSTEP) RBOARD) L" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String mid = rs.getString("mid");
				String sid = rs.getString("sid");
				String rtitle = rs.getString("rtitle");
				String rcontent = rs.getString("rcontent");
				String rpw = rs.getString("rpw");
				String rphoto = rs.getString("rphoto");
				Timestamp rrdate = rs.getTimestamp("rrdate");
				int rhit = rs.getInt("rhit");
				int rgroup = rs.getInt("rgroup");
				int rstep = rs.getInt("rstep");
				int rindent = rs.getInt("rindent");
				String rip = rs.getString("rip");
				// member
				String name = rs.getString("writername");
				reviewList.add(new ReviewBoardDto(rno, mid, sid, rtitle, rcontent, rpw, rphoto, rrdate, rhit, rgroup,
						rstep, rindent, rip, name));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return reviewList;
	}
	
	// 1-2. 인기순 정렬(hit수)
	public ArrayList<ReviewBoardDto> getReviewListHit(int startRow, int endRow){
		ArrayList<ReviewBoardDto> reviewList = new ArrayList<ReviewBoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT L.*,\r\n" + 
				"        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || " + 
				"        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME " + 
				"        FROM (SELECT ROWNUM RN, RBOARD.* " + 
				"            FROM(SELECT * FROM REVIEWBOARD " + 
				"            ORDER BY RHIT DESC,RGROUP DESC, RSTEP) RBOARD) L" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String mid = rs.getString("mid");
				String sid = rs.getString("sid");
				String rtitle = rs.getString("rtitle");
				String rcontent = rs.getString("rcontent");
				String rpw = rs.getString("rpw");
				String rphoto = rs.getString("rphoto");
				Timestamp rrdate = rs.getTimestamp("rrdate");
				int rhit = rs.getInt("rhit");
				int rgroup = rs.getInt("rgroup");
				int rstep = rs.getInt("rstep");
				int rindent = rs.getInt("rindent");
				String rip = rs.getString("rip");

				// member
				String name = rs.getString("writername");
				reviewList.add(new ReviewBoardDto(rno, mid, sid, rtitle, rcontent, rpw, rphoto, rrdate, rhit, rgroup,
						rstep, rindent, rip, name));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return reviewList;
	}
	
	// 1-3. 등록된 총 글 갯수 조회  --------------------------------------------------
	public int getReviewTotCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM REVIEWBOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt("cnt");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return totCnt;
	}
	
	// 2-1. 게시글 검색
		public ArrayList<ReviewBoardDto> searchReviewList(String schStr, int startRow, int endRow){
			ArrayList<ReviewBoardDto> reviewList = new ArrayList<ReviewBoardDto>();
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT L.*," + 
					"        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) || " + 
					"        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) NAME" + 
					"        FROM (SELECT ROWNUM RN, RBOARD.*" + 
					"            FROM(SELECT * FROM REVIEWBOARD " + 
					"                 WHERE RTITLE LIKE '%' || ? || '%'" + 
					"                 ORDER BY RGROUP DESC, RSTEP) RBOARD) L" + 
					"    WHERE RN BETWEEN ? AND ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, schStr);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int rno = rs.getInt("rno");
					String mid = rs.getString("mid");
					String sid = rs.getString("sid");
					String rtitle = rs.getString("rtitle");
					String rcontent = rs.getString("rcontent");
					String rpw = rs.getString("rpw");
					String rphoto = rs.getString("rphoto");
					Timestamp rrdate = rs.getTimestamp("rrdate");
					int rhit = rs.getInt("rhit");
					int rgroup = rs.getInt("rgroup");
					int rstep = rs.getInt("rstep");
					int rindent = rs.getInt("rindent");
					String rip = rs.getString("rip");

					// member
					String name = rs.getString("NAME");
					reviewList.add(new ReviewBoardDto(rno, mid, sid, rtitle, rcontent, rpw, rphoto, rrdate, rhit, rgroup,
							rstep, rindent, rip, name));
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			return reviewList;
		}
		
		// 2-2. 검색된 총 글 갯수 조회
			public int getSchReviewTotCnt(String schStr) {
				int totCnt = 0;
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT COUNT(*) CNT "+ 
						"		FROM REVIEWBOARD "+ 
						"		 WHERE RTITLE LIKE '%' || ? || '%'";
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, schStr);
					rs = pstmt.executeQuery();
					rs.next();
					totCnt = rs.getInt("cnt");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
				return totCnt;
			}
	
	// 3. 후기게시판 게시글 작성  --------------------------------------------------
	public int writeReview(ReviewBoardDto review) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REVIEWBOARD" + 
				"    		(RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)" + 
				"		VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, " + 
				"        		SYSDATE, 0, REVIEWBOARD_RNO_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getMid());
			pstmt.setString(2, review.getSid());
			pstmt.setString(3, review.getRtitle());
			pstmt.setString(4, review.getRcontent());
			pstmt.setString(5, review.getRpw());
			pstmt.setString(6, review.getRphoto());
			pstmt.setString(7, review.getRip());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 4. 게시글 상세보기  --------------------------------------------------
	// 4-1. 조회수 1 증가
	private void hitUpBoard(int rno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RHIT = RHIT + 1 WHERE RNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	// 4-2. 상세보기 출력 
	public ReviewBoardDto getReview(int rno) {
		hitUpBoard(rno);
		ReviewBoardDto review = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT L.*," + 
				"        (SELECT MNAME FROM MEMBER WHERE L.MID = MID) ||" + 
				"        (SELECT SNAME FROM SHELTER WHERE L.SID = SID) WRITERNAME" + 
				"    FROM REVIEWBOARD L WHERE RNO = ?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs    = pstmt.executeQuery();
			if(rs.next()) {
				String mid = rs.getString("mid");
				String sid = rs.getString("sid");
				String rtitle = rs.getString("rtitle");
				String rcontent = rs.getString("rcontent");
				String rpw = rs.getString("rpw");
				String rphoto = rs.getString("rphoto");
				Timestamp rrdate = rs.getTimestamp("rrdate");
				int rhit = rs.getInt("rhit");
				int rgroup = rs.getInt("rgroup");
				int rstep = rs.getInt("rstep");
				int rindent = rs.getInt("rindent");
				String rip = rs.getString("rip");
				// member
				String name = rs.getString("WRITERNAME");
				review = new ReviewBoardDto(rno, mid, sid, rtitle, rcontent, rpw, rphoto, rrdate, rhit, rgroup, rstep, rindent, rip, name);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return review;
	}
	
	// 5. 리뷰게시판 게시글 수정  --------------------------------------------------
	public int modifyReview(ReviewBoardDto review) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET" + 
					 "    RTITLE = ?," + 
					 "    RCONTENT = ?," + 
					 "    RPHOTO = ?," + 
					 "    RIP = ?" + 
					 "	WHERE RNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getRtitle());
			pstmt.setString(2, review.getRcontent());
			pstmt.setString(3, review.getRphoto());
			pstmt.setString(4, review.getRip());
			pstmt.setInt(5, review.getRno());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 6. 리뷰게시판 게시글 삭제  --------------------------------------------------
	public int deleteReview(int rno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "DELETE FROM REVIEWBOARD WHERE RNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = SUCCESS;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 7. 답글 작성  --------------------------------------------------
	// 7-1. STEP1 답변글 작성 전 작업
	private void preReplyStep(int rgroup, int rstep) {
		Connection conn = null;	
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RSTEP = RSTEP +1" + 
				"        WHERE RGROUP = ? " + 
				"            AND RSTEP > ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rgroup);
			pstmt.setInt(2, rstep);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}	
	}
	
	// 7-2. STEP2 답변글 작성 
	public int replyReview(ReviewBoardDto review) {
		preReplyStep(review.getRgroup(), review.getRstep());
		int result = FAIL;
		Connection conn = null;	
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REVIEWBOARD" + 
				"        (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)" + 
				"    VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?," + 
				"            SYSDATE, 0, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getMid());
			pstmt.setString(2, review.getSid());
			pstmt.setString(3, review.getRtitle());
			pstmt.setString(4, review.getRcontent());
			pstmt.setString(5, review.getRpw());
			pstmt.setString(6, review.getRphoto());
			pstmt.setInt(7, review.getRgroup());
			pstmt.setInt(8, review.getRstep() + 1);
			pstmt.setInt(9, review.getRindent() + 1);
			pstmt.setString(10, review.getRip());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
		
	}
	
}
