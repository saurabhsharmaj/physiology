package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.modal.Testhistory;

public interface TestDetailService {
	List<Testdetail> getList();
	Testdetail getTestDetailById(Integer testDetailId);	
	Integer saveTestDetail(Testdetail testDetail);
	Integer updateTestDetail(Testdetail testDetail);
	void deleteTestDetail(Testdetail testDetail);
	Integer createNewTest(Integer userId, Integer testTypeId);
	Integer saveTestHistory(Testhistory testhistory);
	List<Testdetail> getLatestList();
	Testdetail getLatestTestDetailByUserIdAndTestType(Integer id, Integer id2);
}
