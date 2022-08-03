package com.devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.Contact;

@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		
		return Contact.class;
	}

	public List<Contact> findAllActive() {
		String sql = "select * from tbl_contact where status = 1";
		return super.executeNativeSql(sql, -1);
		
	}

}
