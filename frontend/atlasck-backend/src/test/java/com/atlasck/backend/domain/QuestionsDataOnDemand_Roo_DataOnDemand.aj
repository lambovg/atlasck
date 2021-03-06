// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.backend.domain;

import com.atlasck.backend.domain.Questions;
import com.atlasck.backend.domain.Visitors;
import com.atlasck.backend.domain.VisitorsDataOnDemand;
import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect QuestionsDataOnDemand_Roo_DataOnDemand {
    
    declare @type: QuestionsDataOnDemand: @Component;
    
    private Random QuestionsDataOnDemand.rnd = new SecureRandom();
    
    private List<Questions> QuestionsDataOnDemand.data;
    
    @Autowired
    private VisitorsDataOnDemand QuestionsDataOnDemand.visitorsDataOnDemand;
    
    public Questions QuestionsDataOnDemand.getNewTransientQuestions(int index) {
        Questions obj = new Questions();
        setCreatedAt(obj, index);
        setEmailAnswer(obj, index);
        setQuestion(obj, index);
        setTitle(obj, index);
        setUpdatedAt(obj, index);
        setVisible(obj, index);
        setVisitorsId(obj, index);
        return obj;
    }
    
    public void QuestionsDataOnDemand.setCreatedAt(Questions obj, int index) {
        Date createdAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedAt(createdAt);
    }
    
    public void QuestionsDataOnDemand.setEmailAnswer(Questions obj, int index) {
        Boolean emailAnswer = Boolean.TRUE;
        obj.setEmailAnswer(emailAnswer);
    }
    
    public void QuestionsDataOnDemand.setQuestion(Questions obj, int index) {
        String question = "question_" + index;
        obj.setQuestion(question);
    }
    
    public void QuestionsDataOnDemand.setTitle(Questions obj, int index) {
        String title = "title_" + index;
        if (title.length() > 255) {
            title = title.substring(0, 255);
        }
        obj.setTitle(title);
    }
    
    public void QuestionsDataOnDemand.setUpdatedAt(Questions obj, int index) {
        Date updatedAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdatedAt(updatedAt);
    }
    
    public void QuestionsDataOnDemand.setVisible(Questions obj, int index) {
        Boolean visible = Boolean.TRUE;
        obj.setVisible(visible);
    }
    
    public void QuestionsDataOnDemand.setVisitorsId(Questions obj, int index) {
        Visitors visitorsId = visitorsDataOnDemand.getRandomVisitors();
        obj.setVisitorsId(visitorsId);
    }
    
    public Questions QuestionsDataOnDemand.getSpecificQuestions(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Questions obj = data.get(index);
        return Questions.findQuestions(obj.getId());
    }
    
    public Questions QuestionsDataOnDemand.getRandomQuestions() {
        init();
        Questions obj = data.get(rnd.nextInt(data.size()));
        return Questions.findQuestions(obj.getId());
    }
    
    public boolean QuestionsDataOnDemand.modifyQuestions(Questions obj) {
        return false;
    }
    
    public void QuestionsDataOnDemand.init() {
        data = Questions.findQuestionsEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Questions' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<com.atlasck.backend.domain.Questions>();
        for (int i = 0; i < 10; i++) {
            Questions obj = getNewTransientQuestions(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
