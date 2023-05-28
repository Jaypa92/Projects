package com.justin.Project.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.justin.Project.models.LogInUser;
import com.justin.Project.models.User;
import com.justin.Project.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepo;
	
	public User create(User user) {
		String hashPW = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashPW);
		return userRepo.save(user);
	}
	
	public User findByEmail(String email) {
		Optional<User> user = userRepo.findByEmail(email);
		if(user.isPresent()) {
			return user.get();
		}
		return null;
	}
	
	public User findByID(Long id) {
		Optional<User> user = userRepo.findById(id);
		if(user.isPresent()) {
			return user.get();
		}
		return null;
	}
	
	public User login(LogInUser logInUser,BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		User loginUser = findByEmail(logInUser.getEmail());
		if(loginUser==null) {
			result.rejectValue("email", "Unique","Bad Credentials!");
		}
		if(!BCrypt.checkpw(logInUser.getPassword(), loginUser.getPassword())) {
			result.rejectValue("password", "Matches","Bad Credentials!");
		}
		return loginUser;
	}
}
