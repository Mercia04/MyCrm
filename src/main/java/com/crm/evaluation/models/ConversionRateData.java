package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
public class ConversionRateData implements DashboardData {
    private List<String> labels;
    private List<Double> data;
    private String period;

    // Getters et setters
    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public List<Double> getData() {
        return data;
    }

    public void setData(List<Double> data) {
        this.data = data;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
}