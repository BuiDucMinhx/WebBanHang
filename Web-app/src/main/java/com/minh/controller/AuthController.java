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
import com.minh.model.CodeModel;
import com.minh.model.MyAccountModel;
import com.minh.service.AccountService;
import com.minh.service.MailerService;
import com.minh.service.SessionService;
import com.minh.service.UserService;

// Đăng kí và đăng nhập
@Controller
public class AuthController {
	@Autowired SessionService sessionService;
	@Autowired UserService userService;
	@Autowired MailerService mailer;
    @Autowired UserService validationService;
	@Autowired AccountService accountService;
	
	@Autowired BCryptPasswordEncoder pe;

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

	@PostMapping("/register")
	public String register(Model model,@ModelAttribute("register") MyAccountModel entity) throws MessagingException {
		String email = entity.getEmail();
		String check = accountService.findEmail(email);
		int code = accountService.sendCodeEmail(email);
		
		if(!(check == null)) {
			model.addAttribute("msg", "Đã tồn tại tài khoản vui lòng nhập tên khác!");
			return "auth/register";
		}
		
		sessionService.set("email", entity.getEmail());
		sessionService.set("code", String.valueOf(code));
		return "auth/vericode";
	}
	
	@PostMapping("/submitcode")
	public String code(Model model, @ModelAttribute("code") CodeModel edoc) throws MessagingException {
		String code = sessionService.get("code");
		String entercode = edoc.getNumber1()+edoc.getNumber2()+edoc.getNumber3()+edoc.getNumber4()+edoc.getNumber5()+edoc.getNumber6();
		if(entercode.equals(code)) {
			model.addAttribute("account",new MyAccountModel());
			return "auth/newpass";
		}
		model.addAttribute("wrong","Sai mã xác nhận vui lòng kiểm tra lại!");
		return "auth/vericode";
	}
	
	@PostMapping("/newaccount")
	public String newaccount(Model model, @ModelAttribute("account") @Valid MyAccountModel myaccount, BindingResult result) throws MessagingException {
		String err = validationService.validatepass(myaccount);
		myaccount.setEmail(sessionService.get("email"));
		if (!err.isEmpty()) {
	        ObjectError error = new ObjectError("globalError", err);
	        result.addError(error);
	        return "auth/newpass";
	    }
		accountService.SaveRegister(myaccount);
		model.addAttribute("message","Đăng kí thành công");
		return "auth/login";
	}
}
