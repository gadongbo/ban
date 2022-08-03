package com.devpro.shop14.controller.user;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.dto.SimpleContact;

@Controller // -> controller
public class ContactController extends BaseController	 {

	private SimpleContact getCleanSimpleContact() {
		SimpleContact contact = new SimpleContact();
		contact.setTxtEmail("abc@gmail.com");
		contact.setTxtContent("noi dung");
		contact.setChkCheckbox(true);
		return contact;
	}
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET) // -> action
	public String Contact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
			model.addAttribute("contact", getCleanSimpleContact());
			
		// cac views se duoc dat tai thu muc: 
		return "user/contact"; // -> duong dan toi VIEW.
	}
	/**
	 * @ModelAttribute("contact"): gia tri contact phai trung voi gia tri trong ModelAttribute
	 * ="contact" trong spring-form 
	 * @param inputFile */
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("contact") SimpleContact contact,
			@RequestParam("inputFile") MultipartFile[] inputFiles)
			throws IOException {
		model.addAttribute("projectTitle", "JavaWeb14");
		//b1: lay thong tin nguoi dung day len
		String email = request.getParameter("txtEmail");
		String emailFormSpringForm=contact.getTxtEmail();
		//TODO b2:luu thong tin vao CSDL
		//b3: thong bao cho nguoi dung biet da luu thanh cong
		
		model.addAttribute("thongbao", "Cảm ơn bạn "+ emailFormSpringForm+" đã gửi liên hệ!");
		model.addAttribute("contact", getCleanSimpleContact());
		//4: savefile
		if(inputFiles.length > 0) {
			for(MultipartFile inputFile : inputFiles){
				inputFile.transferTo(new File(
						"C:\\eclipse-workspace\\com.devpro.shop14\\uploads\\"
									+ inputFile.getOriginalFilename()));
			}
		}
		// cac views se duoc dat tai thu muc: 
		return "user/contact"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/contact-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response,
						
						final @RequestBody SimpleContact contact) {
								
		System.out.println("Contact[Email]: " + contact.getTxtEmail());

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", contact);
		
		return ResponseEntity.ok(jsonResult);
		
	}
	
}
