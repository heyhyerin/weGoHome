package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.MemberDao;

public class MWithDrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");

		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.withDrawalMember(mid);

		if (result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("resultMsg", "회원 탈퇴가 정상적으로 처리되었습니다. 이용해 주셔서 감사합니다.");
		} else if (result == MemberDao.FAIL) {
			request.setAttribute("resultErrorMsg", "회원 탈퇴가 실패했습니다.");
		}

	}

}
