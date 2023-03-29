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

public class RBoardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("reviewBoardUp");
		int maxSize = 1024 * 1024 * 4; // 4MB
		String filename = "";
		String dbfilename = null;
		MultipartRequest mRequest = null;
		int result = 0;
		
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			filename = mRequest.getFilesystemName(param);
			dbfilename = mRequest.getParameter("dbfilename");
			
			// 파일을 수정하지 않은 경우
			if (filename == null) {
				filename = dbfilename;
			}
			
			int rno = Integer.parseInt(mRequest.getParameter("rno"));
			String rtitle = mRequest.getParameter("rtitle");
			String rcontent = mRequest.getParameter("rcontent");
			String rip = request.getLocalAddr();

			ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
			ReviewBoardDto review = new ReviewBoardDto(rno, null, null, rtitle, rcontent, null, filename, null, 0, 0, 0, 0,
					rip, null);
			result = rbDao.modifyReview(review);

			if (result == ReviewBoardDao.SUCCESS) {
				request.setAttribute("resultMsg", "게시글 수정이 완료되었습니다.");
			} else if (result == ReviewBoardDao.FAIL) {
				request.setAttribute("resultErrorMsg", "게시글 수정이 실패했습니다.");
			}
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
			
		} catch (Exception e) {
			request.setAttribute("resultErrorMsg", "게시글 수정이 실패했습니다.");
			System.out.println(e.getMessage());
		}
		
		// 서버에 업로드 된 파일을 소스 폴더로 복사
		if (filename != null && !filename.equals(dbfilename)) {
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
