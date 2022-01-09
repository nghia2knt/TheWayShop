package com.se.security.demo.dao;

import java.util.List;

import com.se.security.demo.entity.Cthoadon;
import com.se.security.demo.entity.Hoadon;



public interface CthoadonDao {
	public List<Cthoadon> getCthoadons();
	public void saveCthoadon(Cthoadon cthoadon);
	
}
