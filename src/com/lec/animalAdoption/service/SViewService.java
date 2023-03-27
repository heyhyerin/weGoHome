package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.ShelterDao;
import com.lec.animalAdoption.dto.ShelterDto;

public class SViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("sid");
		
		ShelterDao aDao = ShelterDao.getInstance();
		ShelterDto shelter = aDao.getShelter(sid);
		
		request.setAttribute("shelter", shelter);

	}

}
