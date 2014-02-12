package com.skowyra.clubmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

import com.skowyra.clubmanager.dao.PlayerDao;
import com.skowyra.clubmanager.dao.TeamDao;
import com.skowyra.clubmanager.model.Player;
import com.skowyra.clubmanager.model.Team;


@Service("playerService")
//@Transactional(readOnly = true)
public class PlayerServiceImpl implements PlayerService {
	
private PlayerDao playerDao;

private TeamDao teamDao;

	@Autowired
	public PlayerServiceImpl(PlayerDao playerDao, TeamDao teamDao) {
		this.playerDao = playerDao;
		this.teamDao = teamDao;
	}
	

	@Transactional(readOnly=false)
	public Player getPlayer(Long id) {
		return playerDao.find(id);
	}

	
	@Transactional(readOnly = false)
	public void addOrUpdatePlayer(Player player) {
		playerDao.addOrUpdate(player);
	}
	
	
	
	@Transactional(readOnly = false)
	public void addOrUpdatePlayer(Player player, Long teamId) {
	//	Team team = teamDao.find(teamId);
	 //      player.setTeam(team);
	//       playerDao.addOrUpdate(player);
		
		
		
	if (teamId == 0) playerDao.addOrUpdate(player);
       else {
               Team team = teamDao.find(teamId);
                player.setTeam(team);
                playerDao.addOrUpdate(player);
        }
    }
	
	
	
	@Transactional(readOnly = false)
	public void deletePlayer(Long id) {
		Player player = playerDao.find(id);
		playerDao.delete(player);
	}

	
	@Transactional(readOnly=true)
	public List<Player> listPlayer() {
		return playerDao.list();
	}


	

}
