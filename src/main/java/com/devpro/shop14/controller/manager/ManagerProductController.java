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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.controller.user.BaseController;
import com.devpro.shop14.dto.CartItem;
import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductService;

@Controller
public class ManagerProductController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = { "/admin/products" }, method = RequestMethod.GET) // action
	public String listProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		String keyword = request.getParameter("keyword");
		ProductSearch ps = new ProductSearch();
		ps.setKeyword(keyword);
		ps.setPage(getCurrentPage(request));

		model.addAttribute("products", productService.search(ps));
		return "manager/products";
	}

	@RequestMapping(value = { "/admin/add-products" }, method = RequestMethod.GET) // action
	public String addProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Categories> categories = categoriesService.findAllActive();

		// day xuong view
		model.addAttribute("categories", categories);

		model.addAttribute("product", new Product());
		return "manager/add-products";
	}

	@RequestMapping(value = { "/admin/edit-products/{productSeo}" }, method = RequestMethod.GET) // action
	public String editProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productSeo") String productSeo) throws IOException {
		// int productId = request.getParameter("productId");
		// lay san pham tu data base
		ProductSearch productSearch = new ProductSearch();
		productSearch.setSeo(productSeo);
		Product product = productService.search(productSearch).get(0);
		List<Categories> categories = categoriesService.findAllActive();

		// day xuong view
		model.addAttribute("categories", categories);

		model.addAttribute("product", product);

		return "manager/add-products";
	}

	@RequestMapping(value = { "/admin/add-products" }, method = RequestMethod.POST) // -> action
	public String addProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("product") Product product, @RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures) throws Exception {
		// kiem tra action them moi hay chinh sua
		if (product.getId() == null || product.getId() <= 0) {
			productService.save(product, productAvatar, productPictures);
		} else {
			productService.edit(product, productAvatar, productPictures);
		}

		// cac views se duoc dat tai thu muc:
		return "redirect:/admin/products"; // -> duong dan toi VIEW.
	}

//	@RequestMapping(value = {"/admin/products/{id}"}, method = RequestMethod.GET)
//	public String deleteProduct(final Model model, final HttpServletRequest request,
//								final HttpServletResponse response,
//								@PathVariable(name="id") Integer id)
//	throws Exception{
//		productService.deleteById(id);
//		return "redirect:/admin/products?page=1";
//	}
	@RequestMapping(value = { "/add-products-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> productAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody Product product) {
								
		

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", product);
		
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/removeProduct/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		System.out.println(id);
		Product product = productService.getById(id);
//		product.setStatus(false);
//		productService.saveOrUpdate(product);
		productService.deleteById(id);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công sản phẩm có id là " + id);
		return ResponseEntity.ok(jsonResult);

	}
}
