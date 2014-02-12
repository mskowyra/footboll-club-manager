package com.skowyra.clubmanager.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skowyra.clubmanager.model.Coach;



@Repository("coachDao")
public class CoachDaoImpl implements CoachDao{

	private SessionFactory sessionFactory;
	
	@Autowired
	public CoachDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/** The logger. */
    static Logger logger = Logger.getLogger(CoachDaoImpl.class);
	
		
	public Coach find(Long coachId) {
		return (Coach) sessionFactory.getCurrentSession().get(Coach.class, coachId);
	}

	public void addOrUpdate(Coach Coach) {
		sessionFactory.getCurrentSession().saveOrUpdate(Coach);
		
	}

	public void delete(Coach coach) {
		sessionFactory.getCurrentSession().delete(coach);
		
	}

	@SuppressWarnings("unchecked")
	public List<Coach> list() {
		List<Coach> coaches = (List<Coach>) sessionFactory.getCurrentSession().createQuery("from Coach").list();
		return coaches;
	}

}
