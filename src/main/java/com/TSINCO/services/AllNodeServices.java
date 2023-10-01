package com.TSINCO.services;

import com.TSINCO.DAO.AllNodeDAO;
import com.TSINCO.model.All_Nodes;

import javax.servlet.http.HttpServletRequest;

public class AllNodeServices {

    public int insertNode(HttpServletRequest request) {
        All_Nodes an = new All_Nodes();

        if (request.getParameter("owner_car_id") != null)
            an.setOwner_car_id(Integer.parseInt(request.getParameter("owner_car_id")));
        else
            an.setOwner_car_id(0);

        an.setLocation(request.getParameter("location"));
        an.setDate(request.getParameter("date"));


        AllNodeDAO andao = new AllNodeDAO();

        int res = andao.insertNode(an);

        return res;
    }
}
