// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.domain;

import com.atlasck.domain.Question;

privileged aspect Question_Roo_JavaBean {
    
    public String Question.getBody() {
        return this.body;
    }
    
    public void Question.setBody(String body) {
        this.body = body;
    }
    
    public Boolean Question.getVisible() {
        return this.visible;
    }
    
    public void Question.setVisible(Boolean visible) {
        this.visible = visible;
    }
    
    public Boolean Question.getEmailAnswer() {
        return this.emailAnswer;
    }
    
    public void Question.setEmailAnswer(Boolean emailAnswer) {
        this.emailAnswer = emailAnswer;
    }
    
}
