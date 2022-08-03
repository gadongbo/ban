package com.devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.controller.user.BaseController;
import com.devpro.shop14.dto.CategorySearch;
import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.services.CategoriesService;

@Controller
public class ManagerCategoriesController extends BaseController {
	// inject mot bean(sevice) vao trong mot bean khac(controller)
	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = { "/admin/categories" }, method = RequestMethod.GET) // action
	public String managerHome(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		String keyword = request.getParameter("keyword");
		CategorySearch ps = new CategorySearch();
		ps.setKeyword(keyword);
		ps.setPage(getCurrentPage(request));
		
		model.addAttribute("categories", categoriesService.search(ps));
		return "manager/categories"; // duong dan toi VIEW
	}

	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.GET) // action
	public String addCategories(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response)
			throws IOException {
		List<Categories> categories = categoriesService.findAllActive();

		// day xuong view
		model.addAttribute("categories", new Categories());
		return "manager/add-categories";
	}
	@RequestMapping(value = {"/admin/edit-categories/{categorySeo}"}, method = RequestMethod.GET)//action
	public String editCategories(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categorySeo") String categorySeo)
			throws IOException {
		//int productId = request.getParameter("productId");
		//lay san pham tu data base
		CategorySearch categorySearch = new CategorySearch();
		categorySearch.setSeo(categorySeo);
		Categories categories = categoriesService.search(categorySearch).get(0);
		
		
	
		
		//day xuong view
		model.addAttribute("categories", categories);
		
		
		return "manager/add-categories";
	}

	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.POST) // -> action
	public String addCategories(final Model model, 
				final HttpServletRequest request, 
				final HttpServletResponse response,
				@ModelAttribute("categories") Categories categories) 
						throws Exception {
							//kiem tra action them moi hay chinh sua
							if(categories.getId()==null|| categories.getId()<=0) {
								categoriesService.save(categories);
								model.addAttribute("categories", new Categories());
							}else {
								categoriesService.save(categories);
							}
					return "redirect:/admin/categories"; // -> duong dan toi VIEW.
	}
//	@RequestMapping(value = {"/admin/categories/{id}"}, method = RequestMethod.GET)
//	public String deleteProduct(final Model model, final HttpServletRequest request,
//								final HttpServletResponse response,
//								@PathVariable(name="id") Integer id)
//	throws Exception{
//		categoriesService.deleteById(id);
//		return "redirect:/admin/categories?page=1";
//	}
	@RequestMapping(value = { "/removeCategory/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		System.out.println(id);
		Categories category = categoriesService.getById(id);
//		category.setStatus(false);
//		categoriesService.saveOrUpdate(category);
		categoriesService.deleteById(id);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công sản phẩm có id là " + id);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/add-category-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> productAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody Categories category) {
								
		

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", category);
		
		return ResponseEntity.ok(jsonResult);
	}
}
