package com.TSINCO.model;

public class Owner {

    private long id;
    private String name;
    private String national_code;
    private int age;
    private int total_toll_paid;
    private int delete_flag;

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

    public String getNational_code() {
        return national_code;
    }

    public void setNational_code(String national_code) {
        this.national_code = national_code;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getTotal_toll_paid() {
        return total_toll_paid;
    }

    public void setTotal_toll_paid(int total_toll_paid) {
        this.total_toll_paid = total_toll_paid;
    }

    public int getDelete_flag() {
        return delete_flag;
    }

    public void setDelete_flag(int total_toll_paid) {
        this.delete_flag = delete_flag;
    }

}
