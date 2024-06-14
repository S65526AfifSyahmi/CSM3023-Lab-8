/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import com.cs.model.Car;
import com.cs.dao.CarDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Ahmad Afif Syahmi bin Ahmad Rozali
 */

@WebServlet("/")

public class CarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private CarDAO carDAO;
    
    public void init() {
        carDAO = new CarDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action  = request.getServletPath();
        
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                    
                case "/insert":
                    insertCar(request, response);
                    break;
                    
                case "/delete":
                    deleteCar(request, response);
                    break;
                    
                case "/edit":
                    showEditForm(request, response);
                    break;
                    
                case "/update":
                    updateCar(request, response);
                    break;
                    
                default:
                    listCar(request, response);
            }
        }
        catch (SQLException e) {
            throw new ServletException(e);
        }
        
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("carForm.jsp");
        requestDispatcher.forward(request, response);
        
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Car car = carDAO.selectCarByID(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("carForm.jsp");
        request.setAttribute("car", car);
        requestDispatcher.forward(request, response);
        
    }
    
    private void insertCar(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        Car car = new Car(brand, model, cylinder, price);
        carDAO.insertCar(car);
        response.sendRedirect("list");
        
    }
    
    private void listCar(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        
        List<Car> cars = carDAO.selectAllCars();
        request.setAttribute("cars", cars);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("carList.jsp");
        requestDispatcher.forward(request, response);
        
    }
    
    private void updateCar(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        Car car = new Car(id, brand, model, cylinder, price);
        carDAO.updateCar(car);
        response.sendRedirect("list");
        
    }
    
    private void deleteCar(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        carDAO.deleteCar(id);
        response.sendRedirect("list");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
