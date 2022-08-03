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
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Contact;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ContactService;
@Controller
public class ManagerContactController extends BaseController {
	//inject mot bean(sevice) vao trong  mot bean khac(controller)
		@Autowired
		private ContactService contactService;
		
		@RequestMapping(value = {"/admin/contact"}, method = RequestMethod.GET)// action
		public String managerHome(final Model model,
				final HttpServletRequest request,
				final HttpServletResponse response)
				throws IOException {
			
			//can lay danh sach categories tu db va tra ve view qua model
			List<Contact> contacts = contactService.findAllActive();
			
			//day xuong view de xu li
			model.addAttribute("contacts",contacts);
			
			
			
			//cac view se dc dat tai thu muc  /src/main/webapp/WEB-INF/views
			return "manager/contact";	// duong dan toi VIEW
		}
}
