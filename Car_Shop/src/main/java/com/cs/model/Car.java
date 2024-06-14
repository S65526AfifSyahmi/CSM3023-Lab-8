/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cs.model;

/**
 *
 * @author Ahmad Afif Syahmi bin Ahmad Rozali
 */
public class Car {
    
    private int id, cylinder;
    private String brand, model;
    private double price;

    public Car() {
    }
    
    public Car(int id, String brand, String model, int cylinder, double price) {
        this.id = id;
        this.cylinder = cylinder;
        this.brand = brand;
        this.model = model;
        this.price = price;
    }

    public Car(String brand, String model, int cylinder, double price) {
        this.cylinder = cylinder;
        this.brand = brand;
        this.model = model;
        this.price = price;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCylinder() {
        return cylinder;
    }

    public void setCylinder(int cylinder) {
        this.cylinder = cylinder;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}