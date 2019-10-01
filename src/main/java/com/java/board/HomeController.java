package com.java.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		return "board";
	}	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView home(HttpServletRequest request, UserInfo user) {
		HttpSession httpSession = request.getSession();
		//httpSession.removeAttribute("logIn") session 삭제
		//httpSession.getAttribute("logIn") session 가져오기
		ModelAndView mav = new ModelAndView();
		boolean result = loginBoolean(request,user);
		String id = request.getParameter("id");
		if(result) {
			System.out.println(user);
			httpSession.setAttribute("logIn", user);
			mav.setViewName("redirect:/board");
		}else{
			mav.setViewName("home");
			mav.addObject("msg", "failure");
		}		
		return mav;
	}	
	
	//login 체크 하는 내용
	public boolean loginBoolean(HttpServletRequest request, UserInfo user) {
		List<UserInfo> list = session.selectList("test.loginCheck" , user);
		boolean result = false;
		if(list.size() == 1) {
			result= true;
		}
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession hs) {
		System.out.println(hs.getAttribute(""));
		hs.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/login")
	public String login(HttpSession hs) {
		
		return "home";
	}
	
	@RequestMapping("/search")
	public String search(HttpSession hs, HttpServletRequest req) {
		System.out.println(hs.getAttribute("logIn"));		
		UserInfo userinfo = (UserInfo) hs.getAttribute("logIn");
		if(userinfo != null) {
			String id = userinfo.getId();
			
			return "search";
		}else {
			
		}
		return "search";
		
		
		
	}
	
}