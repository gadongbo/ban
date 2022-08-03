package com.devpro.shop14.controller.manager;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.user.BaseController;

@Controller
public class ManagerHomeController extends BaseController {
	@RequestMapping(value = {"/admin/index"}, method = RequestMethod.GET)// action
	public String managerHome(final ModelMap Model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		//cac view se dc dat tai thu muc  /src/main/webapp/WEB-INF/views
		return "manager/index";	// duong dan toi VIEW
	}
}
