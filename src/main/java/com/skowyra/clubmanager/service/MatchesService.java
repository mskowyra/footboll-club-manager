package com.skowyra.clubmanager.service;

import java.util.List;


import com.skowyra.clubmanager.model.Matches;

public interface MatchesService {

	public Matches getMatches(Long matchesId);
	public void addOrUpdateMatches(Matches matches);
//	public void addOrUpdateMatches(Long matchesId,Long playerId);
	public void deleteMatches(Long matches);
	public List<Matches> listMatches();
}
