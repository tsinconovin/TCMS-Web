/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.TSINCO.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tsinco-pc2
 */
@Controller
public class HomeController {

    @RequestMapping(value = "/home/home", method = RequestMethod.GET)
    public ModelAndView HomeGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/home/home");
        return mv;
    }
}
