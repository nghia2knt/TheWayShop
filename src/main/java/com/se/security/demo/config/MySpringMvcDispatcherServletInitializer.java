	package com.se.security.demo.config;

import javax.servlet.FilterRegistration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MySpringMvcDispatcherServletInitializer extends 
    AbstractAnnotationConfigDispatcherServletInitializer {
	
	 public void onStartup(ServletContext servletContext) throws ServletException {
	        FilterRegistration.Dynamic filterRegistration =
	            servletContext.addFilter("endcoding-filter", new CharacterEncodingFilter());
	        filterRegistration.setInitParameter("encoding", "UTF-8");
	        filterRegistration.setInitParameter("forceEncoding", "true"); 
	        filterRegistration.addMappingForUrlPatterns(null, false, "/*");
	        super.onStartup(servletContext);	        
	    }
@Override
protected Class<?>[] getRootConfigClasses() {
        // TODO Auto-generated method stub
        return null;    }
@Override
protected Class<?>[] getServletConfigClasses() {
        return new Class[] { DemoAppConfig.class };    }

@Override
protected String[] getServletMappings() {
        return new String[] { "/" };    }
@Override
protected DispatcherServlet createDispatcherServlet(WebApplicationContext servletAppContext) {
    final DispatcherServlet dispatcherServlet = (DispatcherServlet) super.createDispatcherServlet(servletAppContext);
    dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
    return dispatcherServlet;
}

}






