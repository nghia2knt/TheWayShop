package com.se.security.demo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Repository;


import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;

@Repository
public class NguoidungDaoImpl implements NguoidungDao{

	@Autowired
	private SessionFactory sessionFactory;
	public List<Nguoidung> getNguoidungs() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Nguoidung> theQuery = 
				currentSession.createQuery("from Nguoidung order by ho ", Nguoidung.class);
		List<Nguoidung> nguoidungs=theQuery.getResultList();
		return nguoidungs;
	}
	@Override
	public Nguoidung getNguoidung(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Nguoidung theNguoidung = currentSession.get(Nguoidung.class, id);
		return theNguoidung;
	}
	@Override
	public Nguoidung getNguoidungByTK(String taikhoan) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = 
				currentSession.createQuery("from Nguoidung where taikhoan =  :taikhoan");
		theQuery.setParameter("taikhoan", taikhoan);
		List<Nguoidung> nguoidungs=theQuery.getResultList();
		Nguoidung theNguoidung = nguoidungs.get(0);
		return theNguoidung;
	}
	@Override
	public List<Nguoidung> getNguoidungsByPage(int position, int pageSize) {
		Session currentSession = sessionFactory.getCurrentSession();
		Criteria criteria = currentSession.createCriteria(Nguoidung.class);
		if (position == 1) {
			criteria.setFirstResult(position-1);
		}else {
			criteria.setFirstResult(position*pageSize-pageSize);
		}
		
		criteria.setMaxResults(pageSize);
		return criteria.list();
	}
	@Override
	public int getSoluongNguoidung() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Nguoidung> theQuery = 
				currentSession.createQuery("from Nguoidung", Nguoidung.class);
		List<Nguoidung> nguoidungs=theQuery.getResultList();
		int sl = nguoidungs.size();
		return sl;
	}
	@Override
	public void saveNguoidung(Nguoidung nguoidung) {
		Session currentSession = sessionFactory.getCurrentSession();
		try {
			currentSession.saveOrUpdate(nguoidung);	
		} catch (DataIntegrityViolationException e) {
			System.out.println("tài khoản đã tồn tại");
		}
	}
	@Override
	public void deleteNguoidung(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = 
				currentSession.createQuery("delete from Nguoidung where id=:nguoidungId");
		theQuery.setParameter("nguoidungId", theId);
		theQuery.executeUpdate();	
	}
	@Override
	public boolean checkTaikhoan(Nguoidung nguoidung) {
		String taikhoan = nguoidung.getTaikhoan();
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = 
					currentSession.createQuery("from Nguoidung where taikhoan =  :taikhoan");
		theQuery.setParameter("taikhoan", taikhoan);
		List<Nguoidung> nguoidungs=theQuery.getResultList();
		if (nguoidung.getId()>0) {
			for (Nguoidung s : nguoidungs) {
	            if (s.getId()!=nguoidung.getId()) {
	            	if (s.getTaikhoan().equals(nguoidung.getTaikhoan())) {
	            		return false;
	            	}
	            }
	        }
		}else {
			if (nguoidungs.size()!=0) return false;
		}
		
		return true;
	}
	@Override
	public List<Nguoidung> searchNguoidungsByPage(int position, int pageSize, String ho, String ten, String sdt,
			String diachi) {
		Session currentSession = sessionFactory.getCurrentSession();
		Criteria criteria = currentSession.createCriteria(Nguoidung.class);
		criteria.add(Restrictions.like("ho",ho,MatchMode.ANYWHERE));
		criteria.add(Restrictions.like("ten",ten,MatchMode.ANYWHERE));
		criteria.add(Restrictions.like("sdt",sdt,MatchMode.ANYWHERE));
		criteria.add(Restrictions.like("diachi",diachi,MatchMode.ANYWHERE));
		if (position == 1) {
			criteria.setFirstResult(position-1);
		}else {
			criteria.setFirstResult(position*pageSize-pageSize);
		}
		
		criteria.setMaxResults(pageSize);
		return criteria.list();
	}
	

}
