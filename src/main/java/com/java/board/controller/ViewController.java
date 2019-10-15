package com.java.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
	
	@GetMapping("/")
	public String home(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("get!");
//		String id = request.getSession().getAttribute("id").toString();
		return "board";
	}
	
	@GetMapping("/login")
	public String login(HttpSession hs) {
		return "home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession hs) {
		System.out.println(hs.getAttribute(""));
		hs.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/signIn")
	public String signIn() {
		return "/signIn";
	}
	
	////
	@GetMapping("/n_write")
	public String write(HttpServletRequest req) {
		return "write";
	}
	
	
}
