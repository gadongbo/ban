package com.devpro.shop14.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.services.ProductService;


@Controller
public class ProductController extends BaseController{
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = {"/product"}, method = RequestMethod.GET)
	public String allProduct(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response)
	throws IOException{
		ProductSearch ps = new ProductSearch();
		int page  = 0;
		ps.setPage(page);
		String x = request.getParameter("page");
		if(x != null && x != "") {
			page = getCurrentPage(request);
			ps.setPage(page);
		}
		model.addAttribute("products", productService.search(ps));
		model.addAttribute("page", page+1);
		return "user/product";
		
	}
		
	
	@RequestMapping(value = {"/detailProduct/{productId}"}, method = RequestMethod.GET)
	public String productDetail(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response,
				@PathVariable ("productId") int productId)
	throws IOException{
		Product product = new Product();
		product = productService.getById(productId);
		model.addAttribute("product", product);
		return "user/detailProduct";
	}
			
}
