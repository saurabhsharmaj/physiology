package com.phyapp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phyapp.web.dao.QuestionDao;
import com.phyapp.web.modal.Answers;
import com.phyapp.web.modal.Question;
import com.phyapp.web.modal.Questiontype;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao testTypeDao;

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<Question> getList() {
		return testTypeDao.getList();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Question getQuestionById(Integer userId) {
		return testTypeDao.getQuestionById(userId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer saveQuestion(Question testType) {
		return testTypeDao.saveQuestion(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public Integer updateQuestion(Question testType) {
		return testTypeDao.updateQuestion(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteQuestion(Question testTypeId) {
		testTypeDao.deleteQuestion(testTypeId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<Question> getListByTestType(Integer testTypeId) {
		return testTypeDao.getListByTestType(testTypeId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Question getQuestionByQNo(Integer testTypeId, Integer qno) {
		return testTypeDao.getQuestionByQNo(testTypeId,qno);
	}
	
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Long getTotalQuestionByTestType(Integer testType) {
		return testTypeDao.getTotalQuestionByTestType(testType);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Questiontype getDefaultQuestionType() {
		return testTypeDao.getDefaultQuestionType();
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public Integer saveAnswer(Answers ans) {
		return testTypeDao.saveAnswer(ans);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)	
	public Questiontype getQuestonType(Integer questionType) {
		return testTypeDao.getQuestonType(questionType);
	}
}
