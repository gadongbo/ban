package com.devpro.shop14.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.devpro.shop14.dto.Constants;

@Configuration // -> bao spring biet day la file cau hinh cho MVC
public class MVCConf implements WebMvcConfigurer, Constants{
	/*
	 * cau hinh 1 controller de handler cac request kieu
	 * http://localhost:9999/user/css/styles.css
	 * http://localhost:9999/user/css/script.js
	 * static files nhu: css, js, image
	  */	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		//classpath: <->src/main/resources
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/manager/**").addResourceLocations("classpath:/manager/");
		// resource handler cho phần upload ảnh từ người dùng.
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + UPLOAD_FOLDER_ROOT);
	}
	@Bean // -> bao spring biet folder chua view
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class); //view engine dung de doc data tu controller tra ve va tron voi html code.
		bean.setPrefix("/WEB-INF/views/"); //duong da toi folder chua views(user + manager)
		bean.setSuffix(".jsp"); //duoi file cua view
		return bean;
	}
	
}
