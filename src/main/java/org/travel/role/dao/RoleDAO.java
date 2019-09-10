package org.travel.role.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class RoleDAO {
	@Autowired
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<String> getRoleNames(Long userId) {

		String sql = " SELECT ur.role.name FROM UserRoleBO "
					
					+" AS ur WHERE ur.user.id = :userId ";

		Query query = this.entityManager.createQuery(sql, String.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<String> getAllRoleNames() {

		String sql = " SELECT ur.name FROM RoleBO "
					
					+" AS ur WHERE 1=1 ";

		Query query = this.entityManager.createQuery(sql, String.class);
		return query.getResultList();
	}
}
