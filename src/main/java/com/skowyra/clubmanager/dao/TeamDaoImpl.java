package com.skowyra.clubmanager.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skowyra.clubmanager.model.Team;


@Repository("teamDao")
public class TeamDaoImpl implements TeamDao {
	
private SessionFactory sessionFactory;
	
	@Autowired
	public TeamDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public Team find(Long teamId) {
		return (Team) sessionFactory.getCurrentSession().get(Team.class, teamId);
	}

	
	public void addOrUpdate(Team team) {
		sessionFactory.getCurrentSession().saveOrUpdate(team);
		
	}

	
	public void delete(Team player) {
		sessionFactory.getCurrentSession().delete(player);
	}


	@SuppressWarnings("unchecked")
	public List<Team> list() {
		//List<Products> products  = (List<Products>) session.createQuery("from Products").list();
		List<Team> teams = (List<Team>) sessionFactory.getCurrentSession().createQuery("from Team").list();
		//return sessionFactory.getCurrentSession().createQuery("from contact").list();
		return teams;
	}
	
	

}
