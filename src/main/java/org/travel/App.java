package org.travel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class App {

	public static void main(String[] args) {
		 //System.setProperty("tomcat.util.http.parser.HttpParser.requestTargetAllow","|{}");
		SpringApplication.run(App.class, args);
	}

}
