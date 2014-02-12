package com.skowyra.clubmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skowyra.clubmanager.dao.CoachDao;
import com.skowyra.clubmanager.model.Coach;


@Service("coachService")
public class CoachServiceImpl implements CoachService{

	private CoachDao coachDao;
	
	@Autowired
	public CoachServiceImpl(CoachDao coachDao) {
		this.coachDao = coachDao;
	}
	
	@Transactional(readOnly=true)
	public Coach getCoach(Long coachId) {
		return coachDao.find(coachId);
	}

	@Transactional(readOnly = false)
	public void addOrUpdateCoach(Coach coach) {
		coachDao.addOrUpdate(coach);
		
	}
	@Transactional(readOnly = false)
	public void deleteCoach(Long coachId) {
		Coach coach = coachDao.find(coachId);
		coachDao.delete(coach);
		
	}
	@Transactional(readOnly=true)
	public List<Coach> listCoach() {
		return coachDao.list();
	}

}
