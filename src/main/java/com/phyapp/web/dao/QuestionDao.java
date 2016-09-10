package com.phyapp.web.dao;

import java.util.List;

import com.phyapp.web.modal.Question;

public interface QuestionDao {
	List<Question> getList();
	List<Question> getListByTestType(Integer testTypeId);
	Question getQuestionById(Integer queId);	
	Integer saveQuestion(Question question);
	Integer updateQuestion(Question question);
	void deleteQuestion(Question question);
	Question getQuestionByQNo(Integer testTypeId, Integer qno);
	Long getTotalQuestionByTestType(Integer testType);
}
