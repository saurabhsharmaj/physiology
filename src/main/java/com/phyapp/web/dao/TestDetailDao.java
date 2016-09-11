package com.phyapp.web.dao;

import java.util.List;

import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.modal.Testhistory;

public interface TestDetailDao {
	List<Testdetail> getList();
	Testdetail getTestDetailById(Integer testDetailId);	
	Integer saveTestDetail(Testdetail testDetail);
	Integer updateTestDetail(Testdetail testDetail);
	void deleteTestDetail(Testdetail testDetail);
	Integer saveTestHistory(Testhistory testhistory);
}
