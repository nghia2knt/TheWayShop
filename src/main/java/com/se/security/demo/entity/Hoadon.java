package com.se.security.demo.entity;

import java.sql.Date;
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
 * id int IDENTITY(1,1)  primary key not null,
	idnguoidung int null,
	ngaylap date null
 */
@Entity
@Table(name="Hoadon")
public class Hoadon {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="ngaylap")
	private Date ngaylap;
	
	@OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="idhoadon")
	private List<Cthoadon> cthoadon;
	
	@ManyToOne
	@JoinColumn(name="idnguoidung")
	private Nguoidung nguoidung;
	
	@Column(name="tongtien")
	private Double tongtien;
	
	
	public Double getTongtien() {
		return tongtien;
	}

	public void setTongtien(Double tongtien) {
		this.tongtien = tongtien;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getNgaylap() {
		return ngaylap;
	}

	public void setNgaylap(Date ngaylap) {
		this.ngaylap = ngaylap;
	}
	public List<Cthoadon> getCthoadon() {
		return cthoadon;
	}

	public void setCthoadon(List<Cthoadon> cthoadon) {
		this.cthoadon = cthoadon;
	}
	
	public Nguoidung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(Nguoidung nguoidung) {
		this.nguoidung = nguoidung;
	}

	
	public Hoadon (Date ngaylap, Nguoidung nguoidung, Double tongtien) {
		super();
		this.ngaylap = ngaylap;
		this.nguoidung = nguoidung;
		this.tongtien = tongtien;
	}

	

	public Hoadon() {
	
	}

	public Hoadon(int id, Date ngaylap, Nguoidung nguoidung, Double tongtien) {
		super();
		this.id = id;
		this.ngaylap = ngaylap;
		this.nguoidung = nguoidung;
		this.tongtien = tongtien;
	}

	
	public Hoadon(Date ngaylap, List<Cthoadon> cthoadon, Nguoidung nguoidung, Double tongtien) {
		super();
		this.ngaylap = ngaylap;
		this.cthoadon = cthoadon;
		this.nguoidung = nguoidung;
		this.tongtien = tongtien;
	}

	@Override
	public String toString() {
		return "Hoadon [id=" + id + ", ngaylap=" + ngaylap + ", cthoadon=" + cthoadon +
				"]";
	}

	

	

}
