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

import com.lec.animalAdoption.dto.AnimalDto;

public class AnimalDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	
	private static AnimalDao instance = new AnimalDao();
	
	public static AnimalDao getInstance() {
		return instance;
	}
	
	private AnimalDao() {
		
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
	
	// 1. 보호동물 목록 출력
	public ArrayList<AnimalDto> getAnimalList(int startRow, int endRow){
		ArrayList<AnimalDto> animalList = new ArrayList<AnimalDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*" + 
				"         FROM(SELECT ANIMAL.*, SNAME FROM ANIMAL, SHELTER" + 
				"            WHERE ANIMAL.SID = SHELTER.SID" + 
				"            ORDER BY ARDATE DESC)ANIMALlIST)" + 
				"         WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// animal
				int ano = rs.getInt("ano");
				String sid = rs.getString("sid");
				String aphoto = rs.getString("aphoto");
				String abreed = rs.getString("abreed");
				String agender = rs.getString("agender");
				int aage = rs.getInt("aage");
				int aweight = rs.getInt("aweight");
				String acontent = rs.getString("acontent");
				String aaddress = rs.getString("aaddress");
				Timestamp ardate = rs.getTimestamp("ardate");
				String aAdopt = rs.getString("aAdopt");
				String aip = rs.getString("aip");

				// shelter
				String sname = rs.getString("sname");
				/* String stel = rs.getString("stel");
				String semail = rs.getString("semail");
				String saddress = rs.getString("saddress"); */
				animalList.add(new AnimalDto(ano, sid, aphoto, abreed, agender, aage, aweight, acontent, aaddress,
						ardate, aAdopt, aip, sname, null, null, null));
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
		return animalList;
	}
	
	// 2. 등록된 전체 동물 수 조회
	public int getAnimalTotCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) CNT FROM ANIMAL";
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
	
	// 3. 공고 게시글 작성
	public int writeAnimal(AnimalDto animal) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, AAGE, AWEIGHT, ACONTENT," + 
					 "                   AADDRESS, AADOPT, AIP)" + 
					 "    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, ?, ?, ?, ?," + 
					 "            ?, ?, ?, ?, 'PROTECT', ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animal.getSid());
			pstmt.setString(2, animal.getAphoto());
			pstmt.setString(3, animal.getAbreed());
			pstmt.setString(4, animal.getAgender());
			pstmt.setInt(5, animal.getAage());
			pstmt.setInt(6, animal.getAweight());
			pstmt.setString(7, animal.getAcontent());
			pstmt.setString(8, animal.getAaddress());
			pstmt.setString(9, animal.getAip());
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
	
	// 4. 게시글 상세보기
	public AnimalDto getAnimal(int ano) {
		AnimalDto animal = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT A.*,SNAME, STEL, SEMAIL, SADDRESS" + 
					 "    FROM ANIMAL A, SHELTER S" + 
					 "    WHERE A.SID = S.SID AND ANO = ?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs    = pstmt.executeQuery();
			if(rs.next()) {
				// animal
				// int ano = rs.getInt("ano");
				String sid = rs.getString("sid");
				String aphoto = rs.getString("aphoto");
				String abreed = rs.getString("abreed");
				String agender = rs.getString("agender");
				int aage = rs.getInt("aage");
				int aweight = rs.getInt("aweight");
				String acontent = rs.getString("acontent");
				String aaddress = rs.getString("aaddress");
				Timestamp ardate = rs.getTimestamp("ardate");
				String aadopt = rs.getString("aadopt");
				String aip = rs.getString("aip");

				// shelter
				String sname = rs.getString("sname");
				String stel = rs.getString("stel");
				String semail = rs.getString("semail");
				String saddress = rs.getString("saddress");
				animal = new AnimalDto(ano, sid, aphoto, abreed, agender, aage, aweight, acontent, aaddress, ardate,
						aadopt, aip, sname, stel, semail, saddress);
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
		return animal;
	}
	
	// 5. 게시글 수정
	public int modifyAnimal(AnimalDto animal) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE ANIMAL SET" + 
				"        APHOTO = ?," + 
				"        ABREED = ?," + 
				"        AGENDER = ?," + 
				"        AAGE = ?," + 
				"        AWEIGHT = ?," + 
				"        ACONTENT = ?," + 
				"        AADDRESS = ?," + 
				"        ARDATE = SYSDATE," + 
				"        AADOPT = ?," + 
				"        AIP = ?" + 
				"    WHERE ANO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animal.getAphoto());
			pstmt.setString(2, animal.getAbreed());
			pstmt.setString(3, animal.getAgender());
			pstmt.setInt(4, animal.getAage());
			pstmt.setInt(5, animal.getAweight());
			pstmt.setString(6, animal.getAcontent());
			pstmt.setString(7, animal.getAaddress());
			pstmt.setString(8, animal.getAadopt());
			pstmt.setString(9, animal.getAip());
			pstmt.setInt(10, animal.getAno());
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
	
	// 6. 게시글 삭제
	// 6-1. 해당회원의 관심동물 목록 삭제
	public void deleteAnimalLikeList(int ano) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM LIKELIST" + 
					 "    WHERE ANO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			pstmt.executeQuery();
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
	}
	
	// 6-2. 해당회원의 작성 댓글 삭제
	public void deleteAnimalComment(int ano) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "DELETE FROM ANIMALCOMMENT" + 
					 "    WHERE ANO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			pstmt.executeQuery();
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
	}
	
	// 6-3. 해당동물 삭제
		public int deleteAnimal(int ano) {
			deleteAnimalLikeList(ano);
			deleteAnimalComment(ano);
			
			int result = FAIL;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "DELETE FROM ANIMAL" + 
						 "    WHERE ANO = ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ano);
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
		
		// 7. 상세검색(종류, 성별, 나이, 크기)
		public ArrayList<AnimalDto> searchAnimal(String schAbreed, String schAgender, 
				int schRowAweight, int schHighAweight, String schSname, int startRow, int endRow){
			ArrayList<AnimalDto> list = new ArrayList<AnimalDto>();
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.*" + 
					"         FROM(SELECT ANIMAL.*, SNAME" + 
					"            FROM ANIMAL, SHELTER" + 
					"            WHERE ANIMAL.SID = SHELTER.SID" + 
					"              AND ABREED LIKE '%' || ? || '%' " + 
					"              AND AGENDER LIKE '%'|| ? || '%' " + 
					"              AND AWEIGHT BETWEEN ? AND ?" + 
					"              AND SNAME LIKE '%'|| ? || '%'" + 
					"            ORDER BY ARDATE DESC)ANIMALlIST)" + 
					"         WHERE RN BETWEEN ? AND ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, schAbreed);
				pstmt.setString(2, schAgender);
				pstmt.setInt(3, schRowAweight);
				pstmt.setInt(4, schHighAweight);
				pstmt.setString(5, schSname);
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					// animal
					int ano = rs.getInt("ano");
					String sid = rs.getString("sid");
					String aphoto = rs.getString("aphoto");
					String abreed = rs.getString("abreed");
					String agender = rs.getString("agender");
					int aage = rs.getInt("aage");
					int aweight = rs.getInt("aweight");
					String acontent = rs.getString("acontent");
					String aaddress = rs.getString("aaddress");
					Timestamp ardate = rs.getTimestamp("ardate");
					String aadopt = rs.getString("aadopt");
					String aip = rs.getString("aip");

					// shelter
					String sname = rs.getString("sname");
					list.add(new AnimalDto(ano, sid, aphoto, abreed, agender, aage, aweight, acontent, aaddress,
							ardate, aadopt, aip, sname, null, null, null));
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
			return list;
		}
		
		// 8. 나의 관심동물 조회
		public ArrayList<AnimalDto> getLikeList(String mid, int startRow, int endRow){
			ArrayList<AnimalDto> list = new ArrayList<AnimalDto>();
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM(SELECT ROWNUM RN, ANIMALlIST.* " + 
					"         FROM(SELECT ANIMAL.*, SNAME " + 
					"            FROM ANIMAL, SHELTER, LIKELIST " + 
					"            WHERE ANIMAL.SID = SHELTER.SID " + 
					"              AND LIKELIST.ANO = ANIMAL.ANO " + 
					"              AND LIKELIST.MID = ? " + 
					"            ORDER BY LNO DESC)ANIMALlIST) " + 
					"         WHERE RN BETWEEN ? AND ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					// animal
					int ano = rs.getInt("ano");
					String sid = rs.getString("sid");
					String aphoto = rs.getString("aphoto");
					String abreed = rs.getString("abreed");
					String agender = rs.getString("agender");
					int aage = rs.getInt("aage");
					int aweight = rs.getInt("aweight");
					String acontent = rs.getString("acontent");
					String aaddress = rs.getString("aaddress");
					Timestamp ardate = rs.getTimestamp("ardate");
					String aadopt = rs.getString("aadopt");
					String aip = rs.getString("aip");

					// shelter
					String sname = rs.getString("sname");
					list.add(new AnimalDto(ano, sid, aphoto, abreed, agender, aage, aweight, acontent, aaddress,
							ardate, aadopt, aip, sname, null, null, null));
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
			return list;
		}
		
} // AnimalDao
