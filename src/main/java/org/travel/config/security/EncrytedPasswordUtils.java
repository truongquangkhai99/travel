package org.travel.config.security;

import java.util.Random;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncrytedPasswordUtils {
	
	// Encryte Password with BCryptPasswordEncoder
	public static String encrytePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}
	
	public static String createEncrytedPassword(String password) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}
	public static String createPassword() {
		Random random = new Random();
		int pass = 1200507+random.nextInt(6200507);
		String password = ""+pass;
		
		return password;
	}

	public static String getUserName() {
		String username = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			 username = ((UserDetails) principal).getUsername();
		} else {
			 username = principal.toString();
		}
		return username;
	}

	public static void main(String[] args) {
		String password = "1";
		String encrytedPassword = encrytePassword(password);

		System.out.println("Encryted Password: " + encrytedPassword);
	}
}
