package com.lec.animalAdoption.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dao.ShelterDao;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ShelterDto;

public class SModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String oldspw = request.getParameter("oldspw");
		String spw = request.getParameter("spw");
		if(spw.equals("")) {
			spw = oldspw;
		}
		String stel = request.getParameter("stel");
		String semail = request.getParameter("semail");
		String saddress = request.getParameter("saddress");
		
		ShelterDao sDao = ShelterDao.getInstance();
		ShelterDto shelter = new ShelterDto(sid, spw, sname, stel, semail, saddress);
		
		int result = sDao.modifyShelter(shelter);
		if (result == ShelterDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("shelter", shelter);
			session.setAttribute("resultMsg", "정보수정이 완료되었습니다.");
		} else if (result == MemberDao.FAIL) {
			request.setAttribute("resultErrorMsg", "정보수정이 실패했습니다.");
		}
		
	}

}
