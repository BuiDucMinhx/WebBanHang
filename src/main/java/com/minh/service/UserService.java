package com.minh.service;

import java.security.Principal;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;
import com.minh.dao.AccountDAO;
import com.minh.entity.Account;
import com.minh.model.Myaccount;



@Service
public class UserService implements UserDetailsService{
	@Autowired AccountDAO accountDao;
	
	@Autowired BCryptPasswordEncoder pe;
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		try {
			Account account = accountDao.findById(username).get();
			// Tạo userdetail từ account
			String password = account.getPassword();
			System.out.println(password);
			String[] roles = account.getAuthorities().stream()
					.map(au -> au.getRole().getId())
					.collect(Collectors.toList()).toArray(new String[0]);
			System.out.println(pe.encode(password));
			
			return User.withUsername(username)
					.password(password)
					.roles(roles).build();
		} catch (Exception e) {
			throw new UsernameNotFoundException(username + "not found");
		}
		
	}
	
	public void loginFromOAuth2(OAuth2AuthenticationToken oauth2) {
		String email = oauth2.getPrincipal().getAttribute("email");
		String password = Long.toHexString(System.currentTimeMillis());

		UserDetails user = User.withUsername(email)
				.password(pe.encode(password)).roles("GUEST").build();
		Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
	}
	

	public String validateUser(Principal principal , Myaccount user) {
		String message = "";
        String username = principal.getName();
        Account account = accountDao.getById(username);
        String curr = account.getPassword();
        System.out.println(curr+" va "+ user.getCurpassword());
        if (!user.getCurpassword().equals(curr)) {
        	message = "Sai mật khẩu hiện tại ";
        }else if (!user.getNewpassword().equals(user.getRepassword())) {
        	message = "Mật khẩu không trùng khớp! ";
        }
        return message;
    }
	
	public String validatepass(Myaccount user) {
		String message = "";
        if (!user.getNewpassword().equals(user.getRepassword())) {
        	message = "Mật khẩu không trùng khớp ! ";
        }
        return message;
    }
}
