package com.crm.evaluation.Dto;

public class DiscountSettingDTO {
    private Double globalDiscountRate;
    private String message;
    
    public Double getGlobalDiscountRate() {
        return globalDiscountRate;
    }

    public void setGlobalDiscountRate(Double globalDiscountRate) {
        this.globalDiscountRate = globalDiscountRate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
