package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class PaymentListResponse {

    @JsonProperty("success")
    private boolean success;

    @JsonProperty("data")
    private List<Payment> data;

    @JsonProperty("message")
    private String message;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public List<Payment> getData() {
        return data;
    }

    public void setData(List<Payment> data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
