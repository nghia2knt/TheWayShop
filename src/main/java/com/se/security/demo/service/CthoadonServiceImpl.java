package com.se.security.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.security.demo.dao.CthoadonDao;

import com.se.security.demo.entity.Cthoadon;
import com.se.security.demo.entity.Hoadon;


@Service
public class CthoadonServiceImpl implements CthoadonService{
	@Autowired
	private CthoadonDao cthoadonDao;
	@Override
	@Transactional
	public List<Cthoadon> getCthoadons() {
		return cthoadonDao.getCthoadons();
	}
	@Override
	@Transactional
	public void saveCthoadon(Cthoadon cthoadon) {
		cthoadonDao.saveCthoadon(cthoadon);
	}
	
	
}
