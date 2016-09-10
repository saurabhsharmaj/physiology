package com.phyapp.web.exception;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

@Configuration
public class ExcpConfig {

    @Bean(name = "simpleMappingExceptionResolver")
    public SimpleMappingExceptionResolver simpleMappingExceptionResolver() {
        SimpleMappingExceptionResolver resolver= new SimpleMappingExceptionResolver();

        Properties mappings = new Properties();
        resolver.setExceptionMappings(mappings); // None by default
        resolver.setExceptionAttribute("ErrorOccurred"); // Default is "exception"
        resolver.setDefaultErrorView("error"); // 500.jsp
        return resolver;
    }

}