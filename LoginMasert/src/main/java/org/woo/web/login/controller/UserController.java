package org.woo.web.login.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	// �α��� ���� ���� �κ�
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm"; // /login/loginForm.jsp�� ���.
	}// end of loginForm

	// ����

	// �α��� ó���ϴ� �κ�
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, UserVO dto) throws Exception {

		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// ������ login�̶� ���� ���� �����Ѵٸ�
			session.removeAttribute("login"); // �������� ������ �ش�.
		}

		// �α����� �����ϸ� UserVO ��ü�� ��ȯ��.
		UserVO vo = service.login(dto);

		if (vo != null) { // �α��� ����
			session.setAttribute("login", vo); // ���ǿ� login���̶� �̸����� UserVO ��ü�� ������ ��.
			returnURL = "redirect:/success/success"; // �α��� ������ �Խñ� ����������� �ٷ� �̵��ϵ��� �ϰ�
		} else { // �α��ο� ������ ���
			returnURL = "redirect:/login/loginForm"; // �α��� ������ �ٽ� ������ ��
		}

		return returnURL; // ������ ������ returnURL �� ��ȯ�ؼ� �̵���Ŵ
	}

	// �α׾ƿ� �ϴ� �κ�
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // ���� ��ü�� ��������
		// session.removeAttribute("login"); // �ϳ��� �Ϸ��� �̷��� �ص� ��.
		return "redirect:/login/loginForm"; // �α׾ƿ� �� �Խñ� ������� �̵��ϵ���...��
	}

	@RequestMapping(value = "/insertForm", method = RequestMethod.GET)
	public String idInsertForm() throws Exception {
		return "/login/insertForm";
	}

	@RequestMapping(value = "/loginCreate", method = RequestMethod.POST)
	public String loginCreate(Model model, UserVO vo) throws Exception {
		System.out.println(vo);
		String[] getPhone = vo.getPhonenumber().split(",");
		String phoneNum = getPhone[0]+getPhone[1]+getPhone[2];
		vo.setPhonenumber(phoneNum);
		service.loginCreate(vo);
		return "redirect:/login/loginForm";
	}
	
	
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public void checkId(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
	PrintWriter out = res.getWriter();
		try {
	String parmid = (req.getParameter("userid")== null)? "" : String.valueOf(req.getParameter("userid"));
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
