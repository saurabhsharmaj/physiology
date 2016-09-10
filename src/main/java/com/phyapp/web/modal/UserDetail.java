package com.phyapp.web.modal;
// Generated Aug 27, 2016 8:17:55 PM by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * UserDetail generated by hbm2java
 */
@Entity
@Table(name = "user_detail", catalog = "physiologydb")
public class UserDetail implements java.io.Serializable {

	private Integer id;
	private String name;
	private String fname;
	private Integer age;
	private Integer sex;
	private String educationType;
	private String educationMedium;
	private String domicile;
	private Integer maritialStatus;
	private String monthlyIncome;
	private String religion;
	private Integer familyType;
	private Integer birthorder;
	private String locality;
	private String address;
	private String mobileno;
	private String phno;
	private Set<Login> logins = new HashSet<Login>(0);
	private Set<Testdetail> testdetails = new HashSet<Testdetail>(0);
	private Set<Testhistory> testhistories = new HashSet<Testhistory>(0);

	public UserDetail() {
	}

	public UserDetail(String name, String fname, Integer age, Integer sex, String educationType, String educationMedium,
			String domicile, Integer maritialStatus, String monthlyIncome, String religion, Integer familyType,
			Integer birthorder, String locality, String address, String mobileno, String phno, Set<Login> logins,
			Set<Testdetail> testdetails, Set<Testhistory> testhistories) {
		this.name = name;
		this.fname = fname;
		this.age = age;
		this.sex = sex;
		this.educationType = educationType;
		this.educationMedium = educationMedium;
		this.domicile = domicile;
		this.maritialStatus = maritialStatus;
		this.monthlyIncome = monthlyIncome;
		this.religion = religion;
		this.familyType = familyType;
		this.birthorder = birthorder;
		this.locality = locality;
		this.address = address;
		this.mobileno = mobileno;
		this.phno = phno;
		this.logins = logins;
		this.testdetails = testdetails;
		this.testhistories = testhistories;
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "fname")
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "educationType")
	public String getEducationType() {
		return this.educationType;
	}

	public void setEducationType(String educationType) {
		this.educationType = educationType;
	}

	@Column(name = "educationMedium")
	public String getEducationMedium() {
		return this.educationMedium;
	}

	public void setEducationMedium(String educationMedium) {
		this.educationMedium = educationMedium;
	}

	@Column(name = "domicile")
	public String getDomicile() {
		return this.domicile;
	}

	public void setDomicile(String domicile) {
		this.domicile = domicile;
	}

	@Column(name = "maritialStatus")
	public Integer getMaritialStatus() {
		return this.maritialStatus;
	}

	public void setMaritialStatus(Integer maritialStatus) {
		this.maritialStatus = maritialStatus;
	}

	@Column(name = "monthlyIncome", length = 45)
	public String getMonthlyIncome() {
		return this.monthlyIncome;
	}

	public void setMonthlyIncome(String monthlyIncome) {
		this.monthlyIncome = monthlyIncome;
	}

	@Column(name = "religion")
	public String getReligion() {
		return this.religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	@Column(name = "familyType")
	public Integer getFamilyType() {
		return this.familyType;
	}

	public void setFamilyType(Integer familyType) {
		this.familyType = familyType;
	}

	@Column(name = "birthorder")
	public Integer getBirthorder() {
		return this.birthorder;
	}

	public void setBirthorder(Integer birthorder) {
		this.birthorder = birthorder;
	}

	@Column(name = "locality")
	public String getLocality() {
		return this.locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	@Column(name = "address")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "mobileno", length = 15)
	public String getMobileno() {
		return this.mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	@Column(name = "phno", length = 15)
	public String getPhno() {
		return this.phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userDetail")
	public Set<Login> getLogins() {
		return this.logins;
	}

	public void setLogins(Set<Login> logins) {
		this.logins = logins;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userDetail")
	public Set<Testdetail> getTestdetails() {
		return this.testdetails;
	}

	public void setTestdetails(Set<Testdetail> testdetails) {
		this.testdetails = testdetails;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userDetail")
	public Set<Testhistory> getTesthistories() {
		return this.testhistories;
	}

	public void setTesthistories(Set<Testhistory> testhistories) {
		this.testhistories = testhistories;
	}

}
