package com.se.security.demo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.se.security.demo.entity.Giohang;
import com.se.security.demo.entity.Hoadon;
import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.service.HoadonService;
import com.se.security.demo.service.NguoidungService;

@Controller
@RequestMapping("/canhan")
public class CanhanController {
	@Autowired
    private NguoidungService nguoidungService;
	@Autowired
	private HoadonService hoadonService;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
    public String viewAll(ModelMap mm, HttpSession session,Model theModel) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			String username = ((UserDetails)principal).getUsername();
		  	Nguoidung nguoidung = nguoidungService.getNguoidungByTK(username);
		  	List<Hoadon> hoadons = hoadonService.getHoadonsByNguoidung(nguoidung.getId());
			theModel.addAttribute("hoadons",hoadons);
			theModel.addAttribute("nguoidung",nguoidung);
		} else {
		  String username = principal.toString();
		}
		
        return "ca-nhan";
    }
	@RequestMapping(value = "/save", produces = "text/plain;charset=UTF-8")
	public String saveSanpham(@ModelAttribute("nguoidung") Nguoidung nguoidung,Model theModel,HttpSession session) {
		if (nguoidungService.checkTaikhoan(nguoidung)) {
			if (nguoidung.getId()>0) {
				
			}else {
				nguoidung.setMatkhau("{noop}"+nguoidung.getMatkhau());
			}
			nguoidungService.saveNguoidung(nguoidung);
			session.setAttribute("myNguoidung", nguoidung);
			theModel.addAttribute("thongbao", "Thành công!");
			return "redirect:/canhan";
		}else {
			theModel.addAttribute("loi", "Tên tài khoản đã tồn tại");
		}
		return "ca-nhan";
	}
}
