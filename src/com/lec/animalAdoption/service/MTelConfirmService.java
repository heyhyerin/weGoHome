package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.MemberDao;

public class MTelConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mtel = request.getParameter("mtel");

		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.telConfirm(mtel);

		if (result == MemberDao.NONEXISTENT) {
			request.setAttribute("mtelConfirmResult", "<b class='green'>사용가능한 전화번호입니다.<b>");
		} else if (result == MemberDao.EXISTENT) {
			request.setAttribute("mtelConfirmResult", "<b class='red'>중복된 전화번호입니다.<b>");
		}

	}

}
