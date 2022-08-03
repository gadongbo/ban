package com.devpro.shop14.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop14.dto.SaleOrderSearch;

import com.devpro.shop14.entities.Contact;
import com.devpro.shop14.entities.SaleOrder;
import com.devpro.shop14.entities.User;

@Service
public class UserService extends BaseService<User> {
	@PersistenceContext
	protected EntityManager entityManager;
	@Override
	protected Class<User> clazz() {
		
		return User.class;
	}
	
	public User loadUserByUsername (String userName) {
		String sql = "select * from tbl_users u where u.username='"+userName+"'";
		List<User> users = this.executeNativeSql(sql, -1);
		if(users==null || users.size()<=0) return null;
		return users.get(0);
		
	}
	public User getUserById(Integer userId) {
		String sql = "select * from tbl_users as u where u.id='"+userId+"'";
		List<User> users = this.executeNativeSql(sql, -1);
		if(users==null || users.size()<=0) return null;
		return users.get(0);
	}
	public List<User> findAllActive() {
		String sql = "select * from tbl_users where status = 1";
		return super.executeNativeSql(sql, -1);
		
	}
}
