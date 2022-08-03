package com.devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.user.BaseController;
import com.devpro.shop14.dto.SaleOrderSearch;
import com.devpro.shop14.entities.User;

import com.devpro.shop14.services.UserService;
@Controller
public class ManagerUser extends BaseController{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/admin/user"}, method = RequestMethod.GET)// action
	public String managerUser(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		//can lay danh sach categories tu db va tra ve view qua model
		List<User> users = userService.findAllActive();
		
		//day xuong view de xu li
		model.addAttribute("users",users);
		
		
		
		//cac view se dc dat tai thu muc  /src/main/webapp/WEB-INF/views
		return "manager/user";	// duong dan toi VIEW
	}
	
}
