package org.travel.role.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.travel.role.bo.RoleBO;

@Repository
@Transactional
public interface RoleReposytory extends JpaRepository<RoleBO, Long> {
  RoleBO findByName(String name);
}
