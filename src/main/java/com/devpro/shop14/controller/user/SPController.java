package com.devpro.shop14.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SPController extends BaseController {

	@RequestMapping(value = { "/iphone" }, method = RequestMethod.GET) // -> action
	public String Iphone(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// cac views se duoc dat tai thu muc:
		return "user/Iphone"; // -> duong dan toi VIEW.

	}
	@RequestMapping(value = { "/iphone12" }, method = RequestMethod.GET) // -> action
	public String Iphone12(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// cac views se duoc dat tai thu muc:
		return "user/Iphone12"; // -> duong dan toi VIEW.

	}
	@RequestMapping(value = { "/samsung" }, method = RequestMethod.GET) // -> action
	public String Samsung(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// cac views se duoc dat tai thu muc:
		return "user/samsung"; // -> duong dan toi VIEW.

	}
	@RequestMapping(value = { "/samsunggalaxy" }, method = RequestMethod.GET) // -> action
	public String Samsunggalaxy(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// cac views se duoc dat tai thu muc:
		return "user/samsunggalaxy"; // -> duong dan toi VIEW.

	}
}
