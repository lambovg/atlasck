// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.domain;

import com.atlasck.domain.Visitors;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Visitors_Roo_Jpa_Entity {
    
    declare @type: Visitors: @Entity;
    
    declare @type: Visitors: @Table(name = "visitors");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Visitors.id;
    
    public Integer Visitors.getId() {
        return this.id;
    }
    
    public void Visitors.setId(Integer id) {
        this.id = id;
    }
    
}