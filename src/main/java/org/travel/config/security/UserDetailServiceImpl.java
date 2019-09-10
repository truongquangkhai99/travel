package org.travel.config.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.travel.common.Common;
import org.travel.role.dao.RoleDAO;
import org.travel.user.bo.UserBO;
import org.travel.user.dao.UserDAO;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private RoleDAO roleDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserBO userBo = userDao.findByUsername(username);
		if (Common.isNullOrEmpty(userBo)) {
			System.out.println("User not found! " + username);
			throw new UsernameNotFoundException("User " + username + " was not found in the database");
		}
		List<String> roleNames = this.roleDao.getRoleNames(userBo.getId());
		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		if (roleNames != null) {
			for (String role : roleNames) {
				// ROLE_USER, ROLE_ADMIN,..
				GrantedAuthority authority = new SimpleGrantedAuthority(role);
				grantList.add(authority);
			}
		}
		Boolean accountNonLocked =true;
		if(userBo.getStatus()==0L) {
			accountNonLocked=false;
		}
		Boolean enabled = true;
		if(userBo.getPasswordChanged()==0L) {
			enabled = false;
		}
		Boolean credentialsNonExpired = true;
		if(userBo.getResetPassword()==0L) {
			credentialsNonExpired = false;
		}
		UserDetails userDetail = (UserDetails) 
				new User(userBo.getUsername(), userBo.getPassword(), enabled, true, credentialsNonExpired, accountNonLocked, grantList);
//UserDetails userDetail1 = (UserDetails) 
//new User(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		return userDetail;
	}

}
