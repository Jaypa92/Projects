package com.justin.Project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.justin.Project.models.LogInUser;
import com.justin.Project.models.User;
import com.justin.Project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	@Autowired
	UserService userServ;
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("oldUser",new LogInUser());
		return "login.jsp";
	}
	
	@GetMapping("/register")
	public String register(@ModelAttribute("newUser")User user) {
		return "register.jsp";
	}
	
	@PostMapping("/registering")
	public String register(@Valid @ModelAttribute("newUser")User user,BindingResult result,Model model,HttpSession session) {
		if(userServ.findByEmail(user.getEmail())!= null) {
			result.rejectValue("email", "Unique","Email already in use!");
		}
		if(!user.getPassword().equals(user.getConfirmPassword())) {
			result.rejectValue("password", "Matches","Password doesn't match!");
		}
		if(result.hasErrors()) {
			return "register.jsp";
		}
		User newUser = userServ.create(user);
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/";
	}
	
	@PostMapping("/loggingin")
	public String loginProcess(@Valid @ModelAttribute("oldUser")LogInUser logInUser,BindingResult result,Model model,HttpSession session) {
		User login = userServ.login(logInUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("user_id", login.getId());
		return "redirect:/";
	}
}
