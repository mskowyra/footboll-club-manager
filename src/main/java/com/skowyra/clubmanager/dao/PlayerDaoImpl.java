package com.skowyra.clubmanager.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import  com.skowyra.clubmanager.model.Player;


@Repository("playerDao")
public class PlayerDaoImpl implements PlayerDao {

	/** The logger. */
    static Logger logger = Logger.getLogger(PlayerDaoImpl.class);
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public PlayerDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public Player find(Long id) {
		return (Player) sessionFactory.getCurrentSession().get(Player.class, id);
	}

	
	public void addOrUpdate(Player player) {
			sessionFactory.getCurrentSession().saveOrUpdate(player);
	}
	
	
	public void addOrUpdate(Player player, Long teamId) {
	//	Team existingTeam = (Team) sessionFactory.getCurrentSession().get(Team.class, teamId);
    //     player.setTeam(existingTeam);
       sessionFactory.getCurrentSession().save(player);
		
	}
	
			
	public void delete(Player player) {
		sessionFactory.getCurrentSession().delete(player);
	}


	@SuppressWarnings("unchecked")
	public List<Player> list() {
		//List<Products> products  = (List<Products>) session.createQuery("from Products").list();
		List<Player> players = (List<Player>) sessionFactory.getCurrentSession().createQuery("from Player").list();
		//return sessionFactory.getCurrentSession().createQuery("from contact").list();
		return players;
	}

	

}
