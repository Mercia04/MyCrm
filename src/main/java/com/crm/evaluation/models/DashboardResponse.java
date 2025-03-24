package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

public class DashboardResponse implements DashboardData {
    @JsonProperty("revenue_data")
    private RevenueData revenueData;
    
    @JsonProperty("project_status_data")
    private ProjectStatusData projectStatusData;
    
    @JsonProperty("conversion_rate_data")
    private ConversionRateData conversionRateData;
    
    @JsonProperty("invoice_status_data")
    private InvoiceStatusData invoiceStatusData;
    
    @JsonProperty("totals")
    private DashboardTotals totals;

    // Getters et setters
    public RevenueData getRevenueData() {
        return revenueData;
    }

    public void setRevenueData(RevenueData revenueData) {
        this.revenueData = revenueData;
    }

    public ProjectStatusData getProjectStatusData() {
        return projectStatusData;
    }

    public void setProjectStatusData(ProjectStatusData projectStatusData) {
        this.projectStatusData = projectStatusData;
    }

    public ConversionRateData getConversionRateData() {
        return conversionRateData;
    }

    public void setConversionRateData(ConversionRateData conversionRateData) {
        this.conversionRateData = conversionRateData;
    }

    public InvoiceStatusData getInvoiceStatusData() {
        return invoiceStatusData;
    }

    public void setInvoiceStatusData(InvoiceStatusData invoiceStatusData) {
        this.invoiceStatusData = invoiceStatusData;
    }

    public DashboardTotals getTotals() {
        return totals;
    }

    public void setTotals(DashboardTotals totals) {
        this.totals = totals;
    }
}