package com.skowyra.clubmanager.service;

import java.util.List;

import com.skowyra.clubmanager.model.Player;



public interface PlayerService {
	
	public Player getPlayer(Long id);
	public void addOrUpdatePlayer(Player player);
	public void addOrUpdatePlayer(Player player, Long teamId);
	public void deletePlayer(Long player);
	public List<Player> listPlayer();

}
