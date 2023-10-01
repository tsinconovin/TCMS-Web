package com.TSINCO.DAO;

import com.TSINCO.model.All_Nodes;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AllNodeDAO {

    public int insertNode(All_Nodes an) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "INSERT INTO all_nodes (owner_car_id, location, date) VALUES (?,?,?)";
        int res = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setInt(1, an.getOwner_car_id());
                ps.setString(2, an.getLocation());
                ps.setString(3, an.getDate());

                res = ps.executeUpdate();

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return res;
    }

}
