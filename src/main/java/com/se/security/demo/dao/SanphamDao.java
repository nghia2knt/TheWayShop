package com.se.security.demo.dao;

import java.util.List;

import com.se.security.demo.entity.Sanpham;

public interface SanphamDao {
	public List<Sanpham> getSanphams();
	public List<Sanpham> getSanphamsNN(int n);
	public List<Sanpham> getSanphamsTK(String str, String sort);
	public Sanpham getSanpham(int theId);
	public void saveSanpham(Sanpham sanpham);
	public void deleteSanpham(int theId);
}
