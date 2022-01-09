package com.se.security.demo.service;

import java.sql.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.security.demo.dao.HoadonDao;
import com.se.security.demo.entity.Hoadon;


@Service
public class HoadonServiceImpl implements HoadonService{
	@Autowired
	private HoadonDao hoadonDao;

	@Override
	@Transactional
	public List<Hoadon> getHoadons() {
		return hoadonDao.getHoadons();
	}

	@Override
	@Transactional
	public Integer saveHoadon(Hoadon hoadon) {
		return hoadonDao.saveHoadon(hoadon);
		
	}

	@Override
	@Transactional
	public Hoadon getHoadon(int id) {
		return hoadonDao.getHoadon(id);
	}

	@Override
	@Transactional
	public List<Hoadon> getHoadonsByPage(int position, int pageSize, Date nbd, Date nkt) {
		return hoadonDao.getHoadonsByPage(position, pageSize, nbd,nkt);
	}

	@Override
	@Transactional
	public int getSoluongHoadon() {
		return hoadonDao.getSoluongHoadon();
	}

	@Override
	@Transactional
	public List<Hoadon> getHoadonsByNguoidung(int idNguoidung) {
		return hoadonDao.getHoadonsByNguoidung(idNguoidung);
	}
	
}
