package com.phyapp.web.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.phyapp.web.modal.Login;
import com.phyapp.web.modal.Testtype;

@Component
public class LoginDaoImpl implements LoginDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Login> getList() {
		Criteria criteria = getSession().createCriteria(Login.class);
		return criteria.list();
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Login getLoginDetailById(Integer userId) {
		Criteria criteria = getSession().createCriteria(Login.class);
		criteria.add(Restrictions.eq("id", userId));
		return (Login) criteria.uniqueResult();
	}

	public Integer saveLoginDetail(Login loginDetail) {
		Session session = getSession();
		session.save(loginDetail);
		Serializable id = session.getIdentifier(loginDetail);
		return Integer.valueOf(id.toString());
	}

	public Integer updateLoginDetail(Login loginDetail) {
		Session session = getSession();
		session.saveOrUpdate(loginDetail);
		Serializable id = session.getIdentifier(loginDetail);
		return Integer.valueOf(id.toString());
	}

	public void deleteLoginDetail(Login loginDetail) {
		Session session = getSession();
		session.delete(loginDetail);
		
	}

	public Login getLoginDetailByUserName(String username) {
		Criteria criteria = getSession().createCriteria(Login.class);
		criteria.add(Restrictions.eq("username", username));
		criteria.setFetchMode("userDetail", FetchMode.JOIN);
		return (Login) criteria.uniqueResult();
	}
	
}
