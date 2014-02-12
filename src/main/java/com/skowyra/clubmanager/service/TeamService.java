package com.skowyra.clubmanager.service;

import java.util.List;

import com.skowyra.clubmanager.model.Team;

public interface TeamService {

	public Team getTeam(Long teamId);
	public void addOrUpdateTeam(Team team);
	public void addOrUpdateTeam(Team team, Long coachId);
	public void deleteTeam(Long team);
	public List<Team> listTeam();
	
}
