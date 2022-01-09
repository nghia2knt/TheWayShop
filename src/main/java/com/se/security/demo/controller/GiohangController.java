package com.se.security.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.security.demo.dao.SanphamDao;
import com.se.security.demo.entity.Giohang;
import com.se.security.demo.entity.Sanpham;
import com.se.security.demo.service.SanphamService;

@Controller
@RequestMapping(value = "/giohang")
public class GiohangController {
	@Autowired
    private SanphamService sanphamService;
	
	
	 @RequestMapping(value = "/add/", method = RequestMethod.GET)
	    public String viewAdd1(@RequestParam(required=false) Integer sanphamId,
	    		@RequestParam(required=false) Integer sluong,
             HttpSession session) {
		 HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
	        if (giohangs == null) {
	            giohangs = new HashMap<>();
	        }
	        Sanpham sanpham = sanphamService.getSanpham(sanphamId);
	        if (sanpham != null) {
	            if (giohangs.containsKey(sanphamId)) {
	                Giohang giohang = giohangs.get(sanphamId);
	                giohang.setSanpham(sanpham);;
	                giohang.setSoluong(giohang.getSoluong() + sluong);
	                giohangs.put(sanphamId, giohang);
	            } else {
	                Giohang giohang = new Giohang();
	                giohang.setSanpham(sanpham);
	                giohang.setSoluong(sluong);
	                giohangs.put(sanphamId, giohang);
	            }}
	        session.setAttribute("myGiohangs", giohangs);
	        session.setAttribute("myTongtien", totalPrice(giohangs));
	      
	        return "redirect:/giohang/";
	    }
	    
	 
		
	 @RequestMapping(value = "/add/{sanphamId}", method = RequestMethod.GET)
	    public String viewAdd2(ModelMap mm, HttpSession session, @PathVariable("sanphamId") int sanphamId) {
	        HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
	        if (giohangs == null) {
	            giohangs = new HashMap<>();
	        }
	        Sanpham sanpham = sanphamService.getSanpham(sanphamId);
	        if (sanpham != null) {
	            if (giohangs.containsKey(sanphamId)) {
	                Giohang giohang = giohangs.get(sanphamId);
	                giohang.setSanpham(sanpham);;
	                giohang.setSoluong(giohang.getSoluong() + 1);
	                giohangs.put(sanphamId, giohang);
	            } else {
	                Giohang giohang = new Giohang();
	                giohang.setSanpham(sanpham);
	                giohang.setSoluong(1);
	                giohangs.put(sanphamId, giohang);
	            }
	        }
	        session.setAttribute("myGiohangs", giohangs);
	        session.setAttribute("myTongtien", totalPrice(giohangs));
	       // session.setAttribute("myCartNum", cartItems.size());
	        
	        return "redirect:/giohang/";
	    }
	 @RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	    public String viewAll(ModelMap mm, HttpSession session) {
	        HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
	        if (giohangs == null) {
	            giohangs = new HashMap<>();
	        }
	        
	        session.setAttribute("myGiohangs", giohangs);
	        session.setAttribute("myTongtien", totalPrice(giohangs));
	     
	        
	        return "giohang-chitiet";
	    }
	
	 @RequestMapping(value = "/sub", method = RequestMethod.POST)
	    public String viewUpdate(@RequestParam(required=false) Integer sanphamId,
	    		@RequestParam(required=false) Integer soluong,
                HttpSession session) {
		 if (soluong ==0) {
			 return "redirect:/giohang/remove/"+sanphamId;
			 
		 }
	  		if (sanphamId!=0){
	  			HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
		 		 Sanpham sanpham = sanphamService.getSanpham(sanphamId);
		 		 Giohang giohang = giohangs.get(sanphamId);
	             giohang.setSanpham(sanpham);;
	             giohang.setSoluong(soluong);
	             giohangs.put(sanphamId, giohang);
	             session.setAttribute("myGiohangs", giohangs);
	             session.setAttribute("myTongtien", totalPrice(giohangs));
	             session.setAttribute("myGiohangs", giohangs);
			        session.setAttribute("myTongtien", totalPrice(giohangs));
	  		}
	  		
	        return "redirect:/giohang/";
	    }
	    
	 
	

	    @RequestMapping(value = "/remove/{sanphamId}", method = RequestMethod.GET)
	    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("sanphamId") Integer sanphamId) {
	    	HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
	        if (giohangs == null) {
	            giohangs = new HashMap<>();
	        }
	        if (giohangs.containsKey(sanphamId)) {
	            giohangs.remove(sanphamId);
	        }
	        session.setAttribute("myGiohangs", giohangs);
	        session.setAttribute("myTongtien", totalPrice(giohangs));
	        return  "redirect:/giohang/";
	    }

	 
	    public double totalPrice(HashMap<Integer, Giohang> giohangs) {
	        int count = 0;
	        for (Map.Entry<Integer, Giohang> list : giohangs.entrySet()) {
	            count += list.getValue().getSanpham().getGia() * list.getValue().getSoluong();
	        }
	        return count;
	    }
	    


}
