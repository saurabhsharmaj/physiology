package com.phyapp.web.dao;

import java.util.List;

import com.phyapp.web.modal.Login;
import com.phyapp.web.modal.Testdetail;

public interface TestDetailDao {
	List<Testdetail> getList();
	Testdetail getTestDetailById(Integer testDetailId);	
	Integer saveTestDetail(Testdetail testDetail);
	Integer updateTestDetail(Testdetail testDetail);
	void deleteTestDetail(Testdetail testDetail);
}
