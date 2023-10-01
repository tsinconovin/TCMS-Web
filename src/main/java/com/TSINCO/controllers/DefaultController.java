package com.TSINCO.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@Configuration
@Controller
public class DefaultController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView LogInGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/LogIn");
        return mv;
    }

}
