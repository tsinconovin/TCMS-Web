package com.TSINCO.services;

import com.TSINCO.DAO.RoadsDAO;
import com.TSINCO.model.Roads;

import javax.servlet.http.HttpServletRequest;

public class RoadsServices {

    public int addRoad(HttpServletRequest request) {
        Roads r = new Roads();

        r.setName(request.getParameter("name"));
        r.setWidth(request.getParameter("width"));
        r.setGeom(request.getParameter("geom"));

        RoadsDAO rdao = new RoadsDAO();
        int res = rdao.insertRoad(r);
        return res;
    }

}
