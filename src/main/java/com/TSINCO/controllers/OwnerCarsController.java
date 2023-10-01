package com.TSINCO.controllers;

import com.TSINCO.model.Owner;
import com.TSINCO.model.Owner_Car;
import com.TSINCO.services.OwnerServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.TSINCO.services.OwnerCarServices;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class OwnerCarsController {

//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public ModelAndView ownerCarGet(HttpServletRequest request, HttpServletResponse response) {
//        ModelAndView mv = new ModelAndView("/");
//        return mv;
//    }

//    @RequestMapping(value = "/NewTest/Test", method = RequestMethod.POST)
//    public ModelAndView ownerCarPost(HttpServletRequest request, HttpServletResponse response) {
//        ModelAndView mv = new ModelAndView("/");
//
//        OwnerCarServices ocs = new OwnerCarServices();
//        int res = ocs.addOwnerCar(request);
//        mv.addObject("msg", res);
//
//        return mv;
//    }


    @RequestMapping(value = "/Manager/carManagement", method = RequestMethod.GET)
    public ModelAndView carManagementGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/carManagement");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("oCarList", ocsrv.getCarList());
        return mv;
    }

//    @RequestMapping(value = "/Reports/blueOrRedCarsReports", method = RequestMethod.POST)
//    public ModelAndView blueOrRedCarsReportsGet(HttpServletRequest request, HttpServletResponse response) {
//        ModelAndView mv = new ModelAndView("/Reports/blueOrRedCarsReports");
//        OwnerCarServices ocsrv = new OwnerCarServices();
//        mv.addObject("oCarList", ocsrv.getCarsInBlueRed(request.getParameterValues("colorName")));
//        return mv;
//    }


    @RequestMapping(value = "/Reports/blueOrRedCarsReports", method = RequestMethod.GET)
    public ModelAndView blueOrRedCarsReportsGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/blueOrRedCarsReports");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("oCarList", ocsrv.getCarsInBlueRed());
        return mv;
    }

    @RequestMapping(value = "/Reports/carsByColorReports", method = RequestMethod.GET)
    public ModelAndView carsByColoReportsGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByColorReports");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("oCarList", ocsrv.getCarList());
        return mv;
    }

    @RequestMapping(value = "/Reports/carsByColorReports", method = RequestMethod.POST)
    public ModelAndView carsByColoReportsPost(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByColorReports");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("oCarList", ocsrv.getCarListByColor(request.getParameterValues("colorName")));
        return mv;
    }


    @RequestMapping(value = "/Reports/carsByMultipleColorReports", method = RequestMethod.GET)
    public ModelAndView carsByMultipleColoReportsGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByMultipleColorReports");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("oCarList", ocsrv.getCarList());
        return mv;
    }

    @RequestMapping(value = "/Reports/carsByMultipleColorReports", method = RequestMethod.POST)
    public ModelAndView carsByMultipleColoReportsPost(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByMultipleColorReports");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("oCarList", ocsrv.getCarListByColor(request.getParameterValues("colorName")));
        return mv;
    }


    @RequestMapping(value = "/Manager/addCar", method = RequestMethod.GET)
    public ModelAndView getUpdate(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/addCar");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("ownerCarListById", ocsrv.getOwnerCarById(request));
        return mv;
    }

    @RequestMapping(value = "/Manager/addCar", method = RequestMethod.POST)
    public ModelAndView updateOwner(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/addCar");
        OwnerCarServices ocsrv = new OwnerCarServices();
        int res = ocsrv.addCar(request, mv);

        mv.addObject("res", res);
        return mv;
    }



    @RequestMapping(value = "/Reports/carsByOwnerAge", method = RequestMethod.GET)
    public ModelAndView getOwnerCarO70Get(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByOwnerAge");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("ownerCarO70List", ocsrv.ownerCarO70List());
        return mv;
    }

    @RequestMapping(value = "/Reports/carsByOwnerAgeRange", method = RequestMethod.GET)
    public ModelAndView getOwnerCarByAgeInputGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByOwnerAgeRange");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("ownerCarO70List", ocsrv.getOwnerCarByAgeInputGet());
        return mv;
    }

    @RequestMapping(value = "/Reports/carsByOwnerAgeRange", method = RequestMethod.POST)
    public ModelAndView getOwnerCarByAgeInputPost(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Reports/carsByOwnerAgeRange");
        OwnerCarServices ocsrv = new OwnerCarServices();
        mv.addObject("ocListByAgeRange", ocsrv.getOwnerCarByAgeInputPost(request));
        return mv;
    }


}
