package com.phyapp.web.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.phyapp.utils.PhysiologyConstants;
import com.phyapp.web.modal.Answers;
import com.phyapp.web.modal.Question;
import com.phyapp.web.modal.Questiontype;

@Component
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Question> getList() {
		Criteria criteria = getSession().createCriteria(Question.class);
		return criteria.list();
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<Question> getListByTestType(Integer testTypeId) {
		Criteria criteria = getSession().createCriteria(Question.class);
		criteria.add(Restrictions.eq("testType", testTypeId));
		criteria.setFetchMode("questiontype", FetchMode.JOIN);
		criteria.setFetchMode("answerses", FetchMode.JOIN);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
	

	public Question getQuestionById(Integer questionId) {
		Criteria criteria = getSession().createCriteria(Question.class);
		criteria.add(Restrictions.eq("id", questionId));
		criteria.setFetchMode("questiontype", FetchMode.JOIN);
		criteria.setFetchMode("answerses", FetchMode.JOIN);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (Question) criteria.uniqueResult();
	}

	public Integer saveQuestion(Question question) {
		Session session = getSession();
		session.save(question);
		Serializable id = session.getIdentifier(question);
		return Integer.valueOf(id.toString());
	}

	public Integer updateQuestion(Question question) {
		Session session = getSession();
		session.saveOrUpdate(question);
		Serializable id = session.getIdentifier(question);
		return Integer.valueOf(id.toString());
	}

	public void deleteQuestion(Question loginDetail) {
		Session session = getSession();
		session.delete(loginDetail);
		
	}

	public Question getQuestionByQNo(Integer testTypeId, Integer qno) {
		Criteria criteria = getSession().createCriteria(Question.class);
		criteria.add(Restrictions.eq("testType", testTypeId));
		criteria.add(Restrictions.eq("id", qno));
		criteria.setFetchMode("questiontype", FetchMode.JOIN);
		criteria.setFetchMode("answerses", FetchMode.JOIN);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (Question)criteria.uniqueResult();
	}

	public Long getTotalQuestionByTestType(Integer testType) {
		Criteria criteria = getSession().createCriteria(Question.class);
		criteria.setProjection(Projections.rowCount());
		return (Long)criteria.uniqueResult();
	}

	public Questiontype getDefaultQuestionType() {
		Criteria criteria = getSession().createCriteria(Questiontype.class);
		criteria.add(Restrictions.eq("type", PhysiologyConstants.SINGLE_CHOICE));
		return (Questiontype) criteria.uniqueResult();
	}

	public Integer saveAnswer(Answers ans) {
		Session session = getSession();
		session.save(ans);
		Serializable id = session.getIdentifier(ans);
		return Integer.valueOf(id.toString());
	}

	public Questiontype getQuestonType(Integer questionTypeId) {
		Criteria criteria = getSession().createCriteria(Questiontype.class);
		criteria.add(Restrictions.eq("id", questionTypeId));
		return (Questiontype)criteria.uniqueResult();
	}

}
