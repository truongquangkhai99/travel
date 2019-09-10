package org.travel.userrole.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import javax.persistence.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.travel.userrole.bo.UserRoleBO;

@Repository
@Transactional
public interface UserRoleDAO extends JpaRepository<UserRoleBO, Long> {
	public default void saveOrUpdate(EntityManager entityManager, UserRoleBO userRoleBO) {
		entityManager.merge(userRoleBO);
	}

	public default void deleteUserRole(EntityManager entityManager, UserRoleBO userRoleBO) {
		entityManager.remove(userRoleBO);
	}

	@SuppressWarnings("unchecked")
	public default List<UserRoleBO> getUserRoleBO(EntityManager entityManager, String roleName, Long id) {
		String sql = "FROM UserRoleBO"
		 + " AS ur WHERE ur.user.id = :userId AND ur.role.name = :roleName" ;
		Query query = (Query) entityManager.createQuery(sql, UserRoleBO.class);
		query.setParameter("userId", id);
		query.setParameter("roleName", roleName);
		return (List<UserRoleBO>) query.getResultList();
	}
	
}
