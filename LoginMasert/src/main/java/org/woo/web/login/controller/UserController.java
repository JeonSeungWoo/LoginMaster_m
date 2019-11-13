package org.woo.web.login.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.woo.web.login.domain.UserVO;
import org.woo.web.login.service.UserService;

@Controller
@RequestMapping(value = "/login/*")
public class UserController {

	@Inject
	UserService service;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// �α��� ���� ���� �κ�
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm"; // /login/loginForm.jsp�� ���.
	}// end of loginForm

	//시큐리티 적용전.
//	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
//	public String loginProcess(HttpSession session, UserVO dto)throws Exception {
//		String returnURL = "";
//		if (session.getAttribute("login") != null) {
//			// 기존에 login이란 세션 값이 존재한다면
//			session.removeAttribute("login"); // 기존값을 제거해 준다.
//		}
//         
//		UserVO vo = service.login(dto);
//
//		if (vo != null) { // 로그인 성공
//			session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.
//			returnURL = "redirect:/board/listPage"; // 로그인 성공시 게시글 목록페이지로 바로 이동하도록 하고
//		} else { // 로그인에 실패한 경우
//			returnURL = "redirect:/login"; // 로그인 폼으로 다시 가도록 함
//		}
//		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
//	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, UserVO dto) throws Exception {
		//시큐리티를 적용하게 되면 mapper의 로그인을 변경 해야 한다. (pw가 변하기 때문에 pw로 비교하기엔 문제가 있다.)
		System.out.println(dto);
		String returnURL = "";
		// 기존에 login이란 세션 값이 존재한다면 기존값을 제거해 준다.
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}

		String inpw = dto.getUserpw();
		// 입력한 페스워드 암호화
		String encryptPassword = passwordEncoder.encode(inpw);
		// 암호화 저장.
		dto.setUserpw(encryptPassword);
		System.out.println(dto);
		UserVO vo = service.login(dto);
		System.out.println(vo);
		// nullCheck
		if (vo != null) {
			// 등어온 pw 와 DB의 가 같으면
			if (passwordEncoder.matches(inpw, vo.getUserpw())) {
				System.out.println("계정정보 일치");
				// 세션에 로그인한 객체 저장
				session.setAttribute("login", vo);

				returnURL = "redirect:/success/success";
			} else {
				// 로그인에 실패한 경우
				System.out.println("계정정보 불일치");
				returnURL = "redirect:/login/loginForm";
			}
		} else {
			returnURL = "redirect:/login/loginForm";
		}

		return returnURL; //
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/login/loginForm";
	}

	@RequestMapping(value = "/insertForm", method = RequestMethod.GET)
	public String idInsertForm() throws Exception {
		return "/login/insertForm";
	}

	@RequestMapping(value = "/loginCreate", method = RequestMethod.POST)
	public String loginCreate(Model model, UserVO vo) throws Exception {
		System.out.println(vo);
		String[] getPhone = vo.getPhonenumber().split(",");
		String phoneNum = getPhone[0] + getPhone[1] + getPhone[2];
		vo.setPhonenumber(phoneNum);
		service.loginCreate(vo);
		return "redirect:/login/loginForm";
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public void checkId(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		PrintWriter out = res.getWriter();
		try {
			String parmid = (req.getParameter("userid") == null) ? "" : String.valueOf(req.getParameter("userid"));
			UserVO vo = new UserVO();
			vo.setUserid(parmid.trim());
			Integer checkPoint = service.checkId(vo);
			out.print(checkPoint);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
	}

}
