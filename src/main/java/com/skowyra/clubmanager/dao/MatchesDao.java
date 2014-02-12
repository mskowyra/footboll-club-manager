package com.skowyra.clubmanager.dao;

import java.util.List;

import com.skowyra.clubmanager.model.Matches;


public interface MatchesDao {

	public Matches find(Long matchesId);
	public void addOrUpdate(Matches matches);
	public void addOrUpdate(Matches matches, Long playerId);
	public void addOrUpdate(Long matchesId, Long playerId);
	public void delete(Matches matches);
	public List<Matches> list();
	
}
