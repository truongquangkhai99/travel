package org.travel.authentication.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.travel.base.Message;
import org.travel.common.Common;
import org.travel.common.Constant;
import org.travel.config.security.EncrytedPasswordUtils;
import org.travel.user.bo.UserBO;
import org.travel.user.dao.UserDAO;
import org.travel.user.form.UserForm;

@Controller
/* @RequestMapping("/admin") */
public class AuthenticationController {
	
	@Autowired
	private UserDAO userDAO;
	@RequestMapping(value = "/password", method = RequestMethod.POST)
	@ResponseBody
	public Message changePassword(@RequestBody UserForm userForm, HttpServletRequest req , HttpServletResponse resp) {
		UserBO userBO = userDAO.findUserByUsername(userForm.getUsername());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(Common.isNullOrEmpty(userBO)) {
			return Common.createMessage("Tên đăng nhập không đúng", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if(!userForm.getNewPassword().equals(userForm.getRepeatPassword())) {
			return Common.createMessage("Mật khẩu nhập không khớp", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if(encoder.matches(userForm.getPassword(), userBO.getPassword())==false) {
			return Common.createMessage("Mật khẩu không đúng", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}if(userForm.getNewPassword().length()<8) {
			return Common.createMessage("Mật khẩu cần dài hơn 8 ký tự", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		userBO.setPassword(EncrytedPasswordUtils.createEncrytedPassword(userForm.getNewPassword()));
		userBO.setResetPassword(1L);
		userBO.setPasswordChanged(1L);
		userDAO.save(userBO);
		return Common.createMessage("Thành công", Constant.Message.Success,
				HttpServletResponse.SC_OK, resp);
		
	}
	
}
