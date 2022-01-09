package com.se.security.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.security.demo.entity.Cthoadon;
import com.se.security.demo.entity.Hoadon;
import com.se.security.demo.entity.Nguoidung;


@Repository
public class CthoadonDaoImpl implements CthoadonDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Cthoadon> getCthoadons() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Cthoadon> theQuery = 
				currentSession.createQuery("from Cthoadon order by id ", Cthoadon.class);
		List<Cthoadon> cthoadons=theQuery.getResultList();
		return cthoadons;
	}
	@Override
	public void saveCthoadon(Cthoadon cthoadon) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(cthoadon);	
	}
	

}
