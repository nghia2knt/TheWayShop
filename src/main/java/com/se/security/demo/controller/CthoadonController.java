package com.se.security.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.security.demo.entity.Cthoadon;
import com.se.security.demo.service.CthoadonService;


@Controller
@RequestMapping("/cthoadon")
public class CthoadonController {
	@Autowired
	private CthoadonService cthoadonService;
	@GetMapping("/list")
	public String listCthoadons(Model theModel) {
		List<Cthoadon> theCthoadons = cthoadonService.getCthoadons();
		theModel.addAttribute("cthoadons",theCthoadons);
		return "list-cthoadons";
	}
}
