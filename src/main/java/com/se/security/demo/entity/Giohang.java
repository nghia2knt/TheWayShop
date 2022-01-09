package com.se.security.demo.entity;

public class Giohang {
	private Sanpham sanpham;
	private int soluong;
	public Sanpham getSanpham() {
		return sanpham;
	}
	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public Giohang(Sanpham sanpham, int soluong) {
		super();
		this.sanpham = sanpham;
		this.soluong = soluong;
	}
	public Giohang() {
		
	}
	
}
