package org.travel.user.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.travel.userrole.bo.UserRoleBO;

import lombok.Data;

@Entity( name = "user")
@Data
/* @EqualsAndHashCode(callSuper = true) */
@Table(name = "user")
public class UserBO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "create_date")
	private Date createDate;
	
	@Column(name = "modify_date")
	private Date modifyDate;
	
	@Column(name = "create_by")
	private String createBy;
	
	@Column(name = "modify_by")
	private String modifyBy;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "status")
	private Long status;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone_number")
	private String phoneNumber;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "last_change_password")
	private Date lastChangePassword;
	
	@Column(name = "last_reset_password")
	private Date lastResetPassword;
	
	@Column(name = "last_reset_password_by")
	private String lastResetPasswordBy;
	
	@Column(name = "reset_password")
	private Long resetPassword;
	
	@Column(name = "organizationnal_id")
	private Long organizationnalId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "id_number")
	private String idNumber;
	
	@Column(name = "date_of_birh")
	private Date dateOfBirh;
	
	@Column(name = "password_changed")
	private Long passwordChanged;
	
	@OneToMany(mappedBy = "user")
	private List<UserRoleBO> userRoles = new ArrayList<>();
}
