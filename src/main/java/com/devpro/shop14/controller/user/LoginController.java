package com.devpro.shop14.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		// cac views se duoc dat tai thu muc: 
		return "login"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/dangki" }, method = RequestMethod.GET) // -> action
	public String dangKi(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		// cac views se duoc dat tai thu muc: 
		return "user/dangki"; // -> duong dan toi VIEW.
	}
}
