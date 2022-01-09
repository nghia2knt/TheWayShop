package com.se.security.demo.service;

import java.sql.Date;
import java.util.List;

import com.se.security.demo.entity.Hoadon;

public interface HoadonService {
	public List<Hoadon> getHoadons();
	public Integer saveHoadon(Hoadon hoadon);
	public Hoadon getHoadon(int id);
	public List<Hoadon> getHoadonsByPage(int position, int pageSize, Date nbd, Date nkt);
	public int getSoluongHoadon();
	public List<Hoadon> getHoadonsByNguoidung(int idNguoidung);
}
