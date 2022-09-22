package com.minh.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.minh.dao.AccountDAO;
import com.minh.dao.DetailDAO;
import com.minh.dao.ProductDAO;
import com.minh.entity.Detail;
import com.minh.entity.Product;


// Tạo biểu đồ cột và tròn
@Controller
public class GraphController {
	@Autowired DetailDAO detaildao;
	@Autowired AccountDAO accountdao;
	@Autowired ProductDAO productdao;
	
	@GetMapping("/displayBarGraph")
	public String barGraph(Model model) {
		List<Product> list = productdao.findAll();
		Map<String, Integer> surveyMap = new LinkedHashMap<>();
	
		for (int i = 0; i < list.size(); i++) {
			surveyMap.put(list.get(i).getName(), list.get(i).getQty());
			
		}
		model.addAttribute("surveyMap", surveyMap);
		model.addAttribute("pro", "tồn kho");
		return "auth/barGraph";
	}
	
	@GetMapping("/displayBarGraph1")
	public String barGraph1(Model model) {
		List<Product> list = productdao.findAll();
		Map<String, Integer> surveyMap = new LinkedHashMap<>();
		for (int i = 0; i < list.size(); i++) {
			surveyMap.put(list.get(i).getName(), 100-list.get(i).getQty());
		}
		model.addAttribute("surveyMap", surveyMap);
		model.addAttribute("pro", "đã bán");
		return "auth/barGraph";
	}

	@GetMapping("/displayPieChart")
	public String pieChart(Model model) {
		List<Detail> list1 = detaildao.findalltrue();
		List<Detail> list2 = detaildao.findallfalse();
		double x = list1.size();
		double y = list2.size();
		System.out.println(y==0?x=100:(x/y)*100);
		model.addAttribute("user2", y==0?x=100:(x/y)*100);
		model.addAttribute("user3", x==0?x=100:(y/x)*100);
		return "auth/pieChart";
	}
}
