package com.siristim.agro_ecom;

import com.siristim.agro_ecom.controller.CategoryController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class AgroEcommerce7Application {

    private final CategoryController categoryController;

    AgroEcommerce7Application(CategoryController categoryController) {
        this.categoryController = categoryController;
    }

	public static void main(String[] args) {
		SpringApplication.run(AgroEcommerce7Application.class, args);
	}

	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
//		 System.out.println(encoder.encode("stim123"));
		return encoder;
	}
	
}
