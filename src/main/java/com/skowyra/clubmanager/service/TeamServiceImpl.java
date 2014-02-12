package com.skowyra.clubmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skowyra.clubmanager.dao.CoachDao;
import com.skowyra.clubmanager.dao.TeamDao;
import com.skowyra.clubmanager.model.Coach;
import com.skowyra.clubmanager.model.Team;


@Service("teamService")
public class TeamServiceImpl implements TeamService {
	
private CoachDao coachDao;	
private TeamDao teamDao;
	
	@Autowired
	public TeamServiceImpl(TeamDao teamDao, CoachDao coachDao) {
		this.teamDao = teamDao;
		this.coachDao = coachDao;
	}
	

	@Transactional(readOnly=true)
	public Team getTeam(Long teamId) {
		return teamDao.find(teamId);
	}

	
	@Transactional(readOnly = false)
	public void addOrUpdateTeam(Team team) {
		teamDao.addOrUpdate(team);
	}
	
	@Transactional(readOnly = false)
	public void addOrUpdateTeam(Team team, Long coachId) {
		if (coachId == 0) teamDao.addOrUpdate(team);
	       else 	{Coach coach = coachDao.find(coachId);
	                team.setCoach(coach);
	                teamDao.addOrUpdate(team);
	        }
	}

	
	@Transactional(readOnly = false)
	public void deleteTeam(Long teamId) {
		Team team = teamDao.find(teamId);
		teamDao.delete(team);
	}

	
	@Transactional(readOnly=true)
	public List<Team> listTeam() {
		return teamDao.list();
	}


	

}
