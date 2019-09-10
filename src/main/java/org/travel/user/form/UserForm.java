package org.travel.user.form;

import lombok.Data;

@Data
public class UserForm {
	
	private Long id;

	private String code;

	private Long status;

	private String username;

	private String lastChangePassword;

	private String lastResetPassword;

	private String lastResetPasswordBy;

	private Long resetPassword;

	private Long oganizationnalId;

	private Long passwordChanged;

	private String password;

	private String email;

	private String phoneNumber;

	private String orgName;

	private String idNumber;

	private String name;

	private String address;

	private String dateOfBirh;
	
	private String newPassword;
	
	private String repeatPassword;
	
	private Long page;
	
	private Long maxPageItem;
	
	private String sortName;
	
	private String sortBy;

}
