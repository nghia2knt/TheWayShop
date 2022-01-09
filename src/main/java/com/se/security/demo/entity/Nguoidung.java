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



/*
 * id int IDENTITY(1,1) primary key NOT NULL,
	ho nvarchar(50) null,
	ten nvarchar(50) null,
	sdt varchar(50) null,
	loai nvarchar(50) null,
	matkhau nvarchar(50) null
 */
@Entity
@Table(name = "Nguoidung")
public class Nguoidung {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int id;
	@Column(name = "ho")
	private String ho;
	@Column(name = "ten")
	private String ten;
	@Column(name = "sdt")
	private String sdt;
	@Column(name = "diachi")
	private String diachi;
	@Column(name = "loai")
	private String loai;
	@Column(name = "taikhoan")
	private String taikhoan;
	@Column(name = "matkhau")
	private String matkhau;
	
	
	
	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getTaikhoan() {
		return taikhoan;
	}

	public void setTaikhoan(String taikhoan) {
		this.taikhoan = taikhoan;
	}

	public Nguoidung() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getLoai() {
		return loai;
	}

	public void setLoai(String loai) {
		this.loai = loai;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	


	@Override
	public String toString() {
		return "Nguoidung [id=" + id + ", ho=" + ho + ", ten=" + ten + ", sdt=" + sdt + ", loai=" + loai + ", matkhau="
				+ matkhau + "]";
	}
	
	
	
}
