package com.phyapp.web.service;

import java.util.List;

import com.phyapp.web.modal.Question;

public interface QuestionService {
	List<Question> getList();
	List<Question> getListByTestType(Integer testTypeId);
	Question getQuestionById(Integer queId);	
	Integer saveQuestion(Question question);
	Integer updateQuestion(Question question);
	void deleteQuestion(Question question);
	Question getQuestionByQNo(Integer testTypeId, Integer qno);
	Long getTotalQuestionByTestType(Integer testId);
}