package com.phyapp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phyapp.web.dao.UserDao;
import com.phyapp.web.modal.UserDetail;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao testTypeDao;

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<UserDetail> getList() {
		return testTypeDao.getList();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public UserDetail getUserDetailById(Integer userId) {
		return testTypeDao.getUserDetailById(userId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer saveUserDetail(UserDetail testType) {
		return testTypeDao.saveUserDetail(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer updateUserDetail(UserDetail testType) {
		return testTypeDao.updateUserDetail(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteUserDetail(UserDetail testTypeId) {
		testTypeDao.deleteUserDetail(testTypeId);
	}	
}
