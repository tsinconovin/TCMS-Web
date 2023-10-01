package com.TSINCO.config;  


import javax.servlet.MultipartConfigElement;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.embedded.MultipartConfigFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
  
@Configuration
@ComponentScan("com.TSINCO")
@EnableWebMvc 
@EnableAutoConfiguration
//@ImportResource("classpath:/com/TSINCO/config/data-source-cfg.xml")
public class Config extends WebMvcConfigurerAdapter {  
      
   // @Inject DataSource DataSource;

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        return factory.createMultipartConfig();
    }
    @Bean
     public CommonsMultipartResolver multipartResolver(){
      CommonsMultipartResolver cm = new CommonsMultipartResolver();
      cm.setMaxUploadSize(900000000);
      
         return cm;
      }
//    
    @Bean  
    public UrlBasedViewResolver setupViewResolver() {  
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();  
        resolver.setPrefix("/WEB-INF/view/");  
        resolver.setSuffix(".jsp");  
        resolver.setViewClass(JstlView.class);  

        return resolver;  
    }  

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resource/**").addResourceLocations("/WEB-INF/resource/*");
    }
}  
