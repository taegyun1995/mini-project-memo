package com.project.memo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.memo.common.FileManagerService;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	// 특정 경로의 파일을 외부에서 접근 가능하도록
	// 그 파일의 접근 경로를 잡아준다.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.IMAGE_UPLOAD_PATH);
	}
}
