package com.se.security.demo.dao;

import java.util.List;

import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;

public interface NguoidungDao {
	public List<Nguoidung> getNguoidungs();
	public Nguoidung getNguoidung(int id);
	public Nguoidung getNguoidungByTK(String taikhoan);
	public List<Nguoidung> getNguoidungsByPage(int position, int pageSize);
	public int getSoluongNguoidung();
	public void saveNguoidung(Nguoidung nguoidung);
	public void deleteNguoidung(int theId);
	public boolean checkTaikhoan(Nguoidung nguoidung);
	public List<Nguoidung> searchNguoidungsByPage(int position, int pageSize, String ho, String ten, String sdt, String diachi);
}
