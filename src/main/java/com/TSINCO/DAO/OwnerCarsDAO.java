package com.TSINCO.DAO;

import com.TSINCO.model.Owner;
import com.TSINCO.model.Owner_Car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OwnerCarsDAO {

    public List<Owner_Car> getOwnerCarList() {
        List<Owner_Car> ownerCarList = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
//            String query = "SELECT * FROM owner LIMIT ? OFFSET ?";
            String query = "SELECT * FROM owner_car ORDER BY id DESC";

            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
//            ps.setInt(1, limit);
//            ps.setInt(2, offset);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner_Car oc = new Owner_Car();

                oc.setId(rs.getLong("id"));
                oc.setOwner_id(rs.getLong("owner_id"));
                oc.setType(rs.getString("type"));
                oc.setColor(rs.getString("color"));
                oc.setLength(rs.getInt("length"));
                oc.setLoad_valume(rs.getInt("load_valume"));

                ownerCarList.add(oc);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarList;
    }


//    public List<Owner_Car> getOwnerCarsInRedBlue(String whereClause, String colorList []) {
//        List<Owner_Car> ownerCarList = new ArrayList<>();
//        Connection con = ConnectionDAO.connectionDB();
//
//        try {
//            String query = "SELECT * FROM owner_car " + whereClause + " ORDER BY id DESC";
//
//            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
//
//            int counter = 1;
//            for(String color: colorList ){
//                ps.setString(counter++, color);
//            }
//
////            for (int i = 0; i < colorList.length; i++) {
////                String color = colorList[i];
////            }
//
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                Owner_Car oc = new Owner_Car();
//
//                oc.setId(rs.getLong("id"));
//                oc.setOwner_id(rs.getLong("owner_id"));
//                oc.setType(rs.getString("type"));
//                oc.setColor(rs.getString("color"));
//                oc.setLength(rs.getInt("length"));
//                oc.setLoad_valume(rs.getInt("load_valume"));
//
//                ownerCarList.add(oc);
//            }
//
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//        }
//        return ownerCarList;
//    }

    public List<Owner_Car> getOwnerCarById(String whereClause, long id) {
        List<Owner_Car> ownerCarListById = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
            String query = "SELECT * FROM owner_car " + whereClause + " ORDER BY id DESC";

            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);

            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Owner_Car occ = new Owner_Car();

                occ.setId(rs.getLong("id"));
                occ.setOwner_id(rs.getLong("owner_id"));
                occ.setType(rs.getString("type"));
                occ.setColor(rs.getString("color"));
                occ.setLength(rs.getInt("length"));
                occ.setLoad_valume(rs.getInt("load_valume"));

                ownerCarListById.add(occ);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarListById;
    }


    public List<Owner_Car> getOwnerCarsInRedBlue(String whereClause) {
        List<Owner_Car> ownerCarList = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
            String query = "SELECT * FROM owner_car " + whereClause + " ORDER BY id DESC";

            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner_Car oc = new Owner_Car();

                oc.setId(rs.getLong("id"));
                oc.setOwner_id(rs.getLong("owner_id"));
                oc.setType(rs.getString("type"));
                oc.setColor(rs.getString("color"));
                oc.setLength(rs.getInt("length"));
                oc.setLoad_valume(rs.getInt("load_valume"));

                ownerCarList.add(oc);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarList;
    }


    public List<Owner_Car> getOwnerCarListByColor(String whereClause, String colorList[]) {
        List<Owner_Car> ownerCarList = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
            String query = "SELECT * FROM owner_car " + whereClause + " ORDER BY id DESC";

            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);

            int counter = 1;
            for (String color : colorList) {
                ps.setString(counter++, color);
            }

//            for (int i = 0; i < colorList.length; i++) {
//                String color = colorList[i];
//            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner_Car oc = new Owner_Car();

                oc.setId(rs.getLong("id"));
                oc.setOwner_id(rs.getLong("owner_id"));
                oc.setType(rs.getString("type"));
                oc.setColor(rs.getString("color"));
                oc.setLength(rs.getInt("length"));
                oc.setLoad_valume(rs.getInt("load_valume"));

                ownerCarList.add(oc);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarList;
    }


    public int addCars(Owner_Car oc) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "insert into owner_car (owner_id, type, color, length, load_valume) values (?,?,?,?,?)";
        int res = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);

                ps.setLong(1, oc.getOwner_id());
                ps.setString(2, oc.getType());
                ps.setString(3, oc.getColor());
                ps.setInt(4, oc.getLength());
                ps.setInt(5, oc.getLoad_valume());

                res = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
        return res;
    }



    public List<Owner_Car> ownerCarO70List() {
        List<Owner_Car> ownerCarO70List = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
            String query = "" +
                    "SELECT * FROM owner_car oc " +
                    "INNER JOIN owner o " +
                    "ON o.id=oc.owner_id " +
                    "WHERE o.age >= 70 " +
                    "ORDER BY oc.id DESC";


            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner_Car oc = new Owner_Car();

                oc.setId(rs.getLong("id"));
                oc.setOwner_id(rs.getLong("owner_id"));
                oc.setType(rs.getString("type"));
                oc.setColor(rs.getString("color"));
                oc.setLength(rs.getInt("length"));
                oc.setLoad_valume(rs.getInt("load_valume"));
                oc.setDelete_flag(rs.getInt("delete_flag"));
                ownerCarO70List.add(oc);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarO70List;
    }



    public List<Owner_Car> getOwnerCarByAgeRangeGet(String whereClause, int fromAge, int toAge) {
        List<Owner_Car> ownerCarListByAgeRange = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
            String query = "SELECT * FROM owner_car oc " +
                    "inner join owner o on o.id=oc.owner_id "
                    + whereClause
                    + " ORDER BY oc.id DESC";
            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
            ps.setInt(1, fromAge);
            ps.setInt(2, toAge);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner_Car oc = new Owner_Car();

                oc.setId(rs.getLong("id"));
                oc.setOwner_id(rs.getLong("owner_id"));
                oc.setType(rs.getString("type"));
                oc.setColor(rs.getString("color"));
                oc.setLength(rs.getInt("length"));
                oc.setLoad_valume(rs.getInt("load_valume"));

                ownerCarListByAgeRange.add(oc);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarListByAgeRange;
    }


    public List<Owner_Car> getOwnerCarByAgeRangePost(String whereClause, int fromAge, int toAge) {
        List<Owner_Car> ownerCarListByAgeRange = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();

        try {
            String query = "SELECT * FROM owner_car oc " +
                    "inner join owner o on o.id=oc.owner_id "
                    + whereClause
                    + " ORDER BY oc.id DESC";
            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
            ps.setInt(1, fromAge);
            ps.setInt(2, toAge);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner_Car oc = new Owner_Car();

                oc.setId(rs.getLong("id"));
                oc.setOwner_id(rs.getLong("owner_id"));
                oc.setType(rs.getString("type"));
                oc.setColor(rs.getString("color"));
                oc.setLength(rs.getInt("length"));
                oc.setLoad_valume(rs.getInt("load_valume"));

                ownerCarListByAgeRange.add(oc);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerCarListByAgeRange;
    }


}
