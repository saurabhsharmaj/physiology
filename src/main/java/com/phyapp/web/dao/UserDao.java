package com.phyapp.web.dao;

import java.util.List;

import com.phyapp.web.modal.UserDetail;
import com.phyapp.web.modal.UserRole;

public interface UserDao {
	List<UserDetail> getList();
	UserDetail getUserDetailById(Integer userId);
	Integer saveUserDetail(UserDetail userDetail);
	Integer updateUserDetail(UserDetail userDetail);
	void deleteUserDetail(UserDetail userDetail);
	Integer saveUserRole(UserRole userRole);
	UserRole getUserRoleByUserId(Integer userId);
	boolean isUserNameExist(String username);
}
