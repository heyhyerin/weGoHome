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

import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dao.ReviewBoardDao;
import com.lec.animalAdoption.dto.AnimalDto;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ReviewBoardDto;
import com.lec.animalAdoption.dto.ShelterDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("animalImgUp");
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
			
			ShelterDto shelter = (ShelterDto) httpsession.getAttribute("shelter"); 
			String sid = null;
			
			if (shelter != null) {
				sid = shelter.getSid();
				String aphoto = filename != null ? filename : "noimg.png";
				String abreed = mRequest.getParameter("abreed");
				String agender = mRequest.getParameter("agender");
				int aage = Integer.parseInt(mRequest.getParameter("aage"));
				int aweight = Integer.parseInt(mRequest.getParameter("aweight"));
				String acontent = mRequest.getParameter("acontent");
				String aaddress = mRequest.getParameter("aaddress");
				String aip = request.getLocalAddr();
				
				AnimalDao aDao = AnimalDao.getInstance();
				AnimalDto animal = new AnimalDto(0, sid, aphoto, abreed, agender, aage, aweight, acontent, aaddress, null, null, aip, null, null, null, null, 0);
				result = aDao.writeAnimal(animal);
			}
			
			if (result == ReviewBoardDao.SUCCESS) {
				request.setAttribute("resultMsg", "입양 공고 작성이 완료되었습니다.");
			} else if (result == ReviewBoardDao.FAIL) {
				request.setAttribute("resultErrorMsg", "입양 공고 작성이 실패했습니다.");
			}
			
		} catch (Exception e) {
			request.setAttribute("resultErrorMsg", "입양 공고 작성이 실패했습니다.");
			System.out.println(e.getMessage());
		}
		
		// 서버에 업로드 된 파일을 소스 폴더로 복사
		if (filename != null && result == ReviewBoardDao.SUCCESS) {
			InputStream is = null;
			OutputStream os = null;
			
			try {
				File serverFile = new File(path + "/" + filename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/project/animalAdopt/animalAdoption/WebContent/animalImgUp/" + filename);
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
