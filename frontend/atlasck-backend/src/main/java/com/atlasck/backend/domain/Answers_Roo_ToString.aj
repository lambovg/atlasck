// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.backend.domain;

import java.lang.String;

privileged aspect Answers_Roo_ToString {
    
    public String Answers.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Answer: ").append(getAnswer()).append(", ");
        sb.append("CreatedAt: ").append(getCreatedAt()).append(", ");
        sb.append("QuestionsId: ").append(getQuestionsId()).append(", ");
        sb.append("UpdatedAt: ").append(getUpdatedAt());
        return sb.toString();
    }
    
}
