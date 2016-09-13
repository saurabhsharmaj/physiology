package com.phyapp.web.value;

import java.util.Map;

import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.modal.UserDetail;

public class TestDetailResponse {
private UserDetail userDetail;
private Map<String, Testdetail> testResults;
public UserDetail getUserDetail() {
	return userDetail;
}
public void setUserDetail(UserDetail userDetail) {
	this.userDetail = userDetail;
}
public Map<String, Testdetail> getTestResults() {
	return testResults;
}
public void setTestResults(Map<String, Testdetail> testResults) {
	this.testResults = testResults;
}


}
