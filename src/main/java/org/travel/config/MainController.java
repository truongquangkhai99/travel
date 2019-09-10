package org.travel.config;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


public class MainController {

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(Model model) {
		return "homePage";
	}

	@RequestMapping(value = { "/detail" }, method = RequestMethod.GET)
	public String contactusPage(Model model) {
		return "detail";
	}

}