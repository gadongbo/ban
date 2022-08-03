package com.devpro.shop14.services;

import java.io.File;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.dto.Constants;
import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.entities.ProductImages;
import com.sun.jdi.connect.spi.Connection;

@Service
public class ProductService extends BaseService<Product> implements Constants {

	private static final String UPLOAD_FOLDER_ROOT = "C:/eclipse-workspace/com.devpro.shop14/uploads/";

	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}
	// tất cả các services cần thêm hàm search.
		public List<Product> search(ProductSearch searchModel) {

			// khởi tạo câu lệnh
			String sql = "SELECT * FROM tbl_products p WHERE 1=1";
			if(!StringUtils.isEmpty(searchModel.getSeo())) {
				sql += " and p.seo = '"+ searchModel.getSeo() + "'";
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
						+ searchModel.getKeyword() + "%'" + " or p.short_description like '%"
						+ searchModel.getKeyword() + "%')";
			}
			
			// chi lay san pham chua xoa
//			sql += " and p.status=1 ";

			return executeNativeSql(sql, searchModel.getPage());
		}
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	@Transactional
	public Product edit(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws Exception {
		//lay thong tin san pham co trong db
		Product productOnDb = super.getById(product.getId());
		// co day avatar len khong
		if (!isEmptyUploadFile(productAvatar)) {
			//xoa avatar trong folder
			new File(UPLOAD_FOLDER_ROOT + productOnDb.getAvatar()).delete();
			//avatar moi
			productAvatar.transferTo(new File(UPLOAD_FOLDER_ROOT+"product/avatar/"+ productAvatar.getOriginalFilename()));
			product.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}else {
			//su dung lai avatar cu
			product.setAvatar(productOnDb.getAvatar());
		}
		// co day pictures len k?
		if (!isEmptyUploadFile(productPictures)) {
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/"
				+ pic.getOriginalFilename()));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());
				
				product.addProductImage(pi);
			}

		}
		// luu vao database
		return super.saveOrUpdate(product);
	}

	/**
	 * vua tao moi vua chinh sua san pham
	 * 
	 * @return
	 */
	@Transactional
	public Product save(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws Exception {
		// co day avatar len khong
		if (!isEmptyUploadFile(productAvatar)) {
			String pathToFile = UPLOAD_FOLDER_ROOT + "product/avatar/" 
			+ productAvatar.getOriginalFilename();
			productAvatar.transferTo(new File(pathToFile));
			product.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}
		// co day pictures len k?
		if (!isEmptyUploadFile(productPictures)) {
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/"
				+ pic.getOriginalFilename()));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());
				product.addProductImage(pi);
			}
		}
		// luu vao database
		return super.saveOrUpdate(product);
	}

	public List<Product> findAllActive() {
		String sql = "select * from tbl_products where status = 1";
		return super.executeNativeSql(sql, -1);
	}
	
}
