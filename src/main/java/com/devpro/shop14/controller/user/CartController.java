package com.devpro.shop14.controller.user;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.Cart;
import com.devpro.shop14.dto.CartItem;
import com.devpro.shop14.dto.SimpleContact;
import com.devpro.shop14.entities.Product;
import com.devpro.shop14.entities.SaleOrder;

import com.devpro.shop14.entities.SaleOrderProducts;
import com.devpro.shop14.entities.User;
import com.devpro.shop14.services.ProductService;
import com.devpro.shop14.services.SaleOrderService;
import com.devpro.shop14.services.UserService;

@Controller
public class CartController extends BaseController {

	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/cart/finish"}, method = RequestMethod.POST)
	public String cartFinish(final Model model, final HttpServletRequest request,
						final HttpServletResponse response)
	throws Exception{
		String customerName=request.getParameter("customerName");
		String customerAddress=request.getParameter("customerAddress");
		String customerEmail=request.getParameter("customerEmail");
		
		//tao hoa don
		SaleOrder saleOrder=new SaleOrder();
		saleOrder.setCustomerName(customerName);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		if(getUserLogined()!=null) {
			User user = userService.getUserById(getUserLogined().getId());
			saleOrder.setUser(user);
			
		}
		
		long total = 0;
		//ket hop cac san pham trong gio hang vao hoa don
		 HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for(CartItem cartItem: cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			total += cartItem.getQuanlity() * cartItem.getPriceUnit().intValueExact();
			
		}
		BigDecimal totalOrder = new BigDecimal(total);
		saleOrder.setTotal(totalOrder);
		//luu vao co so du lieu
		saleOrderService.saveOrUpdate(saleOrder);
	
		//xoa du lieu gio hang
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", null);
		return "user/view-cart";
		
	}
	@RequestMapping(value = { "/cart-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> cartAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody CartItem cart) {
								
		

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", cart);
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/cart/view"}, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request,
						final HttpServletResponse response)
	throws Exception{
		return "user/view-cart";
		
	}
	
	@RequestMapping(value = { "/cart/add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {

		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
				BigDecimal totalPriceAdd = item.getPriceUnit().multiply(new BigDecimal(newItem.getQuanlity()));
				item.setTotal(item.getTotal().add(totalPriceAdd));
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(newItem.getProductId());

			newItem.setProductName(productInDb.getTitle());
			newItem.setPriceUnit(productInDb.getPrice());
			
			newItem.setTotal(newItem.getPriceUnit().multiply(new BigDecimal(newItem.getQuanlity())));

			cart.getCartItems().add(newItem);
		}
		
		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		// đây à
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	
}
