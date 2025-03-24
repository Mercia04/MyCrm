package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;

public class LoginData {

    @JsonProperty("total")
    private int totalOffers;

    @JsonProperty("total_payments")
    private int totalPayments;

    @JsonProperty("total_projects")
    private int totalProjects;

    @JsonProperty("total_invoices")
    private int totalInvoices;

    @JsonProperty("total_tasks")
    private int totalTasks;

    // Getters et setters
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

    public int getTotalTasks() {
        return totalTasks;
    }

    public void setTotalTasks(int totalTasks) {
        this.totalTasks = totalTasks;
    }
}
