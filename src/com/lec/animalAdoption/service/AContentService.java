package com.lec.animalAdoption.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;
import com.lec.animalAdoption.dto.AnimalDto;

public class AContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		AnimalDao aDao = AnimalDao.getInstance();
		AnimalDto animal = aDao.getAnimal(ano);

		// 문의 댓글 출력
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		ArrayList<AnimalCommentDto> commentList = acDao.getCommentList(ano);
		
		request.setAttribute("animal", animal);
		request.setAttribute("commentList", commentList);
	}

}
