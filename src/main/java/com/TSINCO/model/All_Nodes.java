package com.TSINCO.model;

public class All_Nodes {

    private long id;
    private int owner_car_id;
    private String location;
    private String date;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getOwner_car_id() {
        return owner_car_id;
    }

    public void setOwner_car_id(int owner_car_id) {
        this.owner_car_id = owner_car_id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
