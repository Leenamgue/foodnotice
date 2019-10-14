package com.java.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.board.bean.*;

@Controller
public class DataController {
	
	@Autowired
	SqlSession session;
	
	@PostMapping("/")
	public ModelAndView home(HttpServletRequest request, UserInfo user, HttpSession httpSession) {
//		HttpSession httpSession = request.getSession();
		//httpSession.removeAttribute("logIn") session 삭제
		//httpSession.getAttribute("logIn") session 가져오기
		ModelAndView mav = new ModelAndView();
		boolean result = loginBoolean(request,user);
		String id = request.getParameter("id");
		if(result) {
			System.out.println(user);
			httpSession.setAttribute("logIn", user);
			httpSession.setAttribute("id", id);
			System.out.println("test: " + httpSession.getAttribute("logIn"));
			mav.setViewName("redirect:/board");
		}else{
			mav.setViewName("home");
			mav.addObject("msg", "failure");
		}		
		return mav;
	}
	
	private boolean loginBoolean(HttpServletRequest request, UserInfo user) {
		List<UserInfo> list = session.selectList("test.loginCheck" , user);
		boolean result = false;
		if(list.size() == 1) {
			result= true;
		}
		return result;
	}
	
	@GetMapping("/board")
	public String search(HttpSession hs, HttpServletRequest req) {
		System.out.println("1111");
		System.out.println(hs.getAttribute("logIn"));		
		UserInfo userinfo = (UserInfo) hs.getAttribute("logIn");
		System.out.println(userinfo);		
		String id = userinfo.getId();		
		System.out.println();
		req.setAttribute("id", id);	
		System.out.println(id);		
		return "board";		
	}
	
	@GetMapping("/search")
	public  String board(HttpServletRequest request, BoardBean bb, HttpSession httpSession) {
		System.out.println("222222");
			
			 //세션 가져오기 userinfo 로 넣어 줬기때문에 변환함
			List<BoardBean> list = session.selectList("test.select", bb);
			System.out.println(httpSession.getAttribute("id"));
			HttpSession hsession = request.getSession();
//			String id = httpSession.getAttribute("id").toString();
			System.out.println(hsession.getAttribute("id"));
			request.setAttribute("list", list); //게시글 내용 가져 오기
//			request.setAttribute("id", id);
			return "search";
	}
	
	@PostMapping("/insert")
	public  String insert(HttpServletRequest request,BoardBean bb, HttpSession httpSession) { 
		UserInfo user = (UserInfo) httpSession.getAttribute("logIn");
		System.out.println("userId: " + user.getId());
		request.setAttribute("id", user.getId());		
		request.getAttribute(user.getId());
		session.selectOne("test.insert", bb);
		
		return "redirect:/search";
	}
	
	@GetMapping("/board_Detail")
	public  String detail(HttpServletRequest request,  BoardBean bb, HttpSession httpSession) {
		UserInfo user = (UserInfo) httpSession.getAttribute("logIn");
		request.setAttribute("id", user.getId());
		//
		if(request.getParameter("no") != null) {
			request.setAttribute("info", session.selectOne("test.select", bb));
		}else {
			request.setAttribute("info", bb);
		}
		return "/board_Detail";
	}
	
	@PostMapping("/update")
	public  String update(HttpServletRequest request, BoardBean bb) {
		session.update("test.update", bb);
		return "redirect:/search";
	}
	
	@PostMapping("/delete")
	public  String delete(HttpServletRequest request, BoardBean bb) {
		session.update("test.delete", bb);
		return "redirect:/search";
	}
	
	@PostMapping("/signIn/check")
	public String signIn_check(HttpServletRequest request, UserInfo UI) {
		System.out.println("signIn");
		session.insert("test.userInsert", UI);
		return "redirect:/";
	}
	
	@PostMapping("/id_check")
	public void id_check(HttpServletRequest request, UserInfo UI,HttpServletResponse response) {
		boolean result = false;
		System.out.println("" + session.selectOne("test.sign_check", UI));
		
		if(session.selectOne("test.sign_check", UI) == null) {
			result = false;
		}else if( (boolean) session.selectOne("test.sign_check", UI)) {
			result = true;
		}
		try {
			response.getWriter().print(result); //json 파일로 보내기
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//////
	@GetMapping("/db")
	public String db() {
		String result = session.selectOne("test.select");
		System.out.println(result);
		return "home";
	}
	
	@GetMapping("/notice")
	public String select(HttpServletRequest req, Model m) {
		if(req.getParameter("req") != null) {
			String no = req.getParameter("req");
			List<ListBean> list = session.selectList("board.tt", no);
			m.addAttribute("list", list);
			return "write2";
		}
		List<ListBean> list = session.selectList("board.select");
		System.out.println(list.size());
		req.setAttribute("list", list);
		return "notice";
	}
	
	@GetMapping("/n_insert")
	public String insert(HttpServletRequest req) {
		session.insert("board.insert", new ListBean("",  req.getParameter("title"), req.getParameter("txt")));
		return "redirect:/notice";
	}
	
	@GetMapping("/n_update")
	public String update(HttpServletRequest req) {
		System.out.println("No :" +req.getParameter("no"));
		System.out.println("title :" +req.getParameter("title"));
		System.out.println("txt :" +req.getParameter("txt"));
		session.update("board.update", new ListBean(req.getParameter("no"), req.getParameter("title"), req.getParameter("txt")));
		System.out.println("test");
		return "redirect:/notice";
	}
	
	@GetMapping("/n_delete")
	public String delete(HttpServletRequest req) {
		session.update("board.delete", new ListBean(req.getParameter("no"), req.getParameter("title"), req.getParameter("txt")));
		
		return "redirect:/notice";
	}
	
	
}
