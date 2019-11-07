package org.woo.web.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.woo.web.login.domain.UserVO;
import org.woo.web.login.service.UserService;

@Controller
@RequestMapping(value = "/login/*")
public class UserController {
	
	@Inject
	UserService service;

	// �α��� ���� ���� �κ�
	@RequestMapping(value = "/lognForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm"; // /login/loginForm.jsp�� ���.
	}// end of loginForm

	
	// ����
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() {
		return "login/success"; 
	}
	
	
	// �α��� ó���ϴ� �κ�
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, UserVO vo) throws Exception {
		System.out.println(vo);
		
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// ������ login�̶� ���� ���� �����Ѵٸ�
			session.removeAttribute("login"); // �������� ������ �ش�.
		}

        // �α����� �����ϸ� UserVO ��ü�� ��ȯ��.
		System.out.println(service.login(vo));

		 
		
		if (vo != null) { // �α��� ����
			session.setAttribute("login", vo); // ���ǿ� login���̶� �̸����� UserVO ��ü�� ������ ��.
			returnURL = "redirect:/login/success"; // �α��� ������ �Խñ� ����������� �ٷ� �̵��ϵ��� �ϰ�
		} else { // �α��ο� ������ ���
			returnURL = "redirect:/login//lognForm"; // �α��� ������ �ٽ� ������ ��
		}
		
		
		return returnURL; // ������ ������ returnURL �� ��ȯ�ؼ� �̵���Ŵ
	}

	// �α׾ƿ� �ϴ� �κ�
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // ���� ��ü�� ��������
		// session.removeAttribute("login"); // �ϳ��� �Ϸ��� �̷��� �ص� ��.
		return "redirect:/login/success"; // �α׾ƿ� �� �Խñ� ������� �̵��ϵ���...��
	}

}
