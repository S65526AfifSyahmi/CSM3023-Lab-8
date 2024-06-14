/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.cs.model.Car;

/**
 *
 * @author Ahmad Afif Syahmi bin Ahmad Rozali
 */
public class CarDAO {
    
    Connection connection = null;
    private String url = "jdbc:mysql://localhost:3306/csm3023lab8";
    private String username = "root";
    private String password = "admin";
    
    private static final String INSERT_CAR = "INSERT INTO car (brand, model, cylinder, price) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_CARS = "SELECT * FROM car";
    private static final String SELECT_CAR_BY_ID = "SELECT * FROM car WHERE id = ?";
    private static final String UPDATE_CAR = "UPDATE car SET brand = ?, model = ?, cylinder = ?, price = ? WHERE id = ?";
    private static final String DELETE_CAR = "DELETE FROM car WHERE id = ?";
    
    public Connection getConnection() {
        
        Connection connection = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return connection;
        
    }
    
    public void insertCar(Car car) {
        
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAR);
            
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getCylinder());
            preparedStatement.setDouble(4, car.getPrice());
            
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public List<Car> selectAllCars() {
        
        List<Car> cars = new ArrayList<>();
        
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARS);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while ( resultSet.next() ) {
                Car car = new Car();
                
                car.setId(Integer.parseInt(resultSet.getString("id")));
                car.setBrand(resultSet.getString("brand"));
                car.setModel(resultSet.getString("model"));
                car.setCylinder(resultSet.getInt("cylinder"));
                car.setPrice(resultSet.getDouble("price"));
                
                cars.add(car);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
        return cars;
        
    }
    
    public Car selectCarByID(int id) {
        
        Car car = null;
        
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAR_BY_ID);
            
            preparedStatement.setInt(1, id);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while ( resultSet.next() ) {
                String brand = resultSet.getString("brand");
                String model = resultSet.getString("model");
                int cylinder = resultSet.getInt("cylinder");
                double price = resultSet.getDouble("price");
                
                car = new Car(id, brand, model, cylinder, price);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
        return car;
        
    }
    
    public boolean updateCar(Car car) {
        
        boolean rowUpdated = false;
        
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CAR);
            
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getCylinder());
            preparedStatement.setDouble(4, car.getPrice());
            preparedStatement.setInt(5, car.getId());
            
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
        
    }
    
    public boolean deleteCar(int id) {
        
        boolean rowDeleted = false;
        
        try {
            Connection connection = getConnection();
            
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CAR);
            preparedStatement.setInt(1, id);
            
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
        return rowDeleted;
        
    }
    
}
