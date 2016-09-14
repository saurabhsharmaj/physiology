package com.phyapp.web.modal;
// Generated Aug 27, 2016 8:17:55 PM by Hibernate Tools 4.3.1.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * Testtype generated by hbm2java
 */
@Entity
@Table(name = "testtype", catalog = "physiologydb")
public class Testtype implements java.io.Serializable {

	private Integer id;
	private String testName;
	private String description;
	private Integer status;
	private List<TesttypeHasQuestion> testtypeHasQuestions = new LinkedList<TesttypeHasQuestion>();
	private List<Testhistory> testhistories = new LinkedList<Testhistory>();
	private List<Testdetail> testdetails = new LinkedList<Testdetail>();

	public Testtype() {
	}
	
	public Testtype(String testName) {
		this.testName = testName;
		this.description= "NA";
		this.status= 0;
	}

	public Testtype(String testName, String description, Integer status, List<TesttypeHasQuestion> testtypeHasQuestions,
			List<Testhistory> testhistories, List<Testdetail> testdetails) {
		this.testName = testName;
		this.description = description;
		this.status = status;
		this.testtypeHasQuestions = testtypeHasQuestions;
		this.testhistories = testhistories;
		this.testdetails = testdetails;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "testName")
	public String getTestName() {
		return this.testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "testtype")
	@OrderBy("id")
	public List<TesttypeHasQuestion> getTesttypeHasQuestions() {
		return this.testtypeHasQuestions;
	}

	public void setTesttypeHasQuestions(List<TesttypeHasQuestion> testtypeHasQuestions) {
		this.testtypeHasQuestions = testtypeHasQuestions;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "testtype")
	@OrderBy("id")
	public List<Testhistory> getTesthistories() {
		return this.testhistories;
	}

	public void setTesthistories(List<Testhistory> testhistories) {
		this.testhistories = testhistories;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "testtype")
	@OrderBy("id")
	public List<Testdetail> getTestdetails() {
		return this.testdetails;
	}

	public void setTestdetails(List<Testdetail> testdetails) {
		this.testdetails = testdetails;
	}

}
