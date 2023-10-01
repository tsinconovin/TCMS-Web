package com.TSINCO.controllers;

import com.TSINCO.DAO.OwnerDAO;
import com.TSINCO.model.Owner;
import com.TSINCO.services.OwnerServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class OwnerManagementController {

    @RequestMapping(value = "/Manager/ownerManagement", method = RequestMethod.GET)
    public ModelAndView testGet(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
        OwnerServices osrv = new OwnerServices();
        mv.addObject("oList", osrv.getOwnerList());
        return mv;
    }

//    @RequestMapping(value = "/Manager/ownerManagement", method = RequestMethod.GET)
//    public ModelAndView countOwnerListSizeGet(HttpServletRequest request, HttpServletResponse response) {
//        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
//        OwnerServices osrv = new OwnerServices();
//        mv.addObject("countOwnerListSizeGet", osrv.getOwnerListSize());
//        return mv;
//    }



    @RequestMapping(value = "/Manager/ownerManagement", method = RequestMethod.POST)
    public ModelAndView testPost(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
        OwnerServices osrv = new OwnerServices();

        int insertRes = osrv.addOwner(request);
        mv.addObject("insertRes", insertRes);

//        mv.addObject("insertRes",osrv.addOwner(request));

        mv.addObject("oList", osrv.getOwnerList());
        return mv;
    }



    @RequestMapping(value = "/Manager/deleteOwner", method = RequestMethod.POST)
    public ModelAndView deleteOwner(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
        OwnerServices osrv = new OwnerServices();
        osrv.deleteOwner(request);
        mv.addObject("oList", osrv.getOwnerList());
        return mv;
    }


    @RequestMapping(value = "/Manager/logicalDeleteOwner", method = RequestMethod.POST)
    public ModelAndView logicalDeleteOwner(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
        OwnerServices osrv = new OwnerServices();
        int ldRes = osrv.logicalDeleteOwner(request);
        mv.addObject("ldRes", ldRes);
        return mv;
    }

    @RequestMapping(value = "/Manager/updateOwner", method = RequestMethod.GET)
    public ModelAndView getUpdate(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/updateOwner");
        OwnerServices osrv = new OwnerServices();
        mv.addObject("oUpdateList", osrv.getOwnerById(request));
        return mv;
    }

    @RequestMapping(value = "/Manager/updateOwner", method = RequestMethod.POST)
    public ModelAndView updateOwner(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/updateOwner");
        OwnerServices osrv = new OwnerServices();
        int res = osrv.updateOwner(request);
        mv.addObject("res", res);
        return mv;
    }


//    @RequestMapping(value = "/Manager/getOwnerByInputPost", method = RequestMethod.POST)
//    public ModelAndView getOwnerByInputPost(HttpServletRequest request, HttpServletResponse response) {
//        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
//        // get owner by input
//        Owner gobi = new Owner();
//
//        if (request.getParameter("fullName") != null) {
//            gobi.setName(request.getParameter("fullName"));
//        } else {
//            gobi.setName("No Name");
//        }
//
//        if (request.getParameter("nationalCode") != null) {
//            gobi.setNational_code(request.getParameter("nationalCode"));
//        } else {
//            gobi.setNational_code("0000000000");
//        }
//
//        if (request.getParameter("age") != null) {
//            gobi.setAge(Integer.parseInt(request.getParameter("age")));
//        } else {
//            gobi.setAge(0);
//        }
//
//        if (request.getParameter("total_toll_paid") != null) {
//            gobi.setTotal_toll_paid(Integer.parseInt(request.getParameter("Payment")));
//        } else {
//            gobi.setTotal_toll_paid(0);
//        }
//
////        OwnerDAO odao = new OwnerDAO();
////        odao.addOwner(gobi);
//
//        OwnerServices osrv = new OwnerServices();
//        osrv.getOwnerListByInput(String name, String national_code, long age, int total_toll_paid);
//
//        mv.addObject("iOwnerList", osrv.getOwnerListByInput());
//        return mv;
//    }


    @RequestMapping(value = "/Manager/getOwnerByInputPost", method = RequestMethod.POST)
    public ModelAndView getOwnerByInputPost(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/Manager/ownerManagement");
        OwnerServices osrv = new OwnerServices();

        List<Owner> oList = osrv.getOwnerListByInput(request);
        mv.addObject("oList",oList);

//        mv.addObject("oList", osrv.getOwnerListByInput(request));

        return mv;
    }
}
