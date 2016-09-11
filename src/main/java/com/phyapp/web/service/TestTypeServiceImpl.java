package com.phyapp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phyapp.web.dao.TestTypeDao;
import com.phyapp.web.modal.Testtype;

@Service
public class TestTypeServiceImpl implements TestTypeService {

	@Autowired
	TestTypeDao testTypeDao;

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<Testtype> getList() {
		return testTypeDao.getList();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Testtype getTestTypeById(Integer testTypeId) {
		return testTypeDao.getTestTypeById(testTypeId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer saveTestType(Testtype testType) {
		return testTypeDao.saveTestType(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer updateTestType(Testtype testType) {
		return testTypeDao.updateTestType(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteTestType(Testtype testTypeId) {
		testTypeDao.deleteTestType(testTypeId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Testtype isTestTypeAvailable(Testtype testType) {
		return testTypeDao.isTestTypeAvailable(testType);
	}

}
