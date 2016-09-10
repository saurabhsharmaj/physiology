package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.Login;

public interface LoginService {
	List<Login> getList();
	Login getLoginDetailById(Integer loginDetailId);
	Login getLoginDetailByUserName(String username);
	Integer saveLoginDetail(Login loginDetail);
	Integer updateLoginDetail(Login loginDetail);
	void deleteLoginDetail(Login loginDetail);
}