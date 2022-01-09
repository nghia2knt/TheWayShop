package com.se.security.demo.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.se.security.demo.entity.Sanpham;



@Repository
public class SanphamDaoImpl implements SanphamDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Sanpham> getSanphams() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Sanpham> theQuery = 
				currentSession.createQuery("from Sanpham order by id ", Sanpham.class);
		List<Sanpham> sanphams=theQuery.getResultList();
		return sanphams;
	}
	@Override
	public List<Sanpham> getSanphamsNN(int n) {
		Session currentSession = sessionFactory.getCurrentSession();

		String query = "FROM Sanpham ORDER BY RAND()";
		Query q = currentSession.createQuery(query);
		q.setMaxResults(n);
		List<Sanpham> sanphams=q.getResultList();
		Collections.shuffle(sanphams);
		return sanphams;
	}
	@Override
	public List<Sanpham> getSanphamsTK(String str, String sort) {
		  
        Session currentSession = sessionFactory.getCurrentSession();
        
        String stam;
        if (sort!=null) {
        	 if (sort.equalsIgnoreCase("1")) stam="ten";
             else
             	if (sort.equalsIgnoreCase("2")) stam="gia";
             	else stam="gia desc";
        } else stam="ten";
       
        
        Query theQuery = null;
        if (str != null && str.trim().length() > 0) {
            theQuery =currentSession.createQuery("from Sanpham where lower(ten) like :theName or lower(loai) like :theName order by " +stam, Sanpham.class);
            theQuery.setParameter("theName", "%" + str.toLowerCase() + "%");
        }
        else {
            theQuery =currentSession.createQuery("from Sanpham order by " + stam, Sanpham.class);      
            
        } 
        
        List<Sanpham> sanphams = theQuery.getResultList();     
        return sanphams;
	}
	@Override
	public Sanpham getSanpham(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Sanpham theSanpham = currentSession.get(Sanpham.class, theId);
		return theSanpham;
	}
	@Override
	public void saveSanpham(Sanpham sanpham) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		/*Query query = currentSession.createQuery("update Sanpham set ten = :ten, loai = :loai, gia = :gia, soluong = :soluong, hinhanh = :hinhanh" +
				" where id = :id");
		query.setParameter("ten", sanpham.getTen());
		query.setParameter("loai", sanpham.getLoai());
		*/
		
		
			currentSession.saveOrUpdate(sanpham);	
	}
	@Override
	public void deleteSanpham(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = 
				currentSession.createQuery("delete from Sanpham where id=:sanphamId");
		theQuery.setParameter("sanphamId", theId);
		
		theQuery.executeUpdate();		
	}
	

}
