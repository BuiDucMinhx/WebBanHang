package com.minh.controller;


import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.minh.service.ProductService;

// Tạo biểu đồ cột và tròn
@Controller
public class GraphController {
	@Autowired ProductService productService;
	
	@GetMapping("/displayBarGraph")
	public String barGraph(Model model) {
		Map<String, Integer> surveyMap = productService.surveyMapInventory();
		model.addAttribute("surveyMap", surveyMap);
		model.addAttribute("pro", "tồn kho");
		return "auth/barGraph";
	}
	
	@GetMapping("/displayBarGraph1")
	public String barGraph1(Model model) {
		Map<String, Integer> surveyMap = productService.surveyMapSold();
		model.addAttribute("surveyMap", surveyMap);
		model.addAttribute("pro", "đã bán");
		return "auth/barGraph";
	}

	@GetMapping("/displayPieChart")
	public String pieChart(Model model) {
		double x = productService.size(1);
		double y = productService.size(2);
		model.addAttribute("user2", y==0?x=100:(x/y)*100);
		model.addAttribute("user3", x==0?x=100:(y/x)*100);
		return "auth/pieChart";
	}
}
