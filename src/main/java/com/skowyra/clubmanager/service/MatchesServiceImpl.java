package com.skowyra.clubmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skowyra.clubmanager.dao.MatchesDao;
import com.skowyra.clubmanager.model.Matches;


@Service("matchesService")
public class MatchesServiceImpl implements MatchesService {

	private MatchesDao matchesDao;
	
	
	@Autowired
	public MatchesServiceImpl(MatchesDao matchesDao) {
		this.matchesDao = matchesDao;
		
	}
	
	@Transactional(readOnly=true)
	public Matches getMatches(Long matchesId) {
		return matchesDao.find(matchesId);
	}
	
	@Transactional(readOnly = false)
	public void addOrUpdateMatches(Matches matches) {
		matchesDao.addOrUpdate(matches);
	}
	
		
	@Transactional(readOnly = false)
	public void deleteMatches(Long matchesId) {
		Matches matches = matchesDao.find(matchesId);
		matchesDao.delete(matches);
		
	}
	@Transactional(readOnly=true)
	public List<Matches> listMatches() {
		return matchesDao.list();
	}

	/**
	
	@Transactional(readOnly = false)
	public void addOrUpdateMatches(Matches matches, Long playerId) {
		matchesDao.addOrUpdate(matches, playerId);
	}
	
	@Transactional(readOnly = false)
	public void addOrUpdateMatches(Long matchesId, Long playerId) {
		matchesDao.addOrUpdate(matchesId, playerId);
	}
*/
}
