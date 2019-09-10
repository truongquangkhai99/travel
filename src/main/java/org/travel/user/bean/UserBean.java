package org.travel.user.bean;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;

	private Date createDate;

	private Date modifyDate;

	private String createBy;

	private String modifyBy;

	private String code;

	private Long status;

	private String email;

	private String phoneNumber;

	private String username;

	private String password;

	private Date lastChangePassword;

	private Date lastResetPassword;

	private String lastResetPasswordBy;

	private Long resetPassword;

	private Long organizationnalId;

	private Long passwordChanged;

	private String orgName;

	private String name;
	
	private String idNumber;

	private String address;

	private Date dateOfBirh;

}
