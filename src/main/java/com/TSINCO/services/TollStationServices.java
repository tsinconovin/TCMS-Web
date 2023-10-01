package com.TSINCO.services;

import com.TSINCO.DAO.TollStationDAO;
import com.TSINCO.model.Toll_Station;

import javax.servlet.http.HttpServletRequest;

public class TollStationServices {

    public int insertTollStation(HttpServletRequest request) {
        Toll_Station ts = new Toll_Station();

        ts.setName(request.getParameter("name"));

        if (request.getParameter("toll_per_cross") != null)
            ts.setToll_per_cross(Integer.parseInt(request.getParameter("toll_per_cross")));
        else
            ts.setToll_per_cross(0);

        ts.setLocation(request.getParameter("location"));

        TollStationDAO tsdao = new TollStationDAO();

        int res = tsdao.insertTollStation(ts);

        return res;
    }

}
