package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dao.ReviewBoardDao;

public class ADeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		AnimalDao aDao = AnimalDao.getInstance();
		int result = aDao.deleteAnimal(ano);
		
		if (result == AnimalDao.SUCCESS) {
			request.setAttribute("resultMsg", "게시글 삭제가 정상적으로 처리되었습니다.");
		} else if (result == AnimalDao.FAIL) {
			request.setAttribute("resultErrorMsg", "게시글 삭제가 실패했습니다.");
		}

	}

}
