package org.travel.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.travel.base.Message;
import org.travel.common.Common;
import org.travel.common.Constant;
import org.travel.config.security.EncrytedPasswordUtils;
import org.travel.organization.bo.OrganizationBO;
import org.travel.user.bean.UserBean;
import org.travel.user.bo.UserBO;
import org.travel.user.form.UserForm;
import org.travel.user.service.UserService;
import org.travel.userrole.bo.UserRoleBO;

@Controller
@RequestMapping("/admin/v1")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getHomePage(Model model, HttpServletRequest req) {

		UserForm userForm = new UserForm();
		userForm.setPage(1L);
		userForm.setMaxPageItem(10L);
		userForm.setSortBy("DESC");
		userForm.setSortName("createDate");
		model.addAttribute("userForm", userForm);
		req.setAttribute("page", userForm.getPage());
		List<UserBean> userBeans = userService.search(userForm);
		int totalPages = (int)Math.ceil((double) userService.getCount()/userForm.getMaxPageItem());
		req.setAttribute("totalPages", totalPages);
		req.getSession().setAttribute("users", userBeans);
		return "userPage";
	}

	@RequestMapping(value = "/user/list", method = RequestMethod.POST)
	public String searchUser(@RequestBody UserForm userForm, HttpServletRequest req) {
		int totalPages = (int)Math.ceil((double) userService.getCount()/userForm.getMaxPageItem());
		req.setAttribute("totalPages", totalPages);
		List<UserBean> userBeans = userService.search(userForm);
		req.setAttribute("users", userBeans);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("page", userForm.getPage());
		return "listUser";
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.POST)
	public String pageSaveUser(@PathVariable("id") Long id, Model model, HttpServletRequest req) {
		
		UserForm userForm = new UserForm();
		if (id != 0L) {
			UserBO userBO = userService.findById(id).get();
			userForm.setId(userBO.getId());
			userForm.setCode(userBO.getCode());
			userForm.setOganizationnalId(userBO.getOrganizationnalId());
			userForm.setUsername(userBO.getUsername());
			userForm.setEmail(userBO.getEmail());
			userForm.setStatus(userBO.getStatus());
			userForm.setOganizationnalId(userBO.getOrganizationnalId());
			userForm.setPhoneNumber(userBO.getPhoneNumber());
			userForm.setDateOfBirh(Common.convertDateToString(userBO.getDateOfBirh()));
			userForm.setAddress(userBO.getAddress());
			userForm.setIdNumber(userBO.getIdNumber());
			userForm.setPhoneNumber(userBO.getPhoneNumber());
			userForm.setName(userBO.getName());
		}
		model.addAttribute("userFormSave", userForm);
		return "saveUser";
	}

	@RequestMapping(value = "/user/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteUser(@PathVariable("id") Long id, HttpServletRequest req, HttpServletResponse resp) {
		
		UserBO userBo = userService.findById(id).orElse(new UserBO());
		if (Common.isNullOrEmpty(userBo.getId())) {
			return Common.createMessage("Người dùng không tồn tại trong hệ thống", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		userService.deleteUser(userBo);
		return Common.createMessage("Xóa thành công người dùng", Constant.Message.Success, HttpServletResponse.SC_OK,
				resp);
	}

	@RequestMapping(value = "/user/refresh/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message resetUser(@PathVariable("id") Long id, HttpServletRequest req, HttpServletResponse rep,
			HttpServletResponse resp) {
		
		UserBO userBo = userService.findById(id).orElse(new UserBO());
		if (Common.isNullOrEmpty(userBo.getId())) {
			return Common.createMessage("Người dùng không tồn tại trong hệ thống", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userBo.getStatus() == 1L) {
			userBo.setResetPassword(0L);
			String password = EncrytedPasswordUtils.createPassword();
			userService.sendWarning("Mật khẩu của bạn là: " + password +". Hãy đổi mật khẩu để có thể đăng nhập", userBo.getPhoneNumber(), userBo.getEmail());
			userBo.setPassword(EncrytedPasswordUtils.createEncrytedPassword(password));
		} else {
			return Common.createMessage("Người dùng đã bị khóa", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		userService.saveUserStatus(userBo);
		return Common.createMessage("Cập nhật người dùng thành công", Constant.Message.Success,
				HttpServletResponse.SC_OK, resp);
	}

	@RequestMapping(value = "/user/lock/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message lockUser(@PathVariable("id") Long id, HttpServletRequest req, HttpServletResponse rep,
			HttpServletResponse resp) {
		
		UserBO userBo = userService.findById(id).orElse(new UserBO());
		if (Common.isNullOrEmpty(userBo.getId())) {
			return Common.createMessage("Người dùng không tồn tại trong hệ thống", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userBo.getStatus() == 1L) {
			userBo.setStatus(0L);
		} else {
			userBo.setStatus(1L);
		}
		userService.saveUserStatus(userBo);
		return Common.createMessage("Cập nhật trạng thái thành công", Constant.Message.Success,
				HttpServletResponse.SC_OK, resp);
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	@ResponseBody
	public Message saveUser(Model model, @RequestBody UserForm userForm, HttpServletRequest req,
			HttpServletResponse resp) {
		
		model.addAttribute("userForm", new UserForm());
		Message message = userService.saveOrUpdate(userForm, req, resp);
		if (!Common.isNullOrEmpty(message)) {
			return message;
		}
		return Common.createMessage("thành công", Constant.Message.Success, HttpServletResponse.SC_OK, resp);
	}

	@RequestMapping(value = "/user/role/{id}", method = RequestMethod.GET)
	public String getRole(@PathVariable("id") Long id, HttpServletRequest req) {
		
		req.setAttribute("id", id);
		List<String> roles = userService.getRoles();
		List<String> roleUser = userService.getRolesUser(id);
		req.setAttribute("roles", roles);
		req.setAttribute("roleUser", roleUser);
		return "roleUser";
	}

	@RequestMapping(value = "/user/role/{roleName}/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message addRole(@PathVariable("roleName") String roleName, @PathVariable("id") Long id,
			HttpServletRequest req, HttpServletResponse resp) {

		req.setAttribute("id", id);
		List<String> roles = userService.getRoles();
		List<String> roleUser = userService.getRolesUser(id);
		if (roleUser.indexOf(roleName) >= 0) {
			return Common.createMessage("Người dùng đã có quyền này", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (roles.indexOf(roleName) == -1) {
			return Common.createMessage("Quyền người dùng không tồn tại", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		userService.saveRolesUser(id, roleName);

		return Common.createMessage("thành công", Constant.Message.Success, HttpServletResponse.SC_OK, resp);
	}

	@RequestMapping(value = "/user/role/remove/{roleName}/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message removeRole(@PathVariable("roleName") String roleName, @PathVariable("id") Long id,
			HttpServletRequest req, HttpServletResponse resp) {
		
		List<String> roles = userService.getRoles();
		List<String> roleUser = userService.getRolesUser(id);
		if (roleUser.indexOf(roleName) == -1) {
			return Common.createMessage("Người dùng không có quyền này", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (roles.indexOf(roleName) == -1) {
			return Common.createMessage("Quyền người dùng không tồn tại", Constant.Message.Error,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		UserRoleBO userRoleBo = userService.getUserRole(roleName, id);
		userService.deleteRolesUser(userRoleBo);
		return Common.createMessage("thành công", Constant.Message.Success, HttpServletResponse.SC_OK, resp);
	}

	@ModelAttribute("organizationBos")
	public Map<Long, String> getCountryList() {
		
		List<OrganizationBO> listOrganizationBo = userService.listOrganization();
		Map<Long, String> organizationBos = new HashMap<Long, String>();
		for (OrganizationBO organizationBO : listOrganizationBo) {
			organizationBos.put(organizationBO.getId(), organizationBO.getOrgName());
		}

		return organizationBos;
	}
}
