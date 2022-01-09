package com.se.security.demo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.security.demo.entity.Giohang;
import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;
import com.se.security.demo.service.HoadonService;
import com.se.security.demo.service.NguoidungService;


@Controller
@RequestMapping("/nguoidung")
public class NguoidungController {
	@Autowired
	private NguoidungService nguoidungService;
	@Autowired
	private HoadonService hoadonService;
	
	@RequestMapping(value="/list/{pageid:\\d+}")    
	public String listNguoidungsByPage(@PathVariable int pageid, Model theModel,@RequestParam(required=false) String theSearchHo,
			@RequestParam(required=false) String theSearchTen,@RequestParam(required=false) String theSearchSdt,@RequestParam(required=false) String theSearchDiachi) {
	    int total=10;    
	    
		List<Nguoidung> theNguoidungs = nguoidungService.searchNguoidungsByPage(pageid, total, theSearchHo,theSearchTen, theSearchSdt,theSearchDiachi);
		int nOfPages = soLuong()/total+1;
		theModel.addAttribute("nguoidungs",theNguoidungs);
		theModel.addAttribute("noOfPages", nOfPages);
		theModel.addAttribute("recordsPerPage", total);
		theModel.addAttribute("currentPage", pageid);
		theModel.addAttribute("nguoidung", new Nguoidung());
		return "quanly-nguoidung";
	}
	

	
	public int soLuong() {
		return nguoidungService.getSoluongNguoidung();
	}
	
	@RequestMapping(value = "/save", produces = "text/plain;charset=UTF-8")
	public String saveSanpham(@ModelAttribute("nguoidung") Nguoidung nguoidung,Model theModel) {
		if (nguoidungService.checkTaikhoan(nguoidung)) {
			if (nguoidung.getId()>0) {
				
			}else {
				nguoidung.setMatkhau("{noop}"+nguoidung.getMatkhau());
			}
			nguoidungService.saveNguoidung(nguoidung);
			theModel.addAttribute("thongbao", "Thành công!");
			return "redirect:/nguoidung/list/1?theSearchHo=&theSearchTen=&theSearchSdt=&theSearchDiachi=";
		}else {
			theModel.addAttribute("loi", "Tên tài khoản đã tồn tại");
		}
		return "quanly-nguoidung-update";
	}
	
	@GetMapping("/update")
	public String showFormForUpdate(@RequestParam("nguoidungId") int theId,
									Model theModel) {
		Nguoidung theNguoidung = nguoidungService.getNguoidung(theId);
		theModel.addAttribute("nguoidung", theNguoidung);
		return "quanly-nguoidung-update";
	}
	@GetMapping("/add")
	public String showFormForAdd(Model theModel) {
		Nguoidung theNguoidung = new Nguoidung();
		theModel.addAttribute("nguoidung", theNguoidung);
		return "quanly-nguoidung-update";
	}
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("nguoidungId") int theId,Model theModel) {
		if (hoadonService.getHoadonsByNguoidung(theId).size()<=0) {
			nguoidungService.deleteNguoidung(theId);
			theModel.addAttribute("thongbao", "Xóa thành công!");
		}else {
			theModel.addAttribute("loi", "Không thể xóa tài khoản đã có hóa đơn");
		}
		
		return "redirect:/nguoidung/list/1?theSearchHo=&theSearchTen=&theSearchSdt=&theSearchDiachi=";
	}
	
	
	 
}
