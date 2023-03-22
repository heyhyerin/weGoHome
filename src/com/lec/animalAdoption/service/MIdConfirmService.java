package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.MemberDao;

public class MIdConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");

		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.idConfirm(mid);

		if (result == MemberDao.NONEXISTENT) {
			request.setAttribute("midConfirmResult", "<b class='green'>사용가능한 아이디입니다.<b>");
		} else if (result == MemberDao.EXISTENT) {
			request.setAttribute("midConfirmResult", "<b class='red'>중복된 아이디입니다.<b>");
		}

	}

}
