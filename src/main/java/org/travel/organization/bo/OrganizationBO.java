package org.travel.organization.bo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.travel.base.BaseBO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity(name = "organization")
@Data
@EqualsAndHashCode(callSuper = true)
@Table(name = "organization")
public class OrganizationBO extends BaseBO {
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "org_name")
	private String orgName;
	
	@Column(name = "path")
	private String path;
}
