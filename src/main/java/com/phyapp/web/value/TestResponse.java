package com.phyapp.web.value;

public class TestResponse {
	
	private Integer userid;
	
	private Integer testid;
	
	private Integer testTypeId;

	private QuestionAnswer[] questions;

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getTestid() {
		return testid;
	}

	public void setTestid(Integer testid) {
		this.testid = testid;
	}

	public QuestionAnswer[] getQuestions() {
		return questions;
	}

	public void setQuestions(QuestionAnswer[] questions) {
		this.questions = questions;
	}

	public Integer getTestTypeId() {
		return testTypeId;
	}

	public void setTestTypeId(Integer testTypeId) {
		this.testTypeId = testTypeId;
	}

}