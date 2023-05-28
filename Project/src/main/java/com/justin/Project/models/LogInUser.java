package com.justin.Project.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public class LogInUser {
	@NotBlank(message="Field Required!")
	@Email(message="Please enter a valid Email!")
	private String email;
	
	@NotBlank(message="Please enter your Password!")
	private String password;
	
	public LogInUser() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
