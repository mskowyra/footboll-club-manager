package com.skowyra.clubmanager.service;

import java.util.List;

import com.skowyra.clubmanager.model.Coach;


public interface CoachService {
	
	public Coach getCoach(Long coachId);
	public void addOrUpdateCoach(Coach coach);
	public void deleteCoach(Long coach);
	public List<Coach> listCoach();
}
