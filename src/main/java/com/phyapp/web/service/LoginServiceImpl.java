package com.phyapp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phyapp.web.dao.LoginDao;
import com.phyapp.web.modal.Login;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao testTypeDao;

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<Login> getList() {
		return testTypeDao.getList();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Login getLoginDetailById(Integer userId) {
		return testTypeDao.getLoginDetailById(userId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer saveLoginDetail(Login testType) {
		return testTypeDao.saveLoginDetail(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer updateLoginDetail(Login testType) {
		return testTypeDao.updateLoginDetail(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteLoginDetail(Login testTypeId) {
		testTypeDao.deleteLoginDetail(testTypeId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Login getLoginDetailByUserName(String username) {
		// TODO Auto-generated method stub
		return testTypeDao.getLoginDetailByUserName(username);
	}	
}
