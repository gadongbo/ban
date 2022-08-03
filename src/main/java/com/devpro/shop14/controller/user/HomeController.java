package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entities.Product;
import com.devpro.shop14.services.ProductService;

@Controller // -> controller
public class HomeController extends BaseController {
	@Autowired
	ProductService productService;

	@RequestMapping(value = { "/index" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		List<Product> product = productService.findAllActive();
		
		model.addAttribute("products", product);
		
		// cac views se duoc dat tai thu muc: 
		return "user/index"; // -> duong dan toi VIEW.
	}

}
