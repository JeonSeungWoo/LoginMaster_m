package org.woo.web.su.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/success/*")
public class SuController {
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() {
		return "success/success"; 
	}
}
