package com.atlasck.repository;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CurrentVersionImpl implements CurrentVersion{

	@Autowired
	private SessionFactory sessionFactory;

	CurrentVersionImpl (SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public CurrentVersion getCurrentVersion(Integer id) {
		return (CurrentVersion) sessionFactory.getCurrentSession().get(CurrentVersion.class, 1);
	}
}
