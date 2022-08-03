package com.devpro.shop14.dto;

import org.springframework.web.multipart.MultipartFile;

public class SimpleContact {
	private String txtEmail; // bat buoc trung ten the html
	private String txtContent;
	private boolean chkCheckbox;
	
	//phai tao method get, set
	
	public String getTxtEmail() {
		return txtEmail;
	}
	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}
	public String getTxtContent() {
		return txtContent;
	}
	public void setTxtContent(String txtContent) {
		this.txtContent = txtContent;
	}
	public boolean isChkCheckbox() {
		return chkCheckbox;
	}
	public void setChkCheckbox(boolean chkCheckbox) {
		this.chkCheckbox = chkCheckbox;
	}
	
	
	
	//phai tao method get, set
	
}
