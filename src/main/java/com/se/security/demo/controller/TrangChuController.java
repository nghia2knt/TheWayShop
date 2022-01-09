package com.se.security.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;
import com.se.security.demo.service.NguoidungService;
import com.se.security.demo.service.SanphamService;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
@Controller
public class TrangChuController {
	@Autowired
    private NguoidungService nguoidungService;
	@Autowired
	private SanphamService sanphamService;
	@GetMapping("/")
    public String showHome(Model theModel, HttpSession session) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
		  	Nguoidung nguoidung = nguoidungService.getNguoidungByTK(username);
			session.setAttribute("myNguoidung", nguoidung);
		} else {
		  String username = principal.toString();
		}
		List<Sanpham> theSanphams = sanphamService.getSanphamsNN(4);
		theModel.addAttribute("sanphams",theSanphams);
        return "trang-chu";
    }

	
	@GetMapping("/dangnhap")
	    public String showMyLoginPage() {
	        return "dangnhap";
	    }
	@GetMapping("/dangky")
    public String showMySinupPage(Model theModel) {
		Nguoidung theNguoidung = new Nguoidung();
		theModel.addAttribute("nguoidung", theNguoidung);
        return "dangky";
    }
	@RequestMapping(value = "/savedangky", produces = "text/plain;charset=UTF-8")
	public String saveSanpham(@ModelAttribute("nguoidung") Nguoidung nguoidung,Model theModel) {
		if (nguoidungService.checkTaikhoan(nguoidung)) {
			nguoidung.setMatkhau("{noop}"+nguoidung.getMatkhau());
			nguoidungService.saveNguoidung(nguoidung);
			theModel.addAttribute("thongbao", "Thành công!");
			return "redirect:/";
		}else {
			theModel.addAttribute("loi", "Tên tài khoản đã tồn tại");
		}
		return "dangky";
	}
	@GetMapping("/dangxuat")
    public String showMyLogoutPage(HttpSession session) {
		session.setAttribute("myNguoidung", null);
        return "dangnhap?logout";
    }
	
	@GetMapping("/access-denied")
	    public String showAccessDenied() {
	        return "access-denied";
	    }
	
	
	@GetMapping("/404")
    public String show404() {
        return "404";
    }
}
