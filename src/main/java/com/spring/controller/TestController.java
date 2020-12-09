package com.spring.controller;

import com.spring.Service.ExpenditureService;
import com.spring.domain.Expenditure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class TestController {
	@Autowired
	ExpenditureService expenditureService;
	@RequestMapping("/welcome")
	public String firstPage() {
		return "welcome.base";
	}
	
	@RequestMapping("/home")
	public String homeView() {
		return "home";
	}

	@RequestMapping(value = "/getDataExpenditureById", method = RequestMethod.GET)
	public @ResponseBody
	List<Expenditure> getDataExpenditureById(HttpSession session){
		try{
			List<Expenditure> result = expenditureService.getExpenditureAll();
			return result;
		}catch (Exception e){
			System.out.println("Exception : "+e);
			throw new RuntimeException(e.getMessage());
		}
	}
	@RequestMapping(value = "/ajaxInsertExpenditure", method = RequestMethod.POST)
	public @ResponseBody
	List<Map<String,Object>> ajaxInsertExpenditure(@RequestBody String json, HttpSession session){
		try{
			List<Map<String,Object>> result = expenditureService.insertExpenditure(json);
			return result;
		}catch (Exception e){
			System.out.println("Exception : "+e);
			throw new RuntimeException(e.getMessage());
		}
	}



}
