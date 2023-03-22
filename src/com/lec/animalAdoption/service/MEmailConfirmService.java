package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.MemberDao;

public class MEmailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");

		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.emailConfirm(memail);

		if (result == MemberDao.NONEXISTENT) {
			request.setAttribute("memailConfirmResult", "<b class='green'>사용가능한 이메일입니다.<b>");
		} else if (result == MemberDao.EXISTENT) {
			request.setAttribute("memailConfirmResult", "<b class='red'>중복된 이메일입니다.<b>");
		}


	}

}
