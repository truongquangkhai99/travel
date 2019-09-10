package org.travel.web.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebController {
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String getLogin() {
		return "loginPage";
	}
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String getHome() {
		return "homePage";
	}
	@RequestMapping(value = { "/403" }, method = RequestMethod.GET)
	public String get() {
		return "403";
	}
	@RequestMapping(value = { "/detail" }, method = RequestMethod.GET)
	public String getDetail() {
		return "detail";
	}
}
