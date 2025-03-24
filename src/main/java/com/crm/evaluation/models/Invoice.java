package com.crm.evaluation.models;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Invoice {

    @JsonProperty("id")
    private int id;

    @JsonProperty("external_id")
    private String externalId;

    @JsonProperty("invoice_number")
    private String invoiceNumber;

    @JsonProperty("status")
    private String status;

    @JsonProperty("sent_at")
    private String sentAt;

    @JsonProperty("due_at")
    private String dueAt;

    @JsonProperty("source_type")
    private String sourceType;

    @JsonProperty("source_id")
    private int sourceId;

    @JsonProperty("client_id")
    private int clientId;

    @JsonProperty("offer_id")
    private int offerId;

    @JsonProperty("integration_invoice_id") // Add this line
    private String integrationInvoiceId; // Add this field

    // Getters and setters for all fields
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

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSentAt() {
        return sentAt;
    }

    public void setSentAt(String sentAt) {
        this.sentAt = sentAt;
    }

    public String getDueAt() {
        return dueAt;
    }

    public void setDueAt(String dueAt) {
        this.dueAt = dueAt;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getOfferId() {
        return offerId;
    }

    public void setOfferId(int offerId) {
        this.offerId = offerId;
    }

    public String getIntegrationInvoiceId() {  // Getter for integrationInvoiceId
        return integrationInvoiceId;
    }

    public void setIntegrationInvoiceId(String integrationInvoiceId) {  // Setter for integrationInvoiceId
        this.integrationInvoiceId = integrationInvoiceId;
    }
}
