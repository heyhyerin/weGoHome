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
		String sql = "SELECT A.* , MNAME" + 
					 "    FROM ANIMALCOMMENT A, MEMBER" + 
					 "    WHERE A.MID = MEMBER.MID AND ANO = ?" + 
					 "    ORDER BY ACNO DESC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int acno = rs.getInt("acno");
				String mid = rs.getString("mid");
				String accontent = rs.getString("accontent");
				Timestamp acrdate = rs.getTimestamp("acrdate");
				String acip = rs.getString("acip");
				commentList.add(new AnimalCommentDto(acno, mid, ano, accontent, acrdate, acip));
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
		String sql = "INSERT INTO ANIMALCOMMENT (ACNO, MID, ANO, ACCONTENT, ACRDATE, ACIP)" + 
					 "    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getMid());
			pstmt.setInt(2, comment.getAno());
			pstmt.setString(3, comment.getAccontent());
			pstmt.setString(4, comment.getAcip());
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
		String sql = "SELECT * FROM ANIMALCOMMENT" + 
				"    WHERE ACNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, acno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mid = rs.getString("mid");
				int ano = rs.getInt("ano");
				String accontent = rs.getString("accontent");
				Timestamp acrdate = rs.getTimestamp("acrdate");
				String acip = rs.getString("acip");
				comment = new AnimalCommentDto(acno, mid, ano, accontent, acrdate, acip);
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
	
} // AnimalCommentDao
