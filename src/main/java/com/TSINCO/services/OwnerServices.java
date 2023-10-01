package com.TSINCO.services;

import com.TSINCO.DAO.OwnerCarsDAO;
import com.TSINCO.DAO.OwnerDAO;
import com.TSINCO.model.Owner;
import com.TSINCO.model.Owner_Car;

import javax.servlet.http.HttpServletRequest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OwnerServices {


    public List<Owner> getOwnerList() {
        OwnerDAO odao = new OwnerDAO();
//        int limit = 10;
//        int offset = 1;
        return odao.getOwnerList();
    }


//    public int getOwnerListSize() {
//        OwnerDAO odao = new OwnerDAO();
//        return odao.getOwnerListSize();
//    }


    public int addOwner(HttpServletRequest request) {
        Owner o = new Owner();



        if(request.getParameter("fullName") == null || request.getParameter("fullName").isEmpty() ||
        request.getParameter("nationalCode") == null || request.getParameter("nationalCode").isEmpty() ||
                request.getParameter("age") == null || request.getParameter("age").isEmpty()) {
            return -2;
        }
        if(request.getParameter("nationalCode").length() != 10){
            return -3;
        }
        o.setName(request.getParameter("fullName"));
                o.setNational_code(request.getParameter("nationalCode"));

        if (request.getParameter("age") != null)
            o.setAge(Integer.parseInt(request.getParameter("age")));
        else
            o.setAge(0);

        if (request.getParameter("total_toll_paid") != null)
            o.setTotal_toll_paid(Integer.parseInt(request.getParameter("Payment")));
        else
            o.setTotal_toll_paid(0);

        OwnerDAO odao = new OwnerDAO();
        return odao.addOwner(o);
    }


    public int deleteOwner(HttpServletRequest request) {
        Owner o = new Owner();


        if (request.getParameter("delete") != null) {
            o.setId(Long.parseLong(request.getParameter("delete")));
            System.out.println("Toye deleteOwner HASTAM");
        } else {
            o.setId(0);
        }

        OwnerDAO odao = new OwnerDAO();
        int res = odao.deleteOwner(o);
        return res;
    }



    public int logicalDeleteOwner(HttpServletRequest request) {
        Owner o = new Owner();

        if (request.getParameter("logicalDelete") != null) {
            o.setId(Long.parseLong(request.getParameter("logicalDelete")));

        } else {
            o.setId(0);
        }

        OwnerDAO odao = new OwnerDAO();
        int ldRes = odao.logicalDeleteOwner(o);
        return ldRes;
    }



    public int updateOwner(HttpServletRequest request) {
        Owner o = new Owner();

        o.setId(Long.parseLong(request.getParameter("update")));
        o.setName(request.getParameter("fullName"));
        o.setNational_code(request.getParameter("nationalCode"));

        if (request.getParameter("age") != null)
            o.setAge(Integer.parseInt(request.getParameter("age")));
        else
            o.setAge(0);

        if (request.getParameter("Payment") != null)
            o.setTotal_toll_paid(Integer.parseInt(request.getParameter("Payment")));
        else
            o.setTotal_toll_paid(0);

        OwnerDAO odao = new OwnerDAO();
        return odao.updateOwner(o);
    }

    public Owner getOwnerById(HttpServletRequest request) {
        OwnerDAO odao = new OwnerDAO();
        return odao.getOwnerById(Integer.parseInt(request.getParameter("update")));
    }


//    public List<Owner> getOwnerListByInput(String name, String national_code, long age, int total_toll_paid) {
//        List<Owner> inputOwnerList = new ArrayList<>();
//        PreparedStatement ps = null;
//
//
//        try {
//            String query = "SELECT * FROM owner";
//            int i = 0;
//
//            if ((name != null && !name.isEmpty()) ||
//                    (national_code != -1) ||
//                    (age != -1) ||
//                    (total_toll_paid != -1)) {
//                query += " WHERE ";
//            }
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//        }
//        return ownerList;
//    }


    public List<Owner> getOwnerListByInput(HttpServletRequest request) {
        OwnerDAO odao = null;
        List<Owner> inputOwnerList = new ArrayList<>();
        try {
            odao = new OwnerDAO();
            PreparedStatement ps = null;

            String name = request.getParameter("s-fullName");
            String national_code = request.getParameter("s-nationalCode");

            int age = validation.parsInt(request.getParameter("s-age"));
            int total_toll_paid = validation.parsInt(request.getParameter("s-Payment"));

            inputOwnerList = odao.getOwnerListByInput(name, national_code, age, total_toll_paid);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }


        return inputOwnerList;
    }



}