package com.phyapp.web.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.phyapp.web.modal.Testdetail;

@Component
public class TestDetailDaoImpl implements TestDetailDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Testdetail> getList() {
		Criteria criteria = getSession().createCriteria(Testdetail.class);
		return criteria.list();
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Testdetail getTestDetailById(Integer userId) {
		Criteria criteria = getSession().createCriteria(Testdetail.class);
		criteria.add(Restrictions.eq("id", userId));
		return (Testdetail) criteria.uniqueResult();
	}

	public Integer saveTestDetail(Testdetail testDetail) {
		Session session = getSession();
		session.save(testDetail);
		Serializable id = session.getIdentifier(testDetail);
		return Integer.valueOf(id.toString());
	}

	public Integer updateTestDetail(Testdetail testDetail) {
		Session session = getSession();
		session.saveOrUpdate(testDetail);
		Serializable id = session.getIdentifier(testDetail);
		return Integer.valueOf(id.toString());
	}

	public void deleteTestDetail(Testdetail testDetail) {
		Session session = getSession();
		session.delete(testDetail);
		
	}
}
