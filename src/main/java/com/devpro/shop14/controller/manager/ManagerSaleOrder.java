package com.devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.user.BaseController;
import com.devpro.shop14.dto.CategorySearch;
import com.devpro.shop14.dto.SaleOrderSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.entities.SaleOrder;

import com.devpro.shop14.services.SaleOrderService;

@Controller
public class ManagerSaleOrder extends BaseController {
	@Autowired
	private SaleOrderService saleOrderService;

	@RequestMapping(value = { "/admin/saleOrder" }, method = RequestMethod.GET) // action
	public String managerHome(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		String keyword = request.getParameter("keyword");
		SaleOrderSearch ps = new SaleOrderSearch();
		ps.setKeyword(keyword);
		ps.setPage(getCurrentPage(request));
		
		model.addAttribute("saleOrder", saleOrderService.search(ps));
		// cac view se dc dat tai thu muc /src/main/webapp/WEB-INF/views
		return "manager/saleOrder"; // duong dan toi VIEW
	}
	@RequestMapping(value = {"/admin/chitiet"}, method = RequestMethod.GET)//action
	public String editProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleId") int saleId)
			throws IOException {
		//int productId = request.getParameter("productId");
		//lay san pham tu data base
		SaleOrder saleOrder = saleOrderService.getById(saleId);
		
		
		model.addAttribute("saleOrder", saleOrder);
		
		
		return "manager/chitiet";
	}

	
}
