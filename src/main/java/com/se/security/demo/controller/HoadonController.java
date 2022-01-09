package com.se.security.demo.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.security.demo.entity.Hoadon;
import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.service.HoadonService;


@Controller
@RequestMapping("/hoadon")
public class HoadonController {
	@Autowired
	private HoadonService hoadonService;
	@Autowired
	private HoadonService cthoadonService;
	@GetMapping("/list/")
	public String listHoadons(Model theModel) {
		return "redirect:/hoadon/list/1?theSearchDateBD=2018-01-01&theSearchDateKT=2023-01-01";
	}
	
	@RequestMapping(value="/list/{pageid:\\d+}")    
	public String listNguoidungsByPage(@PathVariable int pageid, Model theModel,
			@RequestParam(required=false) String theSearchDateBD,@RequestParam(required=false) String theSearchDateKT) {
		
	    int total=10;   
	    
	    Date dateBD;
	    Date dateKT;
	    dateBD=Date.valueOf("2018-01-01");
	 	dateKT=Date.valueOf("2028-01-01");
	 	try {
	 		dateBD=Date.valueOf(theSearchDateBD);
			dateKT=Date.valueOf(theSearchDateKT);
	 	}catch(IllegalArgumentException ex) {
	 		dateBD=Date.valueOf("2018-01-01");
		 	dateKT=Date.valueOf("2028-01-01");
	 	}
	 	
		List<Hoadon> theHoadons = hoadonService.getHoadonsByPage(pageid, total,dateBD, dateKT);
		int nOfPages = soLuong()/total+1;
		theModel.addAttribute("hoadons",theHoadons);
		theModel.addAttribute("noOfPages", nOfPages);
		theModel.addAttribute("recordsPerPage", total);
		theModel.addAttribute("currentPage", pageid);
		
		return "quanly-hoadon";
	}
	public int soLuong() {
		return hoadonService.getSoluongHoadon();
	}
	
	
}
