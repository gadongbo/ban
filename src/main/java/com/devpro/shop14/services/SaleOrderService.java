package com.devpro.shop14.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop14.dto.CategorySearch;
import com.devpro.shop14.dto.SaleOrderSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	@Override
	protected Class<SaleOrder> clazz() {
		
		return SaleOrder.class;
		
	}
	public List<SaleOrder> search(SaleOrderSearch searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";
		if(!StringUtils.isEmpty(searchModel.getSeo())) {
			sql += " and p.seo = '"+ searchModel.getSeo() + "'";
		}
		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and (p.customer_name like '%" + searchModel.getKeyword() + "%'" + " or p.customer_address like '%"
					+ searchModel.getKeyword() + "%'" + " or p.seo like '%"
					+ searchModel.getKeyword() + "%')";
		}
		
		// chi lay san pham chua xoa
//		sql += " and p.status=1 ";

		return executeNativeSql(sql, searchModel.getPage());
	}
	@Transactional
	public SaleOrder edit(SaleOrder saleOrder)
			throws Exception {
		//lay thong tin san pham co trong db
		SaleOrder saleorderOnDb = super.getById(saleOrder.getId());
		
		// luu vao database
		return super.saveOrUpdate(saleOrder);
	}
	
	@Transactional
	public SaleOrder save(SaleOrder saleOrder)
			throws Exception {
				return super.saveOrUpdate(saleOrder);
		
	}
	public List<SaleOrder> findAllActive(){
		String sql = "select * from tbl_saleorder where status = 1";
		return super.executeNativeSql(sql, -1);
	}
}
