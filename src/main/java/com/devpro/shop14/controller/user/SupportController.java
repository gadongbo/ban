package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.SimpleContact;
import com.devpro.shop14.dto.SupportContact;

@Controller
public class SupportController extends BaseController{
	private SupportContact getCleanSimpleSupport() {
		SupportContact support = new SupportContact();
		support.setTxtEmail("abc@gmail.com");
		support.setTxtContent("noi dung");
		return support;
	}
	@RequestMapping(value = { "/support" }, method = RequestMethod.GET) // -> action
	public String Contact (final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
			
			model.addAttribute("support", getCleanSimpleSupport());
			
		// cac views se duoc dat tai thu muc: 
		return "user/support"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/support" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("support") SupportContact support
			)
			throws IOException {
		String email = request.getParameter("txtEmail");
		String emailFormSpringForm=support.getTxtEmail();
		//TODO b2:luu thong tin vao CSDL
		//b3: thong bao cho nguoi dung biet da luu thanh cong
		model.addAttribute("thongbao", "Cảm ơn bạn "+ emailFormSpringForm+"đã gửi yêu cầu!");
		model.addAttribute("support", getCleanSimpleSupport());
		// cac views se duoc dat tai thu muc: 
		return "user/support"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/support-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody SupportContact support) {
		
		System.out.println("Support[Email]: " + support.getTxtEmail());

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", support);
		return ResponseEntity.ok(jsonResult);
	}
}
