package com.TSINCO.DAO;

import com.TSINCO.model.Roads;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RoadsDAO {

    public int insertRoad(Roads r) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "INSERT INTO roads (name, wigth, geom) VALUES (?,?,?)";
        int res = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);

                ps.setString(1, r.getName());
                ps.setString(2, r.getWidth());
                ps.setString(3, r.getGeom());

                res = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return res;
    }

}
