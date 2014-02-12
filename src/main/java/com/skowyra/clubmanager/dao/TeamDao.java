package com.skowyra.clubmanager.dao;

import java.util.List;

import com.skowyra.clubmanager.model.Team;


public interface TeamDao {

	public Team find(Long teamId);
	public void addOrUpdate(Team team);
	public void delete(Team team);
	public List<Team> list();
	
}
