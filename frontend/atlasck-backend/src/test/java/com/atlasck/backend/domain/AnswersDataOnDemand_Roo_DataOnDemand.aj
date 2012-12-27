// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.backend.domain;

import com.atlasck.backend.domain.Answers;
import com.atlasck.backend.domain.Questions;
import com.atlasck.backend.domain.QuestionsDataOnDemand;
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

privileged aspect AnswersDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AnswersDataOnDemand: @Component;
    
    private Random AnswersDataOnDemand.rnd = new SecureRandom();
    
    private List<Answers> AnswersDataOnDemand.data;
    
    @Autowired
    private QuestionsDataOnDemand AnswersDataOnDemand.questionsDataOnDemand;
    
    public Answers AnswersDataOnDemand.getNewTransientAnswers(int index) {
        Answers obj = new Answers();
        setAnswer(obj, index);
        setCreatedAt(obj, index);
        setQuestionsId(obj, index);
        setUpdatedAt(obj, index);
        return obj;
    }
    
    public void AnswersDataOnDemand.setAnswer(Answers obj, int index) {
        String answer = "answer_" + index;
        obj.setAnswer(answer);
    }
    
    public void AnswersDataOnDemand.setCreatedAt(Answers obj, int index) {
        Date createdAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedAt(createdAt);
    }
    
    public void AnswersDataOnDemand.setQuestionsId(Answers obj, int index) {
        Questions questionsId = questionsDataOnDemand.getRandomQuestions();
        obj.setQuestionsId(questionsId);
    }
    
    public void AnswersDataOnDemand.setUpdatedAt(Answers obj, int index) {
        Date updatedAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdatedAt(updatedAt);
    }
    
    public Answers AnswersDataOnDemand.getSpecificAnswers(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Answers obj = data.get(index);
        return Answers.findAnswers(obj.getId());
    }
    
    public Answers AnswersDataOnDemand.getRandomAnswers() {
        init();
        Answers obj = data.get(rnd.nextInt(data.size()));
        return Answers.findAnswers(obj.getId());
    }
    
    public boolean AnswersDataOnDemand.modifyAnswers(Answers obj) {
        return false;
    }
    
    public void AnswersDataOnDemand.init() {
        data = Answers.findAnswersEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Answers' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<com.atlasck.backend.domain.Answers>();
        for (int i = 0; i < 10; i++) {
            Answers obj = getNewTransientAnswers(i);
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