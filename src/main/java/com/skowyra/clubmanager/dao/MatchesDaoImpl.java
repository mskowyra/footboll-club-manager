package com.skowyra.clubmanager.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skowyra.clubmanager.model.Matches;


@Repository("matchesDao")
public class MatchesDaoImpl implements MatchesDao {

private SessionFactory sessionFactory;
	
	@Autowired
	public MatchesDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/** The logger. */
    static Logger logger = Logger.getLogger(MatchesDaoImpl.class);
	
    
	public Matches find(Long matchesId) {
		return (Matches) sessionFactory.getCurrentSession().get(Matches.class, matchesId);
	}

	public void addOrUpdate(Matches matches) {
		sessionFactory.getCurrentSession().saveOrUpdate(matches);
		
	}
	
	
	public void delete(Matches matches) {
		sessionFactory.getCurrentSession().delete(matches);
		
	}

	@SuppressWarnings("unchecked")
	public List<Matches> list() {
		List<Matches> matches = (List<Matches>) sessionFactory.getCurrentSession().createQuery("from Matches").list();
		return matches;
	}

	public void addOrUpdate(Matches matches, Long playerId) {
		// TODO Auto-generated method stub
		
	}

	public void addOrUpdate(Long matchesId, Long playerId) {
		// TODO Auto-generated method stub
		
	}

	

}
