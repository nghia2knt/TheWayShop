 package com.se.security.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.security.demo.entity.Sanpham;

import com.se.security.demo.service.SanphamService;



@Controller
@RequestMapping("/sanpham")
public class SanphamController {
	@Autowired
	private SanphamService sanphamService;
	
	
	@GetMapping("/search")
	public String listSanphamsTK(Model theModel,@RequestParam(required=false) String sort,@RequestParam(required=false) String theSearchName) {
		List<Sanpham> theSanphams = sanphamService.getSanphamsTK(theSearchName,sort);
		theModel.addAttribute("sanphams",theSanphams);
		Sanpham sanpham = new Sanpham();
		theModel.addAttribute("sanpham",sanpham);
		return "list-sanphams-ND";
	}
	@GetMapping("/")
	public String chuyen2k() {
		return "redirect:/sanpham/search";
	}
	@GetMapping("")
	public String chuyen3k() {
		return "redirect:/sanpham/search";
	}
	
	@GetMapping("/chitiet")
	public String chiTietSanpham(@RequestParam("sanphamId") int theId,
									Model theModel) {
		Sanpham theSanpham = sanphamService.getSanpham(theId);	
		theModel.addAttribute("sanpham", theSanpham);
		List<Sanpham> theSanphams = sanphamService.getSanphamsNN(4);
		theModel.addAttribute("sanphams",theSanphams);
		return "sanpham-chitiet";
	}
	
	@RequestMapping(value = "/luusanpham", produces = "text/plain;charset=UTF-8")
	public String saveSanpham(@ModelAttribute("sanpham") Sanpham sanpham) {
		// save the customer using our service
		sanphamService.saveSanpham(sanpham);	
		
		if (sanpham.getId()>0) return "redirect:/sanpham/chitiet?sanphamId="+sanpham.getId();
		return "redirect:/sanpham/chitiet?sanphamId="+sanpham.getId();
	}
	 
	
}
