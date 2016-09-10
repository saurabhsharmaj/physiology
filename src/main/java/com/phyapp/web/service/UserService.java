package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.UserDetail;

public interface UserService {
	List<UserDetail> getList();
	UserDetail getUserDetailById(Integer userId);
	Integer saveUserDetail(UserDetail userDetail);
	Integer updateUserDetail(UserDetail userDetail);
	void deleteUserDetail(UserDetail userDetail);
}
