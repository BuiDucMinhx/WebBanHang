package com.minh.controller;


import java.security.Principal;
import javax.mail.MessagingException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.minh.MailerService.MailerService;
import com.minh.dao.AccountDAO;
import com.minh.dao.AuthorityDAO;
import com.minh.entity.Account;
import com.minh.entity.Authority;
import com.minh.entity.Role;
import com.minh.model.Code;
import com.minh.model.Myaccount;
import com.minh.service.SessionService;
import com.minh.service.UserService;

// Đăng kí và đăng nhập
@Controller
public class AuthController {
	@Autowired AccountDAO  accountDao;
	@Autowired SessionService sessionService;
	@Autowired UserService userService;
	@Autowired BCryptPasswordEncoder pe;
	@Autowired AccountDAO accountdao;
    @Autowired UserService validationService;
    @Autowired AuthorityDAO authoritydao;
    
	// Đăng nhập_________________________________________________
	@RequestMapping("/login")
	public String login(Model model) {
		return "auth/login";
	}
	
	@RequestMapping("/success")
	public String success(Model model, Principal principal) {
		model.addAttribute("message", "Đăng nhập thành công");
		return "redirect:/index";
	}
	
	@RequestMapping("/error1")
	public String error(Model model) {
		model.addAttribute("message", "Sai thông tin đăng nhập");
		return "forward:/login";
	}
	
	@RequestMapping("/logoff")
	public String logoff(Model model) {
		model.addAttribute("message","Đăng xuất thành công");
		return "forward:/login";
	}
	
	@RequestMapping("/denied")
	public String Denied(Model model) {
		model.addAttribute("message","Bạn không có quyền truy xuất!!!");
		return "auth/login";
	}
	
	@RequestMapping("/OAuth2")
	public String Success(OAuth2AuthenticationToken oauth2, Model model) {
		model.addAttribute("message","Đăng nhập thành công!!!");
		userService.loginFromOAuth2(oauth2);
		return "redirect:/index";
	}
	
	// Đăng kí______________________________________________________________________________
	@RequestMapping("/register")
	public String register(Model model) {
		return "auth/register";
	}
	
	@Autowired	MailerService mailer;
	@Autowired SessionService sessionservice;
	
	@PostMapping("/register")
	public String postregister(Model model,@ModelAttribute("register") Myaccount entity, BindingResult result ) throws MessagingException {
		int code = (int) Math.floor(((Math.random() * 899999) + 100000));
		mailer.send(entity.getEmail(), "Mã xác nhận đăng kí tài khoản MXgear", String.valueOf(code));
		sessionservice.set("email", entity.getEmail());
		sessionservice.set("code", String.valueOf(code));
		return "auth/vericode";
	}
	
	@PostMapping("/submitcode")
	public String code(Model model, @ModelAttribute("code") Code edoc) throws MessagingException {
		String code = sessionservice.get("code");
		String email = sessionservice.get("email");
		System.out.println(email);
		String entercode = edoc.getNumber1()+edoc.getNumber2()+edoc.getNumber3()+edoc.getNumber4()+edoc.getNumber5()+edoc.getNumber6();
		if(entercode.equals(code)) {
			System.out.println("đúng mã");
			model.addAttribute("account",new Myaccount());
			return "auth/newpass";
		}
		model.addAttribute("wrong","Sai mã xác nhận vui lòng kiểm tra lại!");
		return "auth/vericode";
	}
	
	@PostMapping("/newaccount")
	public String newaccount(Model model, @ModelAttribute("account") @Valid Myaccount myaccount, BindingResult result) throws MessagingException {
		String err = validationService.validatepass(myaccount);
		if (!err.isEmpty()) {
	        ObjectError error = new ObjectError("globalError", err);
	        result.addError(error);
	        return "auth/newpass";
	    }
		Account account = new Account();
		account.setUsername(sessionservice.get("email"));
		account.setEmail(sessionservice.get("email"));
		account.setPassword(pe.encode(myaccount.getNewpassword()) );
		Authority authority = new Authority();
		authority.setAccount(account);
		authority.setRole(new Role("USER","Users"));
		accountdao.save(account);
		authoritydao.save(authority);
		model.addAttribute("message","Đăng kí thành công");
		return "auth/login";
	}
}
