package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dao.ShelterDao;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ShelterDto;

public class SLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("sid");
		String spw = request.getParameter("spw");
		
		ShelterDao sDao = ShelterDao.getInstance();
		int result = sDao.loginShelter(sid, spw);
		
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			ShelterDto shelter = sDao.getShelter(sid);
			session.setAttribute("shelter", shelter);
		} else if(result == MemberDao.FAIL) {
			request.setAttribute("loginErrorMsg", "아이디 또는 비밀번호를 확인하세요.");
		}

	}

}
