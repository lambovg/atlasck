// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.domain;

import com.atlasck.domain.CurrentVersion;
import javax.persistence.Column;

privileged aspect CurrentVersion_Roo_DbManaged {
    
    @Column(name = "username", length = 255)
    private String CurrentVersion.username;
    
    @Column(name = "passwd", length = 255)
    private String CurrentVersion.passwd;
    
    @Column(name = "maintenance")
    private Boolean CurrentVersion.maintenance;
    
    @Column(name = "http_auth")
    private Boolean CurrentVersion.httpAuth;
    
    public String CurrentVersion.getUsername() {
        return username;
    }
    
    public void CurrentVersion.setUsername(String username) {
        this.username = username;
    }
    
    public String CurrentVersion.getPasswd() {
        return passwd;
    }
    
    public void CurrentVersion.setPasswd(String passwd) {
        this.passwd = passwd;
    }
    
    public Boolean CurrentVersion.getMaintenance() {
        return maintenance;
    }
    
    public void CurrentVersion.setMaintenance(Boolean maintenance) {
        this.maintenance = maintenance;
    }
    
    public Boolean CurrentVersion.getHttpAuth() {
        return httpAuth;
    }
    
    public void CurrentVersion.setHttpAuth(Boolean httpAuth) {
        this.httpAuth = httpAuth;
    }
    
}