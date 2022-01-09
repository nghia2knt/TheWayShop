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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/*
 * create table cthoadon(
	id int IDENTITY(1,1)  primary key not null,
	idhoadon int null,
	idsanpham int null,
	soluong int null,
	gia float null
)
 */
@Entity
@Table(name="Cthoadon")
public class Cthoadon {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="idsanpham")
	private Sanpham sanpham;
	
	@Column(name="soluong")
	private int soluong;
	@Column(name="gia")
	private double gia;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	

	public Sanpham getSanpham() {
		return sanpham;
	}
	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}
	public Cthoadon() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Cthoadon(int id, Sanpham sanpham, int soluong, double gia) {
		super();
		this.id = id;
		this.sanpham = sanpham;
		this.soluong = soluong;
		this.gia = gia;
	}
	public Cthoadon( Sanpham sanpham, int soluong, double gia) {
		super();
		this.sanpham = sanpham;
		this.soluong = soluong;
		this.gia = gia;
	}
	@Override
	public String toString() {
		return "Cthoadon [id=" + id + ", soluong=" + soluong + ", gia=" + gia + "]";
	}
	
	
}
