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

	// 로그인 폼을 띄우는 부분
	@RequestMapping(value = "/lognForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm"; // /login/loginForm.jsp를 띄움.
	}// end of loginForm

	
	// 성공
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() {
		return "login/success"; 
	}
	
	
	// 로그인 처리하는 부분
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, UserVO vo) throws Exception {
		System.out.println(vo);
		
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}

        // 로그인이 성공하면 UserVO 객체를 반환함.
		System.out.println(service.login(vo));

		 
		
		if (vo != null) { // 로그인 성공
			session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.
			returnURL = "redirect:/login/success"; // 로그인 성공시 게시글 목록페이지로 바로 이동하도록 하고
		} else { // 로그인에 실패한 경우
			returnURL = "redirect:/login//lognForm"; // 로그인 폼으로 다시 가도록 함
		}
		
		
		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	// 로그아웃 하는 부분
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 전체를 날려버림
		// session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
		return "redirect:/login/success"; // 로그아웃 후 게시글 목록으로 이동하도록...함
	}

}
