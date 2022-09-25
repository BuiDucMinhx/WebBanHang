package com.minh.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

import com.minh.entity.Address;
import com.minh.entity.Authority;
import com.minh.model.MyAccountModel;
import com.minh.entity.Detail;
import com.minh.entity.Order;

@Service
public interface AccountService {

	ArrayList<Detail> detailList(String username);
	
	MyAccountModel getMyAccountInfo(String username);

	Address getAccountAddress(String username);

	void saveChangeInfo(String username, String fullName, String password);

	List<Order> getOrderByName(String name);

	String findEmail(String email);

	Map<String, Object> dataAuthorize();

	Authority saveAutorize(Authority authority);

	void deleteAutorizeId(Integer id);

	int sendCodeEmail(String email);

	void SaveRegister(MyAccountModel myaccount);
}
