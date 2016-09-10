package com.phyapp.web.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.phyapp.web.modal.UserDetail;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<UserDetail> getList() {
		Criteria criteria = getSession().createCriteria(UserDetail.class);
		return criteria.list();
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public UserDetail getUserDetailById(Integer userId) {
		Criteria criteria = getSession().createCriteria(UserDetail.class);
		criteria.add(Restrictions.eq("id", userId));
		return (UserDetail) criteria.uniqueResult();
	}

	public Integer saveUserDetail(UserDetail userDetail) {
		Session session = getSession();
		session.save(userDetail);
		Serializable id = session.getIdentifier(userDetail);
		return Integer.valueOf(id.toString());
	}

	public Integer updateUserDetail(UserDetail userDetail) {
		Session session = getSession();
		session.saveOrUpdate(userDetail);
		Serializable id = session.getIdentifier(userDetail);
		return Integer.valueOf(id.toString());
	}

	public void deleteUserDetail(UserDetail userDetail) {
		Session session = getSession();
		session.delete(userDetail);
		
	}
	
}
