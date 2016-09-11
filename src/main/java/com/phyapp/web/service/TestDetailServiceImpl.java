package com.phyapp.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phyapp.web.dao.TestDetailDao;
import com.phyapp.web.dao.TestTypeDao;
import com.phyapp.web.dao.UserDao;
import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.modal.Testhistory;

@Service
public class TestDetailServiceImpl implements TestDetailService {

	@Autowired
	UserDao userDao;
	
	@Autowired
	TestTypeDao testTypeDao;
	
	@Autowired
	TestDetailDao testDetailDao;

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<Testdetail> getList() {
		return testDetailDao.getList();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Testdetail getTestDetailById(Integer userId) {
		return testDetailDao.getTestDetailById(userId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer saveTestDetail(Testdetail testdetail) {
		return testDetailDao.saveTestDetail(testdetail);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer updateTestDetail(Testdetail testdetail) {
		return testDetailDao.updateTestDetail(testdetail);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteTestDetail(Testdetail testdetail) {
		testDetailDao.deleteTestDetail(testdetail);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer createNewTest(Integer userId, Integer testTypeId) {
		Testdetail testDetail = new Testdetail();
		testDetail.setUserDetail(userDao.getUserDetailById(userId));
		testDetail.setTesttype(testTypeDao.getTestTypeById(testTypeId));
		testDetail.setUpdatedOn(new Date());
		return testDetailDao.saveTestDetail(testDetail);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer saveTestHistory(Testhistory testhistory) {
		return testDetailDao.saveTestHistory(testhistory);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<Testdetail> getLatestList() {
		return testDetailDao.getLatestList();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Testdetail getLatestTestDetailByUserIdAndTestType(Integer userId, Integer testTypeId) {
		return testDetailDao.getLatestTestDetailByUserIdAndTestType(userId, testTypeId);
	}
}
