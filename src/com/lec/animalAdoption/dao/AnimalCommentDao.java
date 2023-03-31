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

import com.lec.animalAdoption.dto.AnimalCommentDto;

public class AnimalCommentDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	private static AnimalCommentDao instance = new AnimalCommentDao();
	
	public static AnimalCommentDao getInstance() {
		return instance;
	}
	
	private AnimalCommentDao() {
		
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

	// 1. 댓글 출력
	public ArrayList<AnimalCommentDto> getCommentList(int ano){
		ArrayList<AnimalCommentDto> commentList = new ArrayList<AnimalCommentDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT AC.*," + 
					"  (SELECT MNAME FROM MEMBER WHERE AC.MID = MID) ||" + 
					"  (SELECT SNAME FROM SHELTER WHERE AC.SID = SID) WRITERNAME" + 
					"   FROM ANIMALCOMMENT AC" + 
					"   WHERE AC.ANO = ?" + 
					"   ORDER BY ACGROUP DESC, ACSTEP";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int acno = rs.getInt("acno");
				String mid = rs.getString("mid");
				String sid = rs.getString("sid");
				String accontent = rs.getString("accontent");
				Timestamp acrdate = rs.getTimestamp("acrdate");
				int acgroup = rs.getInt("acgroup");
				int acstep = rs.getInt("acstep");
				String acip = rs.getString("acip");
				// member
				String name = rs.getString("writername");
				commentList.add(new AnimalCommentDto(acno, ano, mid, sid, accontent, acrdate, acgroup, acstep, acip, name));
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
		return commentList;
	}
	
	// 2. 댓글 작성
	public int writeComment(AnimalCommentDto comment) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ANIMALCOMMENT (ACNO, ANO, MID, SID, ACCONTENT, ACRDATE, ACGROUP, ACSTEP, ACIP)" + 
					 "    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, ?, ?, ?, ?, " + 
					 "            SYSDATE, ANIMALCOMMENT_ACNO_SEQ.CURRVAL , 0, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getAno());
			pstmt.setString(2, comment.getMid());
			pstmt.setString(3, comment.getSid());
			pstmt.setString(4, comment.getAccontent());
			pstmt.setString(5, comment.getAcip());
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
	
	// 3-1. 해당 댓글 정보 가져오기
	public AnimalCommentDto getComment(int acno) {
		AnimalCommentDto comment = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT AC.*," + 
					"    (SELECT MNAME FROM MEMBER WHERE AC.MID = MID) ||" + 
					"    (SELECT SNAME FROM SHELTER WHERE AC.SID = SID) WRITERNAME" + 
					"    FROM ANIMALCOMMENT AC" + 
					"    WHERE ACNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, acno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int ano = rs.getInt("ano");
				String mid = rs.getString("mid");
				String sid = rs.getString("sid");
				String accontent = rs.getString("accontent");
				Timestamp acrdate = rs.getTimestamp("acrdate");
				int acgroup = rs.getInt("acgroup");
				int acstep = rs.getInt("acstep");
				String acip = rs.getString("acip");
				// member
				String name = rs.getString("writername");
				comment = new AnimalCommentDto(acno, ano, mid, sid, accontent, acrdate, acgroup, acstep, acip, name);
			}
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
		return comment;		
	}
	
	
	// 3-2. 댓글 수정
	public int modifyComment(AnimalCommentDto comment) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE ANIMALCOMMENT SET" + 
				"        ACCONTENT = ?," + 
				"        ACIP = ?" + 
				"    WHERE ACNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getAccontent());
			pstmt.setString(2, comment.getAcip());
			pstmt.setInt(3, comment.getAcno());
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
	
	// 4. 댓글 삭제
	public int deleteComment(int acno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "DELETE FROM ANIMALCOMMENT" + 
					 "    WHERE ACNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, acno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = SUCCESS;
			}
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
	
	// 5. 답글 작성
	// 5-1. STEP1 답변글 작성 전 작업
	private void commentReplyStep(int acgroup, int acstep) {
		Connection conn = null;	
		PreparedStatement pstmt = null;
		String sql = "UPDATE ANIMALCOMMENT SET ACSTEP = ACSTEP +1" + 
				"    WHERE ACGROUP = ?" + 
				"      AND ACSTEP > ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, acgroup);
			pstmt.setInt(2, acstep);
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
	
	// 5-2. STEP2 답글 작성
	public int replyComment(AnimalCommentDto comment) {
		commentReplyStep(comment.getAcgroup(), comment.getAcstep());
		int result = FAIL;
		Connection conn = null;	
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ANIMALCOMMENT (ACNO, ANO, MID, SID, ACCONTENT, ACRDATE, ACGROUP, ACSTEP, ACIP)" + 
				"    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, ?, null, ?," + 
				"           ?, SYSDATE, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getAno());
			pstmt.setString(2, comment.getSid());
			pstmt.setString(3, comment.getAccontent());
			pstmt.setInt(4, comment.getAcgroup());
			pstmt.setInt(5, comment.getAcstep() + 1);
			pstmt.setString(6, comment.getAcip());
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

} // AnimalCommentDao
