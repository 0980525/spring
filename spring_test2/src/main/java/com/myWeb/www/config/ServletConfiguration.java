package com.myWeb.www.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
//@ComponentScan(basePackages = {"com.myWeb.www.controller", "com.myWeb.www.handler"})
@ComponentScan(basePackages = "com.myWeb.www")

public class ServletConfiguration implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//resources 경로설정 / 나중에 파일 업로드 경로 설정 추가
		//매핑경로 registry.addResourceHandler("/resources/**")
		//실 경로 .addResourceLocations("/resources/")
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		//view 경로 설정 prefix,suffix
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WED-INF/views/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setViewClass(JstlView.class);
		
		registry.viewResolver(viewResolver);
	}

	
}
