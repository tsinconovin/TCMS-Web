package com.TSINCO.DAO;

import com.TSINCO.model.Toll_Station;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TollStationDAO {

    public int insertTollStation(Toll_Station ts) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "INSERT INTO toll_station(name, toll_per_cross, location) VALUES (?,?,?)";
        int res = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);

                ps.setString(1, ts.getName());
                ps.setInt(2, ts.getToll_per_cross());
                ps.setString(3, ts.getLocation());
                res = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return res;
    }
}
