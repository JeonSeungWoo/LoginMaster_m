package org.woo.web.Interlogin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/interLogin/*")
public class InterLoginController {
	
	
	// �α��� ���� ���� �κ�
	@RequestMapping(value = "/interLoginForm", method = RequestMethod.GET)
	public String interLoginForm() {
		return "interLogin/interLoginForm"; 
	}


}
