package org.travel.role.bo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.travel.base.BaseBO;
import org.travel.userrole.bo.UserRoleBO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@Table(name = "role")
public class RoleBO extends BaseBO {
	private String name;
	private Long status;
	@OneToMany(mappedBy = "role")
	private List<UserRoleBO> userRoles = new ArrayList<>();
}
