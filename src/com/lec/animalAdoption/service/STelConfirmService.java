package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dao.ShelterDao;

public class STelConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String stel = request.getParameter("stel");
		
		ShelterDao sDao = ShelterDao.getInstance();
		int result = sDao.telConfirm(stel);
		
		if (result == MemberDao.NONEXISTENT) {
			request.setAttribute("stelConfirmResult", "<b class='green'>사용가능한 전화번호입니다.<b>");
		} else if (result == MemberDao.EXISTENT) {
			request.setAttribute("stelConfirmResult", "<b class='red'>중복된 전화번호입니다.<b>");
		}
		
	}

}
