package com.atlasck.domain;

// Generated Oct 28, 2010 9:14:28 AM by Hibernate Tools 3.3.0.GA

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Question generated by hbm2java
 */
public class Question implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Visitor visitor;

	@NotEmpty(message="{validation.not_empty}")
	private String title;

	@NotEmpty(message="{validation.not_empty}")
	private String question;

	private Boolean visible;
	private Boolean emailAnswer;
	private Date createdAt;
	private Date updatedAt;
	private Set<Answer> answers = new HashSet<Answer>(0);

	public Question() {
	}

	public Question(Visitor visitor, String title, String question) {
		this.visitor = visitor;
		this.title = title;
		this.question = question;
	}

	public Question(Visitor visitor, String title, String question,
			Boolean visible, Boolean emailAnswer, Date createdAt,
			Date updatedAt, Set<Answer> answers) {
		this.visitor = visitor;
		this.title = title;
		this.question = question;
		this.visible = visible;
		this.emailAnswer = emailAnswer;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.answers = answers;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Valid
	public Visitor getVisitor() {
		return this.visitor;
	}

	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Boolean getVisible() {
		return this.visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public Boolean getEmailAnswer() {
		return this.emailAnswer;
	}

	public void setEmailAnswer(Boolean emailAnswer) {
		this.emailAnswer = emailAnswer;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Set<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

}
