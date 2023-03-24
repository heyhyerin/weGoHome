package com.lec.animalAdoption.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.ReviewBoardDao;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ReviewBoardDto;
import com.lec.animalAdoption.dto.ShelterDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RBoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("reviewBoardUp");
		int maxSize = 1024 * 1024 * 4; // 4MB
		String filename = "";
		MultipartRequest mRequest = null;
		int result = 0;
		
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			filename = mRequest.getFilesystemName(param);
					
			HttpSession httpsession = request.getSession();
			MemberDto member = (MemberDto) httpsession.getAttribute("member");
			ShelterDto shelter = (ShelterDto) httpsession.getAttribute("shelter"); 
			
			if (member != null || shelter != null) {
				String mid = null;
				String sid = null;
				if(member != null && shelter == null) {
					mid = member.getMid();
				}
				if(shelter != null && member == null) {
					sid = shelter.getSid();
				}
				String rtitle = mRequest.getParameter("rtitle");
				String rcontent = mRequest.getParameter("rcontent");
				String rpw = mRequest.getParameter("rpw");
				String rip = request.getLocalAddr();
				
				ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
				ReviewBoardDto review = new ReviewBoardDto(0, mid, sid, rtitle, rcontent, rpw, filename, null, 0, 0, 0, 0, rip, null); 
				result = rbDao.writeReview(review);
			}
			
			if (result == ReviewBoardDao.SUCCESS) {
				request.setAttribute("reviewBoardResult", "게시글 작성이 완료되었습니다.");
			} else if (result == ReviewBoardDao.FAIL) {
				request.setAttribute("reviewBoardResultError", "게시글 작성이 실패했습니다.");
			}
			
		} catch (Exception e) {
			request.setAttribute("reviewBoardResultError", "게시글 작성이 실패했습니다.");
			System.out.println(e.getMessage());
		}
		
		// 서버에 업로드 된 파일을 소스 폴더로 복사
		if (filename != null && result == ReviewBoardDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			
			try {
				File serverFile = new File(path + "/" + filename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/project/animalAdopt/animalAdoption/WebContent/reviewBoardUp/" + filename);
				byte[] bs = new byte[(int) serverFile.length()];
				
				while (true) {
					int readByteCnt = is.read(bs);
					if (readByteCnt == -1)
						break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (os != null)
						os.close();
					if (is != null)
						is.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

}
