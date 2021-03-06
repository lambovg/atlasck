// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.backend.domain;

import com.atlasck.backend.domain.CurrentVersionDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CurrentVersionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CurrentVersionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CurrentVersionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: CurrentVersionIntegrationTest: @Transactional;
    
    @Autowired
    private CurrentVersionDataOnDemand CurrentVersionIntegrationTest.dod;
    
    @Test
    public void CurrentVersionIntegrationTest.testCountCurrentVersions() {
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to initialize correctly", dod.getRandomCurrentVersion());
        long count = com.atlasck.backend.domain.CurrentVersion.countCurrentVersions();
        org.junit.Assert.assertTrue("Counter for 'CurrentVersion' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CurrentVersionIntegrationTest.testFindCurrentVersion() {
        com.atlasck.backend.domain.CurrentVersion obj = dod.getRandomCurrentVersion();
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to initialize correctly", obj);
        java.lang.Integer id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to provide an identifier", id);
        obj = com.atlasck.backend.domain.CurrentVersion.findCurrentVersion(id);
        org.junit.Assert.assertNotNull("Find method for 'CurrentVersion' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CurrentVersion' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CurrentVersionIntegrationTest.testFindAllCurrentVersions() {
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to initialize correctly", dod.getRandomCurrentVersion());
        long count = com.atlasck.backend.domain.CurrentVersion.countCurrentVersions();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CurrentVersion', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.atlasck.backend.domain.CurrentVersion> result = com.atlasck.backend.domain.CurrentVersion.findAllCurrentVersions();
        org.junit.Assert.assertNotNull("Find all method for 'CurrentVersion' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CurrentVersion' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CurrentVersionIntegrationTest.testFindCurrentVersionEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to initialize correctly", dod.getRandomCurrentVersion());
        long count = com.atlasck.backend.domain.CurrentVersion.countCurrentVersions();
        if (count > 20) count = 20;
        java.util.List<com.atlasck.backend.domain.CurrentVersion> result = com.atlasck.backend.domain.CurrentVersion.findCurrentVersionEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'CurrentVersion' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CurrentVersion' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CurrentVersionIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to initialize correctly", dod.getRandomCurrentVersion());
        com.atlasck.backend.domain.CurrentVersion obj = dod.getNewTransientCurrentVersion(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CurrentVersion' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CurrentVersion' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CurrentVersionIntegrationTest.testRemove() {
        com.atlasck.backend.domain.CurrentVersion obj = dod.getRandomCurrentVersion();
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to initialize correctly", obj);
        java.lang.Integer id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'CurrentVersion' failed to provide an identifier", id);
        obj = com.atlasck.backend.domain.CurrentVersion.findCurrentVersion(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'CurrentVersion' with identifier '" + id + "'", com.atlasck.backend.domain.CurrentVersion.findCurrentVersion(id));
    }
    
}
