package org.travel.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.hibernate.transform.Transformers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.travel.base.vfdata.impl.VfData;
import org.travel.common.Common;
import org.travel.user.bean.UserBean;
import org.travel.user.bo.UserBO;
import org.travel.user.form.UserForm;

@Repository
@Transactional
public interface UserDAO extends JpaRepository<UserBO, Long> {

	public UserBO findByUsername(String username);
	
	public default List<UserBean> search(UserForm userForm, EntityManager entityManager){
		Map<String,Object> params = new HashMap<String, Object>();
		VfData vfData = new VfData();
		String sql = " SELECT "
				   + " u.id AS id,"
				   + " u.code AS code,"
				   + " u.modifyBy AS modifyBy,"
				   + " u.modifyDate AS modifyDate,"
				   + " u.createDate AS createDate,"
				   + " u.createBy AS createBy,"
				   + " u.status AS status,"
				   + " u.username AS username,"
				   + " u.password AS password,"
				   + " u.lastChangePassword AS lastChangePassword,"
				   + " u.lastResetPassword AS lastResetPassword,"
				   + " u.lastResetPasswordBy AS lastResetPasswordBy,"
				   + " u.resetPassword AS resetPassword,"
				   + " u.organizationnalId AS organizationnalId,"
				   + " u.passwordChanged AS passwordChanged,"
				   + " u.email AS email,"
				   + " u.name AS name,"
				   + " u.address AS address,"
				   + " u.phoneNumber AS phoneNumber,"
				   + " u.idNumber AS idNumber,"
				   + " (Select o.orgName FROM organization AS o WHERE o.id = u.organizationnalId ) AS orgName"
				   + " FROM user AS u"
				   + " WHERE 1 = 1 ";
		sql =vfData.getQuery(sql, " AND u.id = :id", "id", userForm.getId(), params);
		sql =vfData.getQuery(sql, " AND u.code = :code", "code", userForm.getCode(), params);
		sql =vfData.getQuery(sql, " AND u.status", "status", userForm.getStatus(), params);
		sql =vfData.getQuery(sql, " AND u.username = :username", "username", userForm.getUsername(), params);
		sql =vfData.getQuery(sql, " AND u.lastChangePassword = :lastChangePassword", "lastChangePassword", Common.convertStringToDate(userForm.getLastChangePassword()), params);
		sql =vfData.getQuery(sql, " AND u.lastResetPassword = :lastResetPassword", "lastResetPassword", Common.convertStringToDate(userForm.getLastResetPassword()), params);
		sql =vfData.getQuery(sql, " AND u.lastResetPassword_by = :lastResetPasswordBy", "lastResetPasswordBy", userForm.getLastResetPasswordBy(), params);
		sql =vfData.getQuery(sql, " AND u.resetPassword = :resetPassword", "resetPassword", userForm.getResetPassword(), params);
		sql =vfData.getQuery(sql, " AND u.organizationnalId = :organizationnalId", "organizationnalId", userForm.getOganizationnalId(), params);
		sql =vfData.getQuery(sql, " AND u.passwordChanged = :passwordChanged", "passwordChanged", userForm.getPasswordChanged(), params);
		sql =vfData.getQuery(sql, " AND u.phoneNumber = :phoneNumber", "phoneNumber", userForm.getPhoneNumber(), params);
		sql =vfData.getQuery(sql, " AND u.name = :name", "name", userForm.getName(), params);
		sql =vfData.getQuery(sql, " AND u.email = :email", "email", userForm.getEmail(), params);
		sql =vfData.getQuery(sql, " AND u.idNumber = :idNumber", "idNumber", userForm.getIdNumber(), params);
		sql =vfData.getQuery(sql, " AND u.address = :address", "address", userForm.getAddress(), params);
		sql =vfData.getQuery(sql, " AND u.dateOfBirh = :dateOfBirh", "dateOfBirh", Common.convertStringToDate(userForm.getDateOfBirh()), params);
		sql+= " ORDER BY "+ userForm.getSortName()+" "+ userForm.getSortBy();
		Query query = (Query) entityManager.createQuery(sql);
		vfData.setParameter(query, params);
		query.setFirstResult((int) ((userForm.getPage()-1)*userForm.getMaxPageItem()));
		query.setMaxResults(userForm.getMaxPageItem().intValue());
		List<UserBean> list = (List<UserBean>) query.unwrap( org.hibernate.query.Query.class )
				.setResultTransformer( Transformers.aliasToBean( UserBean.class ) )
				.getResultList();
		return list;
	}
	public default void saveOrUpdate(UserBO userBo, EntityManager entityManager){
		entityManager.merge(userBo);
	}
	/*
	 * hàm gửi tin nhắn để biết password
	 * 
	 * */
	public default void sendWarning(String sms, String email, String phoneNumber, EntityManager entityManager) {
		String sql ="INSERT INTO sendwarning (email, phone_number, message) VALUES (:email, :phoneNumber, :sms)";
		Query query = entityManager.createNativeQuery(sql);
		query.setParameter("email", email);
		query.setParameter("phoneNumber", phoneNumber);
		query.setParameter("sms", sms);
		query.executeUpdate();
	}
	@org.springframework.data.jpa.repository.Query
	("select u from user u where u.username = :username")
	UserBO findUserByUsername(@Param("username") String username);
	
	@org.springframework.data.jpa.repository.Query
	("select u from user u where u.email = :email")
	UserBO findUserByEmail(@Param("email") String email);
	
	@org.springframework.data.jpa.repository.Query
	("select u from user u where u.code = :code")
	UserBO findUserByCode(@Param("code") String code);
	
	@org.springframework.data.jpa.repository.Query
	("select u from user u where u.idNumber = :idNumber")
	UserBO findUserByIdNumber(@Param("idNumber") String idNumber);
	
}
