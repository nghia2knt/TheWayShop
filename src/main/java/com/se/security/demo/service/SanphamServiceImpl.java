package com.se.security.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.se.security.demo.dao.SanphamDao;
import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;

@Service
public class SanphamServiceImpl implements SanphamService{
	@Autowired
	private SanphamDao sanphamDao;
	@Override
	@Transactional
	public List<Sanpham> getSanphams() {
		return sanphamDao.getSanphams();
	}
	@Override
	@Transactional
	public List<Sanpham> getSanphamsNN(int n) {
		return sanphamDao.getSanphamsNN(n);
	}
	@Override
	@Transactional
	public List<Sanpham> getSanphamsTK(String str, String sort) {
		return sanphamDao.getSanphamsTK(str, sort);
	}
	@Override
	@Transactional
	public Sanpham getSanpham(int theId) {
		return sanphamDao.getSanpham(theId);
	}
	@Override
	@Transactional
	public void saveSanpham(Sanpham sanpham) {
		sanphamDao.saveSanpham(sanpham);
	}
	@Override
	@Transactional
	public void deleteSanpham(int theId) {
		sanphamDao.deleteSanpham(theId);
		
	}
	
	
}
