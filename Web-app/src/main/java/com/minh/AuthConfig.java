package com.minh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.minh.service.UserService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AuthConfig extends WebSecurityConfigurerAdapter{
	@Autowired UserService userService;
	
	// Phân quyền sử dụng và hình thức đăng nhập
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		// CSRF, CORS vô hiệu hóa tương tác bên ngoài
		http.csrf().disable().cors().disable();
		
		// Phân quyền người sử dụng
		http.authorizeRequests()
			.anyRequest().permitAll();
			
		
		
		// Đăng nhập từ mạng xã hội
		http.oauth2Login()
			.loginPage("/login")
			.defaultSuccessUrl("/OAuth2",true)
			.failureUrl("/error1")
			.authorizationEndpoint()
				.baseUri("/oauth2/authorization");
		
		 // Lỗi nếu ko được cấp quyền truy cập
		http.exceptionHandling()
			.accessDeniedPage("/denied");    
		
		// Giao diện đăng nhập
		http.httpBasic();	
		
		http.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/login") // /auth/login
			.defaultSuccessUrl("/success")
			.failureUrl("/error1")
			
			.usernameParameter("username")
			.passwordParameter("password");
		
		// Rememberme
		http.authorizeRequests().and() //
			.rememberMe().tokenRepository(this.persistentTokenRepository()) //
			.tokenValiditySeconds(1 * 24 * 60 * 60); // 24h
		
		// Đăng xuất
		http.logout()
			.logoutUrl("/auth/logoff")
			.logoutSuccessUrl("/logoff");	
	}
	
	// Mã hóa mật khẩu
	@Bean
	public BCryptPasswordEncoder getBCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	// Quản lí người và dữ liệu người sử dụng
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userService);		
	}

	
	// Token stored in Memory (Of Web Server).
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
	    InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
	    return memory;
	}
}
