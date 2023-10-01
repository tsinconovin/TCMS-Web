package com.TSINCO.model;

public class Owner_Car {

    private long id;
    private long owner_id;
    private String type;
    private String color;
    private int length;
    private int load_valume;
    private int delete_flag;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(long owner_id) {
        this.owner_id = owner_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getLoad_valume() {
        return load_valume;
    }

    public void setLoad_valume(int load_valume) {
        this.load_valume = load_valume;
    }

    public int getDelete_flag() {
        return delete_flag;
    }

    public void setDelete_flag(int delete_flag) {
        this.delete_flag = delete_flag;
    }
}
