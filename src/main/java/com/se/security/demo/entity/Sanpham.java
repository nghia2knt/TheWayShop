package com.se.security.demo.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
/*
 * id int IDENTITY(1,1)  primary key not null,
	ten nvarchar(50) null,
	loai nvarchar(50) null,
	gia float null,
	hinhanh nvarchar(50) null
 */
@Entity
@Table(name = "Sanpham")
public class Sanpham {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name = "ten")

	private String ten;
	@Column(name = "loai")

	private String loai;
	@Column(name = "gia")
	private Double gia;
	@Column(name = "soluong")
	private int soluong;
	@Column(name = "hinhanh")
	private String hinhanh;
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public Double getGia() {
		return gia;
	}
	public void setGia(Double gia) {
		this.gia = gia;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public Sanpham() {
		// TODO Auto-generated constructor stub
	}
	public Sanpham(int id, String ten, String loai, Double gia, int soluong, String hinhanh) {
		super();
		this.id = id;
		this.ten = ten;
		this.loai = loai;
		this.gia = gia;
		this.soluong = soluong;
		this.hinhanh = hinhanh;
	}
	@Override
	public String toString() {
		return "Sanpham [id=" + id + ", ten=" + ten + ", loai=" + loai + ", gia=" + gia + ", soluong=" + soluong
				+ ", hinhanh=" + hinhanh + "]";
	}
	
	
	
	
}
