package org.travel.userrole.bo;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.travel.base.BaseBO;
import org.travel.role.bo.RoleBO;
import org.travel.user.bo.UserBO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@Table(name = "userrole")
public class UserRoleBO extends BaseBO {

	@ManyToOne
    @JoinColumn(name = "role_id")
	private RoleBO role;
	
	@ManyToOne
    @JoinColumn(name = "user_id")
	private UserBO user;
}
