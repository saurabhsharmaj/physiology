package com.phyapp.web.dao;

import java.util.List;

import com.phyapp.web.modal.UserDetail;

public interface UserDao {
	List<UserDetail> getList();
	UserDetail getUserDetailById(Integer userId);
	Integer saveUserDetail(UserDetail userDetail);
	Integer updateUserDetail(UserDetail userDetail);
	void deleteUserDetail(UserDetail userDetail);
}
