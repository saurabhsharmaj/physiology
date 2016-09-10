package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.Testtype;

public interface TestTypeService {
	List<Testtype> getList();
	Testtype getTestTypeById(Integer testTypeId);
	Integer saveTestType(Testtype testType);
	Integer updateTestType(Testtype testType);
	void deleteTestType(Testtype testTypeId);
}
