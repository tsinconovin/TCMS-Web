package com.TSINCO.services;

import com.TSINCO.DAO.OwnerCarsDAO;
import com.TSINCO.DAO.OwnerDAO;
import com.TSINCO.model.Owner;
import com.TSINCO.model.Owner_Car;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class OwnerCarServices {


    public List<Owner_Car> getCarList() {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
//        int limit = 10;
//        int offset = 1;
        return ocdao.getOwnerCarList();
    }

    public List<Owner_Car> getOwnerCarById(HttpServletRequest request) {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
        Owner_Car oc = new Owner_Car();

        if (request.getParameter("owner_id") != null)
            oc.setOwner_id(Long.parseLong(request.getParameter("owner_id")));
        else
            oc.setOwner_id(0);

        String whereClause = " WHERE owner_id = ? ";
        return ocdao.getOwnerCarById(whereClause, oc.getOwner_id());
    }


//    public List<Owner_Car> getCarListByColor(String colorList[]) {
//        OwnerCarsDAO ocdao = new OwnerCarsDAO();
//        String whereClause = "";
//
//        if (colorList != null && colorList.length > 0) {
//            whereClause = " WHERE color in (";
//            for (int i = 0; i < colorList.length; i++) {
//                whereClause += "?";
//
//                whereClause += ",";
//            }
//
//            whereClause = whereClause.substring( colorList.length - 1);
//            whereClause += ")";
//        }
//        return ocdao.getOwnerCarListByColor(whereClause, colorList);
//    }

//    public List<Owner_Car> getCarsInBlueRed(String colorList[]) {
//        OwnerCarsDAO ocdao = new OwnerCarsDAO();
//        String whereClause = " WHERE color IN ('red', 'blue')";
//        return ocdao.getOwnerCarsInRedBlue(whereClause, colorList);
//    }

    public List<Owner_Car> getCarsInBlueRed() {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
        String whereClause = " WHERE color IN ('red', 'blue')";
        return ocdao.getOwnerCarsInRedBlue(whereClause);
    }

    public List<Owner_Car> getCarListByColor(String colorList[]) {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
        String whereClause = "";

        if (colorList != null && colorList.length > 0) {
            whereClause = " WHERE color in (";
            for (int i = 0; i < colorList.length; i++) {
                whereClause += "?";
                if (i < colorList.length - 1) {
                    whereClause += ",";
                }
            }
            whereClause = whereClause.substring(0, whereClause.length());
            whereClause += ")";
        }
        return ocdao.getOwnerCarListByColor(whereClause, colorList);
    }

//    public ArrayList<Color> setColorsWithId(String colorId[]){
//
//    }


    public int addCar(HttpServletRequest request, ModelAndView mv) {
        Owner_Car oc = new Owner_Car();

        if (request.getParameter("owner_id") != null)
            oc.setOwner_id(Long.parseLong(request.getParameter("owner_id")));
        else
            oc.setOwner_id(0);

        oc.setType(request.getParameter("type"));
        oc.setColor(request.getParameter("color"));

        if (request.getParameter("length") != null)
            oc.setLength(Integer.parseInt(request.getParameter("length")));
        else
            oc.setLength(0);

        if (request.getParameter("load_valume") != null)
            oc.setLoad_valume(Integer.parseInt(request.getParameter("load_valume")));
        else oc.setLoad_valume(0);

        OwnerCarsDAO ocdao = new OwnerCarsDAO();

        mv.addObject("ocObj", oc);

        int res = ocdao.addCars(oc);
        return res;
    }


    public List<Owner_Car> ownerCarO70List() {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
        return ocdao.ownerCarO70List();
    }


    public List<Owner_Car> getOwnerCarByAgeInputGet() {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
//        Owner_Car oc = new Owner_Car();
//        List<Owner_Car> ageList = new ArrayList<>();

        int fromAge = 0;
        int toAge = 150;

        if (fromAge == -1) {
            fromAge = 0;
        }
        if (toAge == -1) {
            toAge = Integer.MAX_VALUE;
        }

        String whereClause = "WHERE o.age BETWEEN ? and ?";

        return ocdao.getOwnerCarByAgeRangeGet(whereClause, fromAge, toAge);
    }



    public List<Owner_Car> getOwnerCarByAgeInputPost(HttpServletRequest request) {
        OwnerCarsDAO ocdao = new OwnerCarsDAO();
//        Owner_Car oc = new Owner_Car();
//        List<Owner_Car> ageList = new ArrayList<>();

        int fromAge = validation.parsInt(request.getParameter("ageListFrom"));
        int toAge = validation.parsInt(request.getParameter("ageListTo"));

        if (fromAge == -1) {
            fromAge = 0;
        }
        if (toAge == -1) {
            toAge = Integer.MAX_VALUE;
        }

        String whereClause = "WHERE o.age BETWEEN ? and ?";

        return ocdao.getOwnerCarByAgeRangePost(whereClause, fromAge, toAge);
    }
}
