package com.se.security.demo.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.security.demo.entity.Hoadon;
import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;

@Repository
public class HoadonDaoImpl implements HoadonDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Hoadon> getHoadons() {
		Session session;
        List<Hoadon> list = null;
        try {
            session = sessionFactory.getCurrentSession();
            Query<Hoadon> q = session.createQuery("from Hoadon order by id", Hoadon.class);
            list = q.getResultList();
        } catch (HibernateException e) {
            session = sessionFactory.openSession();
            e.printStackTrace();
        }
        return list;
	}

	@Override
	public Integer saveHoadon(Hoadon hoadon) {
		Session currentSession = sessionFactory.getCurrentSession();
		Integer id = 0;
		id = (Integer) currentSession.save(hoadon);	
		return id;
	}

	@Override
	public Hoadon getHoadon(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Hoadon hoadon= currentSession.get(Hoadon.class, id);
		return hoadon;
	}

	
	@Override
	public List<Hoadon> getHoadonsByPage(int position, int pageSize, Date nbd, Date nkt) {
		Session currentSession = sessionFactory.getCurrentSession();
		Criteria criteria = currentSession.createCriteria(Hoadon.class);
		if (position == 1) {
			criteria.setFirstResult(position-1);
		}else {
			criteria.setFirstResult(position*pageSize-pageSize);
		}
		criteria.setMaxResults(pageSize);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.add(Restrictions.between("ngaylap", nbd, nkt));
		return criteria.list();
	}

	@Override
	public int getSoluongHoadon() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Hoadon> theQuery = 
				currentSession.createQuery("from Hoadon", Hoadon.class);
		List<Hoadon> hoadons=theQuery.getResultList();
		int sl = hoadons.size();
		return sl;
	}

	@Override
	public List<Hoadon> getHoadonsByNguoidung(int idNguoidung) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Hoadon> theQuery = 
				currentSession.createQuery("from Hoadon where idnguoidung=:nguoidungId");
		theQuery.setParameter("nguoidungId", idNguoidung);
		List<Hoadon> hoadons=theQuery.getResultList();
		return hoadons;
	}

}
