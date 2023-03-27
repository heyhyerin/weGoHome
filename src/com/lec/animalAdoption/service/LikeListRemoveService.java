package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.LikeListDao;
import com.lec.animalAdoption.dto.LikeListDto;

public class LikeListRemoveService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		LikeListDao lLDao = LikeListDao.getInstance();
		LikeListDto likeList = new LikeListDto(0, mid, ano);
		
		int result = lLDao.removeLikeList(mid, ano);

	}

}
