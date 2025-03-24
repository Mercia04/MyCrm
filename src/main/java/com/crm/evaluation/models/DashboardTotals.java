package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DashboardTotals {
    @JsonProperty("totalProjects")
    private int totalProjects;
    
    @JsonProperty("totalInvoices")
    private int totalInvoices;
    
    @JsonProperty("totalOffers")
    private int totalOffers;
    
    @JsonProperty("totalPayments")
    private int totalPayments;
    
    @JsonProperty("totalTasks")
    private int totalTasks;
    
    @JsonProperty("totalRevenue")
    private double totalRevenue;

    // Getters et setters
    public int getTotalProjects() {
        return totalProjects;
    }

    public void setTotalProjects(int totalProjects) {
        this.totalProjects = totalProjects;
    }

    public int getTotalInvoices() {
        return totalInvoices;
    }

    public void setTotalInvoices(int totalInvoices) {
        this.totalInvoices = totalInvoices;
    }

    public int getTotalOffers() {
        return totalOffers;
    }

    public void setTotalOffers(int totalOffers) {
        this.totalOffers = totalOffers;
    }

    public int getTotalPayments() {
        return totalPayments;
    }

    public void setTotalPayments(int totalPayments) {
        this.totalPayments = totalPayments;
    }

    public int getTotalTasks() {
        return totalTasks;
    }

    public void setTotalTasks(int totalTasks) {
        this.totalTasks = totalTasks;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
