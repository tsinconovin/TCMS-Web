/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.TSINCO.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TSINCO.services.OwnerServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author tsinco_pc1
 */
@Controller
public class TotalReportsControllers {

    @RequestMapping(value = "/Reports/totalReports", method = RequestMethod.GET)
    public ModelAndView testGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/totalReports");
        OwnerServices osrv = new OwnerServices();
        mv.addObject("oList", osrv.getOwnerList());
        return mv;
    }

    @RequestMapping(value = "/Reports/totalReports", method = RequestMethod.POST)
    public ModelAndView testPost(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/totalReports");
        return mv;
    }

}
