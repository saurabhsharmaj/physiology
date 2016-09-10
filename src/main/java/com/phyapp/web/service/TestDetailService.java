package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.Testdetail;

public interface TestDetailService {
	List<Testdetail> getList();
	Testdetail getTestDetailById(Integer testDetailId);	
	Integer saveTestDetail(Testdetail testDetail);
	Integer updateTestDetail(Testdetail testDetail);
	void deleteTestDetail(Testdetail testDetail);
	Integer createNewTest(Integer userId, Integer testTypeId);
}
