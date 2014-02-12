package com.skowyra.clubmanager.dao;

import java.util.List;

import com.skowyra.clubmanager.model.Coach;


public interface CoachDao {

	public Coach find(Long coachId);
	public void addOrUpdate(Coach coach);
	public void delete(Coach coach);
	public List<Coach> list();
	

}
