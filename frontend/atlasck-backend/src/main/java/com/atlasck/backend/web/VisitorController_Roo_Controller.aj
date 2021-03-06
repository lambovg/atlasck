// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atlasck.backend.web;

import com.atlasck.backend.domain.Questions;
import com.atlasck.backend.domain.Visitors;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VisitorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VisitorController.create(@Valid Visitors visitors, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("visitors", visitors);
            addDateTimeFormatPatterns(uiModel);
            return "visitor/create";
        }
        uiModel.asMap().clear();
        visitors.persist();
        return "redirect:/visitor/" + encodeUrlPathSegment(visitors.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VisitorController.createForm(Model uiModel) {
        uiModel.addAttribute("visitors", new Visitors());
        addDateTimeFormatPatterns(uiModel);
        return "visitor/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String VisitorController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("visitors", Visitors.findVisitors(id));
        uiModel.addAttribute("itemId", id);
        return "visitor/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VisitorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("visitorses", Visitors.findVisitorsEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Visitors.countVisitorses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("visitorses", Visitors.findAllVisitorses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "visitor/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VisitorController.update(@Valid Visitors visitors, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("visitors", visitors);
            addDateTimeFormatPatterns(uiModel);
            return "visitor/update";
        }
        uiModel.asMap().clear();
        visitors.merge();
        return "redirect:/visitor/" + encodeUrlPathSegment(visitors.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String VisitorController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("visitors", Visitors.findVisitors(id));
        addDateTimeFormatPatterns(uiModel);
        return "visitor/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String VisitorController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Visitors.findVisitors(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/visitor";
    }
    
    @ModelAttribute("questionses")
    public Collection<Questions> VisitorController.populateQuestionses() {
        return Questions.findAllQuestionses();
    }
    
    @ModelAttribute("visitorses")
    public Collection<Visitors> VisitorController.populateVisitorses() {
        return Visitors.findAllVisitorses();
    }
    
    void VisitorController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("visitors_createdat_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("visitors_updatedat_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String VisitorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
