package org.woo.web.su.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/success/*")
public class SuController {
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success(Model model,HttpSession session) {
	
		
		
		return "success/success"; 
	}
}
