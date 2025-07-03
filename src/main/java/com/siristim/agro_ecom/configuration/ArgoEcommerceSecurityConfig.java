package com.siristim.agro_ecom.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class ArgoEcommerceSecurityConfig {
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	
	 @Bean
	 SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	 
         http
         .authorizeHttpRequests(authorize -> authorize
                 .requestMatchers("/admin/**").hasRole("ADMIN")
                 .requestMatchers("/supplier/**").hasRole("VENDER")
                 .requestMatchers("/user/**").hasRole("USER")
                 )
         .authorizeHttpRequests(authorize -> authorize
        		 .requestMatchers("/**").permitAll()
                 .anyRequest().authenticated() 
                 )
                      
         .formLogin(login -> login
        		
        		.defaultSuccessUrl("/welcome", true)
                 .failureUrl("/login?failed")
                 .permitAll())
                 
         .logout(logout -> logout.logoutUrl("/logout").permitAll()
                         .invalidateHttpSession(true))
				         .rememberMe(me -> me.key("my_key"));
        // .csrf(e -> e.disable());
	    	 				
	         return http.build();
	    }
	
	
	 @Autowired
		public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
			auth.jdbcAuthentication()
	    	.dataSource(dataSource)
	    	.passwordEncoder(passwordEncoder)
	    		.usersByUsernameQuery("select username, password, enable from user_detail_tbl where username=?")
	    
	    		.authoritiesByUsernameQuery("select ud.username, ur.role from user_detail_tbl "
	    				+ "as ud, user_role_tbl as ur where ud.user_id = ur.user_id and ud.username=?");
			
			auth.inMemoryAuthentication()
				.passwordEncoder(passwordEncoder)
				.withUser("admin")
				.password("$2a$10$WweiGr2vbBLL3y23QuFqmucEl0S/KI3A9kwZ3IyZkRp4qQXF7o3zG")
				.disabled(false)
				.roles("ADMIN");
	}
		
	 
}
