package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dao.ShelterDao;

public class SEmailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String semail = request.getParameter("semail");

		ShelterDao sDao = ShelterDao.getInstance();
		int result = sDao.emailConfirm(semail);

		if (result == MemberDao.NONEXISTENT) {
			request.setAttribute("semailConfirmResult", "<b class='green'>사용가능한 이메일입니다.<b>");
		} else if (result == MemberDao.EXISTENT) {
			request.setAttribute("semailConfirmResult", "<b class='red'>중복된 이메일입니다.<b>");
		}

	}

}
