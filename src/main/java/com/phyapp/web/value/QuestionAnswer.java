package com.phyapp.web.value;

public class QuestionAnswer {
	private Integer qid;
	private Integer questionType;
	private Integer score;
	private Integer option;

	public QuestionAnswer() {

	}

	public QuestionAnswer(Integer qid, Integer qType, Integer score, Integer option) {
		super();
		this.qid = qid;
		this.questionType = qType;
		this.score = score;
		this.option = option;
	}

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public Integer getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Integer questionType) {
		this.questionType = questionType;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getOption() {
		return option;
	}

	public void setOption(Integer option) {
		this.option = option;
	}

}
