package com.skowyra.clubmanager.dao;

import java.util.List;

import com.skowyra.clubmanager.model.Player;


public interface PlayerDao {
	
	public Player find(Long id);
	public void addOrUpdate(Player player);
	public void addOrUpdate(Player player, Long teamId);
	public void delete(Player player);
	public List<Player> list();

}
