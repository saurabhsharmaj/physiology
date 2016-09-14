package com.phyapp.web.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.phyapp.web.modal.Testtype;

@Component
public class TestTypeDaoImpl implements TestTypeDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Testtype> getList() {
		Criteria criteria = getSession().createCriteria(Testtype.class);
		criteria.add(Restrictions.eq("status", 0));
		criteria.addOrder(Order.asc("id"));
		return criteria.list();
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Testtype getTestTypeById(Integer testTypeId) {
		Criteria criteria = getSession().createCriteria(Testtype.class);
		criteria.add(Restrictions.eq("id", testTypeId));
		return (Testtype) criteria.uniqueResult();
	}

	public Integer saveTestType(Testtype testType) {
		Session session = getSession();
		session.saveOrUpdate(testType);
		Serializable id = session.getIdentifier(testType);
		return Integer.valueOf(id.toString());
	}

	public Integer updateTestType(Testtype testType) {
		Session session = getSession();
		session.saveOrUpdate(testType);
		Serializable id = session.getIdentifier(testType);
		return Integer.valueOf(id.toString());
	}

	public void deleteTestType(Testtype testType) {
		Session session = getSession();
		session.delete(testType);
		
	}

	public Testtype isTestTypeAvailable(Testtype testType) {
		Criteria criteria = getSession().createCriteria(Testtype.class);
		criteria.add(Restrictions.eq("testName", testType.getTestName()));
		criteria.add(Restrictions.eq("status", 0));
		return (Testtype)criteria.uniqueResult();
	}
	
}
