package com.se.security.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.se.security.demo.dao.HoadonDao;
import com.se.security.demo.entity.Cthoadon;
import com.se.security.demo.entity.Giohang;
import com.se.security.demo.entity.Hoadon;
import com.se.security.demo.entity.Nguoidung;
import com.se.security.demo.entity.Sanpham;
import com.se.security.demo.service.CthoadonService;
import com.se.security.demo.service.HoadonService;
import com.se.security.demo.service.NguoidungService;
import com.se.security.demo.service.SanphamService;


@Controller
@RequestMapping("/dathang")
public class DathangController {
	@Autowired
    private SanphamService sanphamService;
	@Autowired
    private NguoidungService nguoidungService;
	@Autowired
    private HoadonService hoadonService;
	@Autowired
    private CthoadonService cthoadonService;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
    public String viewAll(ModelMap mm, HttpSession session) {
        HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
        if (giohangs == null) {
            giohangs = new HashMap<>();
        }
        session.setAttribute("myGiohangs", giohangs);
        session.setAttribute("myTongtien1", totalPrice(giohangs));
        session.setAttribute("myTongtien2", totalPrice(giohangs)*1.1);
        session.setAttribute("myGiohangs", giohangs);
        
        return "dat-hang";
    }
	@RequestMapping(value = {"/trong"}, method = RequestMethod.GET)
    public String viewTrong(ModelMap mm, HttpSession session) {
        HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
        if (giohangs == null) {
            giohangs = new HashMap<>();
        }
        session.setAttribute("myGiohangs", giohangs);
        session.setAttribute("myTongtien1", totalPrice(giohangs));
        session.setAttribute("myTongtien2", totalPrice(giohangs)*1.1);
        session.setAttribute("myGiohangs", giohangs);
        
        return "dat-hang";
    }
	@RequestMapping(value = {"/tienhanh"}, method = RequestMethod.GET)
	public String tienHanhDatHang(ModelMap mm, HttpSession session, Model theModel) {
		HashMap<Integer, Giohang> giohangs = (HashMap<Integer, Giohang>) session.getAttribute("myGiohangs");
		if (giohangs == null) {
	            giohangs = new HashMap<>();
	        }
		if (giohangs.size()==0) {
			theModel.addAttribute("thongbao","Lỗi: chưa có mặt hàng nào bên trong giỏ hàng, hãy lựa chọn mặt hàng và bấm thêm vào giỏ hàng.");
			return "dat-hang";
		}else {
			java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			Double tt = (Double) session.getAttribute("myTongtien2");
			List<Cthoadon> listct = new ArrayList<Cthoadon>();
			for (Map.Entry<Integer, Giohang> list : giohangs.entrySet()) {
				// count += list.getValue().getSanpham().getGia() * list.getValue().getSoluong();
				int idsp = list.getValue().getSanpham().getId();
				Sanpham sanpham = sanphamService.getSanpham(idsp);
				int sl = list.getValue().getSoluong();
				Double gia = list.getValue().getSanpham().getGia() * list.getValue().getSoluong();
				Cthoadon cthoadon = new Cthoadon(sanpham,sl,gia);
				//cthoadonService.saveCthoadon(cthoadon);
				sanpham.setSoluong(sanpham.getSoluong()-sl);
				sanphamService.saveSanpham(sanpham);
				listct.add(cthoadon);
	        }
			Hoadon hoadon=new Hoadon(date,listct,(Nguoidung) session.getAttribute("myNguoidung"),tt);	
			Integer id = hoadonService.saveHoadon(hoadon);	
			Hoadon hd = hoadonService.getHoadon(id);
			//
			giohangs = new HashMap<>();
			session.setAttribute("myGiohangs", giohangs);
		    session.setAttribute("myTongtien1", totalPrice(giohangs));
		    session.setAttribute("myTongtien2", totalPrice(giohangs)*1.1);
		    session.setAttribute("myGiohangs", giohangs);
		    //
			return "dat-hang-thanh-cong";
		}
		
	}

	 public double totalPrice(HashMap<Integer, Giohang> giohangs) {
	        double count = 0;
	        for (Map.Entry<Integer, Giohang> list : giohangs.entrySet()) {
	            count += list.getValue().getSanpham().getGia() * list.getValue().getSoluong();
	        }
	        return count;
	    }
}
