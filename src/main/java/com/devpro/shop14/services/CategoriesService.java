package com.devpro.shop14.services;

import java.io.File;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.dto.CategorySearch;
import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.entities.ProductImages;

@Service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		
		return Categories.class;
	}
	// tất cả các services cần thêm hàm search.
			public List<Categories> search(CategorySearch searchModel) {

				// khởi tạo câu lệnh
				String sql = "SELECT * FROM tbl_category p WHERE 1=1";
				if(!StringUtils.isEmpty(searchModel.getSeo())) {
					sql += " and p.seo = '"+ searchModel.getSeo() + "'";
				}
				// tim kiem san pham theo seachText
				if (!StringUtils.isEmpty(searchModel.getKeyword())) {
					sql += " and (p.name like '%" + searchModel.getKeyword() + "%'" + " or p.description like '%"
							+ searchModel.getKeyword() + "%'" + " or p.seo like '%"
							+ searchModel.getKeyword() + "%')";
				}
				
				// chi lay san pham chua xoa
//				sql += " and p.status=1 ";

				return executeNativeSql(sql, searchModel.getPage());
			}
	@Transactional
	public Categories edit(Categories categories)
			throws Exception {
		//lay thong tin san pham co trong db
		Categories categoryOnDb = super.getById(categories.getId());
		
		// luu vao database
		return super.saveOrUpdate(categories);
	}
	
	@Transactional
	public Categories save(Categories categories)
			throws Exception {
				return super.saveOrUpdate(categories);
		
	}
	public List<Categories> findAllActive(){
		String sql = "select * from tbl_category where status = 1";
		return super.executeNativeSql(sql, -1);
	}
}
