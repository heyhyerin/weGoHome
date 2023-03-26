package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dto.AnimalDto;

public class AContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		AnimalDao aDao = AnimalDao.getInstance();
		AnimalDto animal = aDao.getAnimal(ano);
		
		request.setAttribute("animal", animal);
	}

}
