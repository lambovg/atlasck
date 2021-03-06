// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.backend.web;

import com.atlasck.backend.domain.Answers;
import com.atlasck.backend.domain.Questions;
import java.lang.String;
import java.util.Set;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect QuestionController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByAnswerss", "form" }, method = RequestMethod.GET)
    public String QuestionController.findQuestionsesByAnswerssForm(Model uiModel) {
        return "question/findQuestionsesByAnswerss";
    }
    
    @RequestMapping(params = "find=ByAnswerss", method = RequestMethod.GET)
    public String QuestionController.findQuestionsesByAnswerss(@RequestParam("answerss") Set<Answers> answerss, Model uiModel) {
        uiModel.addAttribute("questionses", Questions.findQuestionsesByAnswerss(answerss).getResultList());
        return "question/list";
    }
    
}
