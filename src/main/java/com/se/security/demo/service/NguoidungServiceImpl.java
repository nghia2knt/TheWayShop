package com.se.security.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.security.demo.dao.NguoidungDao;
import com.se.security.demo.entity.Nguoidung;
@Service
public class NguoidungServiceImpl implements NguoidungService{
	@Autowired
	private NguoidungDao nguoidungDao;
	
	@Transactional
	public List<Nguoidung> getNguoidungs() {
		return nguoidungDao.getNguoidungs();
	}

	@Override
	@Transactional
	public Nguoidung getNguoidung(int id) {
		return nguoidungDao.getNguoidung(id);
	}

	@Override
	@Transactional
	public Nguoidung getNguoidungByTK(String taikhoan) {
		return nguoidungDao.getNguoidungByTK(taikhoan);
	}

	@Override
	@Transactional
	public List<Nguoidung> getNguoidungsByPage(int position, int pageSize) {
		return nguoidungDao.getNguoidungsByPage( position, pageSize);
	}

	@Override
	@Transactional
	public int getSoluongNguoidung() {
		return nguoidungDao.getSoluongNguoidung();
	}

	@Override
	@Transactional
	public void saveNguoidung(Nguoidung nguoidung) {
		nguoidungDao.saveNguoidung(nguoidung);
		
	}

	@Override
	@Transactional
	public void deleteNguoidung(int theId) {
		nguoidungDao.deleteNguoidung(theId);
		
	}

	@Override
	@Transactional
	public boolean checkTaikhoan(Nguoidung nguoidung) {
		return nguoidungDao.checkTaikhoan(nguoidung);
	}

	@Override
	@Transactional
	public List<Nguoidung> searchNguoidungsByPage(int position, int pageSize, String ho, String ten, String sdt,
			String diachi) {
		return nguoidungDao.searchNguoidungsByPage(position, pageSize, ho, ten, sdt, diachi);
	}
	

}
