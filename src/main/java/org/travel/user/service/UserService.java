package org.travel.user.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.travel.base.Message;
import org.travel.common.Common;
import org.travel.common.Constant;
import org.travel.config.security.EncrytedPasswordUtils;
import org.travel.organization.bo.OrganizationBO;
import org.travel.role.bo.RoleBO;
import org.travel.role.dao.RoleDAO;
import org.travel.role.dao.RoleReposytory;
import org.travel.user.bean.UserBean;
import org.travel.user.bo.UserBO;
import org.travel.user.dao.OrganizationDAO;
import org.travel.user.dao.UserDAO;
import org.travel.user.form.UserForm;
import org.travel.userrole.bo.UserRoleBO;
import org.travel.userrole.dao.UserRoleDAO;

@Service
public class UserService {
	@Autowired
	private EntityManager entityManager;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private RoleDAO roleDao;
	@Autowired
	private UserRoleDAO userRoleDao;
	@Autowired
	private RoleReposytory roleReposytory;
	@Autowired
	OrganizationDAO organizationDao;

	public List<UserBean> search(UserForm userForm) {
		return userDao.search(userForm, entityManager);
	}

	@Transactional
	public Message saveOrUpdate(UserForm userForm, HttpServletRequest req, HttpServletResponse resp) {
		UserBO userBO = null;
		if (!Common.isNullOrEmpty(userForm.getId())) {
			userBO = userDao.findById(userForm.getId()).get();
			userBO.setModifyDate(new Date());
			userBO.setModifyBy(EncrytedPasswordUtils.getUserName());
		} else {
			userBO = new UserBO();
			userBO.setCreateBy(EncrytedPasswordUtils.getUserName());
			userBO.setCreateDate(new Date());
			userBO.setResetPassword(1L);
			userBO.setPassword(EncrytedPasswordUtils.createPassword());
			userBO.setPasswordChanged(0L);
		}
		if (Common.isNullOrEmpty(userForm.getUsername())) {
			return Common.createMessage("Không được để trống tên đăng nhập", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getCode())) {
			return Common.createMessage("Không được để trống mã nhân viên", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getOganizationnalId())) {
			return Common.createMessage("Không được để trống đơn vị", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getStatus())) {
			return Common.createMessage("Không được để trống trạng thái", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getEmail())) {
			return Common.createMessage("Không được để trống email", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getPhoneNumber())) {
			return Common.createMessage("Không được để trống số điện thoại", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getAddress())) {
			return Common.createMessage("Không được để trống địa chỉ", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(Common.convertStringToDate(userForm.getDateOfBirh()))) {
			return Common.createMessage("Không được để ngày sinh", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getName())) {
			return Common.createMessage("Không được để trống họ tên", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userForm.getIdNumber())) {
			return Common.createMessage("Không được để trống chứng minh thư", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		// kiểm tra username đã tồn tại trong trường hợp thêm mới
		if (!Common.isNullOrEmpty(userDao.findUserByUsername(userForm.getUsername()))
				&& userForm.getUsername().equals(userBO.getUsername()) == false) {
			return Common.createMessage("Tên đăng nhập đã tồn tại", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (!Common.isNullOrEmpty(userDao.findUserByEmail(userForm.getEmail()))
				&& userForm.getEmail().equals(userBO.getEmail()) == false) {
			return Common.createMessage("Email đã được sử dụng", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (!Common.isNullOrEmpty(userDao.findUserByCode(userForm.getCode()))
				&& userForm.getCode().equals(userBO.getCode()) == false) {
			return Common.createMessage("Mã nhân viên đã được sử dụng", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (!Common.isNullOrEmpty(this.validateLeght(userForm, req, resp))) {
			return this.validateLeght(userForm, req, resp);
		}
		if (!Common.isNullOrEmpty(userDao.findUserByIdNumber(userForm.getIdNumber()))
				&& userForm.getIdNumber().equals(userBO.getIdNumber()) == false) {
			return Common.createMessage("Số chứng minh thư đã tồn tại", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (Common.isNullOrEmpty(userBO.getId())) {
			String password = EncrytedPasswordUtils.createPassword();
			userBO.setPassword(EncrytedPasswordUtils.createEncrytedPassword(password));
			userDao.sendWarning("mật khẩu của bạn là: " + password + ".Hãy đổi mật khẩu để có thể đăng nhập",
					userForm.getEmail(), userForm.getPhoneNumber(), entityManager);
		}
		userBO.setCode(userForm.getCode());
		userBO.setUsername(userForm.getUsername());
		userBO.setOrganizationnalId(userForm.getOganizationnalId());
		userBO.setStatus(userForm.getStatus());
		userBO.setEmail(userForm.getEmail());
		userBO.setPhoneNumber(userForm.getPhoneNumber());
		userBO.setAddress(userForm.getAddress());
		userBO.setDateOfBirh(Common.convertStringToDate(userForm.getDateOfBirh()));
		userBO.setName(userForm.getName());
		userBO.setIdNumber(userForm.getIdNumber());
		userDao.saveOrUpdate(userBO, entityManager);
		return null;
	}

	public Optional<UserBO> findById(Long id) {
		return userDao.findById(id);
	}

	public List<String> getRoles() {
		return roleDao.getAllRoleNames();
	}
	public Long getCount() {
		return userDao.count();
	}
	public List<String> getRolesUser(Long id) {
		return roleDao.getRoleNames(id);
	}

	public void saveRolesUser(Long id, String roleName) {
		UserBO userBO = userDao.findById(id).get();
		RoleBO roleBO = roleReposytory.findByName(roleName);
		UserRoleBO userRoleBO = new UserRoleBO();
		userRoleBO.setRole(roleBO);
		userRoleBO.setUser(userBO);
		userRoleDao.saveOrUpdate(entityManager, userRoleBO);
	}

	public void deleteRolesUser(UserRoleBO userRoleBO) {
		userRoleDao.deleteUserRole(entityManager, userRoleBO);
	}

	public UserRoleBO getUserRole(String roleName, Long id) {
		return userRoleDao.getUserRoleBO(entityManager, roleName, id).get(0);
	}

	public void deleteUser(UserBO userBo) {
		userDao.delete(userBo);
	}

	public void saveUserStatus(UserBO userBo) {
		userDao.save(userBo);
	}

	public List<OrganizationBO> listOrganization() {
		return organizationDao.findAll();
	}

	public void sendWarning(String sms, String phoneNumber, String email) {
		userDao.sendWarning(sms, email, phoneNumber, entityManager);
	}

	public Message validateLeght(UserForm userForm, HttpServletRequest req, HttpServletResponse resp) {
		if (userForm.getCode().length() > 15) {
			return Common.createMessage("Mã nhân viên không quá 15 ký tự", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userForm.getEmail().length() > 255) {
			return Common.createMessage("Email không được dài quá 255 ký tự", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userForm.getPhoneNumber().length() > 15) {
			return Common.createMessage("Số điện thoại không được vượt quá 15 ký tự", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userForm.getName().length() > 255) {
			return Common.createMessage("Họ tên không được vượt quá 255 ký tự", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userForm.getAddress().length() > 255) {
			return Common.createMessage("Địa chỉ không được vượt quá 255 ký tự", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		if (userForm.getIdNumber().length() > 15) {
			return Common.createMessage("Số chứng minh thư không quá 15 ký tự", Constant.Message.Warning,
					HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}
		return null;
	}

}
