package com.crm.evaluation.models;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Payment {

    @JsonProperty("id")
    private int id;

    @JsonProperty("external_id")
    private String externalId;

    @JsonProperty("amount")
    private double amount;

    @JsonProperty("description")
    private String description;

    @JsonProperty("payment_source")
    private String paymentSource;

    @JsonProperty("payment_date")
    private String paymentDate;

    @JsonProperty("invoice_id")
    private int invoiceId;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("updated_at")
    private String updatedAt;

    @JsonProperty("invoice")
    private Invoice invoice;

    @JsonProperty("integration_payment_id")
    private String integrationPaymentId;

    @JsonProperty("integration_type")  // Add this line to handle the new field
    private String integrationType;

    @JsonProperty("deleted_at")  // Add the new field 'deleted_at'
    private String deletedAt;  // The type could be String or any other type depending on your needs

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getExternalId() {
        return externalId;
    }

    public void setExternalId(String externalId) {
        this.externalId = externalId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPaymentSource() {
        return paymentSource;
    }

    public void setPaymentSource(String paymentSource) {
        this.paymentSource = paymentSource;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public String getIntegrationPaymentId() {
        return integrationPaymentId;
    }

    public void setIntegrationPaymentId(String integrationPaymentId) {
        this.integrationPaymentId = integrationPaymentId;
    }

    public String getIntegrationType() {  // Getter for integrationType
        return integrationType;
    }

    public void setIntegrationType(String integrationType) {  // Setter for integrationType
        this.integrationType = integrationType;
    }

    public String getDeletedAt() {  // Getter for deletedAt
        return deletedAt;
    }

    public void setDeletedAt(String deletedAt) {  // Setter for deletedAt
        this.deletedAt = deletedAt;
    }
}
