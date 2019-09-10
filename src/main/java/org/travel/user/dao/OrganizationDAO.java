package org.travel.user.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.travel.organization.bo.OrganizationBO;

@Repository
@Transactional
public interface OrganizationDAO extends JpaRepository<OrganizationBO, Long> {
}
