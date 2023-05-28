package com.justin.Project.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.justin.Project.models.BreedComparator;
import com.justin.Project.models.Pets;
import com.justin.Project.models.Quiz;
import com.justin.Project.models.TypeComparator;
import com.justin.Project.models.User;
import com.justin.Project.services.PetsService;
import com.justin.Project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PetsController {
	@Autowired
	UserService userServ;
	
	@Autowired
	PetsService petsServ;
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		Long userID = (Long) session.getAttribute("user_id");
		if(userID != null) {
			User user = userServ.findByID(userID);
			model.addAttribute("user",user);
			session.setAttribute("user", user);
			return "index.jsp";	
		}
		return "index.jsp";
		}
	
	@GetMapping("/thoughts")
	public String thoughts(HttpSession session, Model model) {
		if(session.getAttribute("user_id") != null) {
			Long userID = (Long) session.getAttribute("user_id");
			User user = userServ.findByID(userID);
			model.addAttribute("user",user);
			
		}
		List<Pets> Pets = petsServ.findAll();
		Collections.sort(Pets, new TypeComparator());
		Set<String> uniqueAttributes = new HashSet<>();
		for(Pets pets: Pets) {
			uniqueAttributes.add(pets.getType());
		}
		List<String> uniqueAttributeList = new ArrayList<>(uniqueAttributes);
		model.addAttribute("pet",uniqueAttributeList);
		return "thoughts.jsp";
	}
	
	@GetMapping("/add")
	public String add(HttpSession session, Model model,@ModelAttribute("newPet")Pets pet) {
		Long userID = (Long) session.getAttribute("user_id");
		User user = userServ.findByID(userID);
		model.addAttribute("user",user);
		return "AddPet.jsp";
	}
	
	@PostMapping("/adding/pet")
	public String petProcessing(@Valid @ModelAttribute("newPet")Pets pet, BindingResult result, Model model,HttpSession session) {
		Long userID = (Long) session.getAttribute("user_id");
		if(result.hasErrors()) {
			return "AddPet.jsp";
		}
		User user = userServ.findByID(userID);
		pet.setUser(user);
		petsServ.create(pet);
		
		return "redirect:/thoughts";
	}
	
	@GetMapping("/breeds/{type}")
	public String breeds(Model model, @PathVariable("type")String type,HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			Long userID = (Long) session.getAttribute("user_id");
			User user = userServ.findByID(userID);
			model.addAttribute("user",user);
		}
		List<Pets> Pets = petsServ.findAll();
		Collections.sort(Pets, new BreedComparator());
		Set<String> uniqueBreeds = new HashSet<>();
		List<Pets> uniquePets = new ArrayList<>();
		for(Pets pet:Pets) {
			if(uniqueBreeds.add(pet.getBreed())) {
				uniquePets.add(pet);
			}
		}
		model.addAttribute("Pets",uniquePets);
		model.addAttribute("type", type);
		return "breeds.jsp";
	}
	
	@GetMapping("/breeds/posts/{breed}")
		public String breedPosts(@PathVariable("breed")String breed, HttpSession session, Model model) {
		if(session.getAttribute("user_id") != null) {
			Long userID = (Long) session.getAttribute("user_id");
			User user = userServ.findByID(userID);
			model.addAttribute("user", user);
		}
		List<Pets> pets = petsServ.findAll();
		model.addAttribute("pets", pets);
		model.addAttribute("breed", breed);
		return "postsList.jsp";
		}
	
	@GetMapping("/view/{id}")
	public String view(@PathVariable("id")Long id, HttpSession session, Model model) {
		if(session.getAttribute("user_id")!= null) {
			Long userID = (Long) session.getAttribute("user_id");
			User user = userServ.findByID(userID);
			session.setAttribute("user", user);
			model.addAttribute("user", user);			
		}
		Pets pet = petsServ.findById(id);
		model.addAttribute("pet",pet);
		return "viewPost.jsp";
	}
	
	@GetMapping("/about")
	public String about(Model model, HttpSession session) {
		model.addAttribute("user",session.getAttribute("user"));
		return "about.jsp";
	}
	
	@GetMapping("/quiz")
	public String quiz(@ModelAttribute("pet")Quiz quiz) {
		return "quiz.jsp";
	}
	
	@PostMapping("/quiz/process")
	public String processQuiz(@ModelAttribute("pet")Quiz quiz) {
		if(quiz.getAnswer().equals("cat")) {
			return "redirect:/";
		}
		System.out.println(quiz.getAnswer());
		return "redirect:/about";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
}
