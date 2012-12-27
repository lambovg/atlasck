// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.domain;

import com.atlasck.domain.Answer;
import com.atlasck.domain.AnswerIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AnswerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AnswerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AnswerIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AnswerIntegrationTest: @Transactional;
    
    @Test
    public void AnswerIntegrationTest.testCountAnswers() {
        Assert.assertNotNull("Data on demand for 'Answer' failed to initialize correctly", dod.getRandomAnswer());
        long count = Answer.countAnswers();
        Assert.assertTrue("Counter for 'Answer' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AnswerIntegrationTest.testFindAnswer() {
        Answer obj = dod.getRandomAnswer();
        Assert.assertNotNull("Data on demand for 'Answer' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Answer' failed to provide an identifier", id);
        obj = Answer.findAnswer(id);
        Assert.assertNotNull("Find method for 'Answer' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Answer' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AnswerIntegrationTest.testFindAllAnswers() {
        Assert.assertNotNull("Data on demand for 'Answer' failed to initialize correctly", dod.getRandomAnswer());
        long count = Answer.countAnswers();
        Assert.assertTrue("Too expensive to perform a find all test for 'Answer', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Answer> result = Answer.findAllAnswers();
        Assert.assertNotNull("Find all method for 'Answer' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Answer' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AnswerIntegrationTest.testFindAnswerEntries() {
        Assert.assertNotNull("Data on demand for 'Answer' failed to initialize correctly", dod.getRandomAnswer());
        long count = Answer.countAnswers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Answer> result = Answer.findAnswerEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Answer' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Answer' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AnswerIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Answer' failed to initialize correctly", dod.getRandomAnswer());
        Answer obj = dod.getNewTransientAnswer(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Answer' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Answer' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Answer' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AnswerIntegrationTest.testRemove() {
        Answer obj = dod.getRandomAnswer();
        Assert.assertNotNull("Data on demand for 'Answer' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Answer' failed to provide an identifier", id);
        obj = Answer.findAnswer(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Answer' with identifier '" + id + "'", Answer.findAnswer(id));
    }
    
}
