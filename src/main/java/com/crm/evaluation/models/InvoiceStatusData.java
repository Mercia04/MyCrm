package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
public class InvoiceStatusData implements DashboardData {
    private List<String> labels;
    private List<Integer> data;
    private List<String> colors;

    // Getters et setters
    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public List<Integer> getData() {
        return data;
    }

    public void setData(List<Integer> data) {
        this.data = data;
    }

    public List<String> getColors() {
        return colors;
    }

    public void setColors(List<String> colors) {
        this.colors = colors;
    }
}