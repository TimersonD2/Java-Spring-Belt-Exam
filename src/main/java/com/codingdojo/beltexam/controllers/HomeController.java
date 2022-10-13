package com.codingdojo.beltexam.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.beltexam.models.LoginUser;
import com.codingdojo.beltexam.models.User;
import com.codingdojo.beltexam.services.ShowService;
import com.codingdojo.beltexam.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ShowService showService;
	
	@GetMapping("/")
	private String index(Model model) {
		
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
       
		return "index.jsp";
	}
	
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	
    	Long userId = (Long) session.getAttribute("userId");
    	if(userService.getSessionUser(session) == null) return "redirect:/";

    	model.addAttribute("allShows", showService.getAllShows());
        User user = userService.getUser(userId);
        model.addAttribute("validUser", user);

      	return "dashboard.jsp";
    }

    
}
