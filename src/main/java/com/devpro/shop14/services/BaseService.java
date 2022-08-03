package com.devpro.shop14.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.BaseEntity;

@Service
public abstract class BaseService<E extends BaseEntity> {

	private static int SIZE_OF_PAGE = 5;
	@PersistenceContext
	EntityManager entityManager;

	protected abstract Class<E> clazz();

	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name(), clazz()).getResultList();
	}
	
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) {
			entityManager.persist(entity); //them moi
			return entity;
		} else {
			return entityManager.merge(entity); //update
		}
	}
	@Transactional
	public void delete(E entity) {
		entityManager.remove(entity);
	}
	@Transactional
	public void deleteById(Integer id) {
		E entity = this.getById(id);
		delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql, int page) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			if(page >=0) {
				query.setFirstResult(page*SIZE_OF_PAGE);
				query.setMaxResults(SIZE_OF_PAGE);
			}
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	
}
