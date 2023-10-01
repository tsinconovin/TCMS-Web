package com.TSINCO.model;

public class Toll_Station {

    private long id;
    private String name;
    private int toll_per_cross;
    private String location;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getToll_per_cross() {
        return toll_per_cross;
    }

    public void setToll_per_cross(int toll_per_cross) {
        this.toll_per_cross = toll_per_cross;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}
