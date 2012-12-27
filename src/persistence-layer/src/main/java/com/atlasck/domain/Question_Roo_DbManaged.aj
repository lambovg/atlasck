// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.domain;

import com.atlasck.domain.Answer;
import com.atlasck.domain.Question;
import com.atlasck.domain.Visitor;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Question_Roo_DbManaged {
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
    private Set<Answer> Question.answers;
    
    @ManyToOne
    @JoinColumn(name = "visitor", referencedColumnName = "id", nullable = false)
    private Visitor Question.visitor;
    
    @Column(name = "title", length = 255)
    @NotNull
    private String Question.title;
    
    @Column(name = "visible")
    private Boolean Question.visible;
    
    @Column(name = "email_answer")
    private Boolean Question.emailAnswer;
    
    @Column(name = "created_at")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date Question.createdAt;
    
    @Column(name = "updated_at")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date Question.updatedAt;
    
    public Set<Answer> Question.getAnswers() {
        return answers;
    }
    
    public void Question.setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }
    
    public Visitor Question.getVisitor() {
        return visitor;
    }
    
    public void Question.setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }
    
    public String Question.getTitle() {
        return title;
    }
    
    public void Question.setTitle(String title) {
        this.title = title;
    }
    
    public Boolean Question.getVisible() {
        return visible;
    }
    
    public void Question.setVisible(Boolean visible) {
        this.visible = visible;
    }
    
    public Boolean Question.getEmailAnswer() {
        return emailAnswer;
    }
    
    public void Question.setEmailAnswer(Boolean emailAnswer) {
        this.emailAnswer = emailAnswer;
    }
    
    public Date Question.getCreatedAt() {
        return createdAt;
    }
    
    public void Question.setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date Question.getUpdatedAt() {
        return updatedAt;
    }
    
    public void Question.setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
}
