package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.UserDetail;
import com.phyapp.web.modal.UserRole;

public interface UserService {
	List<UserDetail> getList();
	UserDetail getUserDetailById(Integer userId);
	Integer saveUserDetail(UserDetail userDetail);
	Integer saveUserRole(UserRole userRole);
	Integer updateUserDetail(UserDetail userDetail);
	void deleteUserDetail(UserDetail userDetail);
}
