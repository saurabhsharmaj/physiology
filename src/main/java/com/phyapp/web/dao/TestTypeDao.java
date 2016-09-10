package com.phyapp.web.dao;

import java.util.List;

import com.phyapp.web.modal.Testtype;

public interface TestTypeDao {
	List<Testtype> getList();
	Testtype getTestTypeById(Integer testTypeId);
	Integer saveTestType(Testtype testType);
	Integer updateTestType(Testtype testType);
	void deleteTestType(Testtype testTypeId);
}
