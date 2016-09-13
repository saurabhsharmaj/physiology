package com.phyapp.web.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.phyapp.web.modal.Testdetail;
import com.phyapp.web.modal.Testhistory;

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
		criteria.setFetchMode("testhistories", FetchMode.JOIN);
		criteria.setFetchMode("testtype", FetchMode.JOIN);
		return (Testdetail) criteria.uniqueResult();
	}

	public Integer saveTestDetail(Testdetail testDetail) {
		Session session = getSession();
		session.saveOrUpdate(testDetail);
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

	public Integer saveTestHistory(Testhistory testhistory) {
		Session session = getSession();
		session.saveOrUpdate(testhistory);
		Serializable id = session.getIdentifier(testhistory);
		return Integer.valueOf(id.toString());
	}

	public List<Testdetail> getLatestList() {
		String sql = "SELECT * FROM "
				+ "testdetail t1 "
				+ "WHERE id = "
				+ "(SELECT max(id) FROM testdetail t2  WHERE t1.userid= t2.userid and t1.testtypeid = t2.testtypeid) "
				+ "GROUP BY userid, testtypeid ORDER BY id DESC";
		SQLQuery query = getSession().createSQLQuery(sql);
		query.addEntity(Testdetail.class);
		List<Testdetail> results = query.list();
		for (Testdetail testdetail : results) {
			testdetail.getUserDetail().getId();
		}
		return results;
	}

	public Testdetail getLatestTestDetailByUserIdAndTestType(Integer userId, Integer testTypeId) {
		String sql = "SELECT * FROM "
				+ "testdetail t1 "
				+ "WHERE id = "
				+ "(SELECT max(id) FROM testdetail t2  WHERE t1.userid= t2.userid and t1.testtypeid = t2.testtypeid and t1.userid= :userId and t1.testtypeid = :testTypeId) "
				+ "GROUP BY userid, testtypeid ORDER BY id DESC";
		SQLQuery query = getSession().createSQLQuery(sql);
		query.addEntity(Testdetail.class);
		query.setParameter("userId", userId);
		query.setParameter("testTypeId", testTypeId);
		Testdetail result = (Testdetail) query.uniqueResult();		
		return result;
	}

	@Override
	public List<Testdetail> getTestDetailByUserId(Integer userid) {
		Criteria criteria = getSession().createCriteria(Testdetail.class);
		criteria.add(Restrictions.eq("userDetail.id", userid));
		criteria.setFetchMode("testhistories", FetchMode.JOIN);
		criteria.setFetchMode("testtype", FetchMode.JOIN);
		return (List<Testdetail>) criteria.list();
	}

	@Override
	public List<Testdetail> getAllTestDetailByUserIdAndTestType(Integer userId, Integer testTypeId) {
		Criteria criteria = getSession().createCriteria(Testdetail.class);
		criteria.add(Restrictions.eq("userDetail.id", userId));
		criteria.add(Restrictions.eq("testtype.id", testTypeId));
		return criteria.list();
	}
}
