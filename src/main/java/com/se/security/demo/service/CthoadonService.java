package com.se.security.demo.service;

import java.util.List;

import com.se.security.demo.entity.Cthoadon;
import com.se.security.demo.entity.Hoadon;
public interface CthoadonService {
	public List<Cthoadon> getCthoadons();
	public void saveCthoadon(Cthoadon cthoadon);
	
}
