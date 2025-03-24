package com.crm.evaluation.models;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Department {

    @JsonProperty("id")
    private int id;

    @JsonProperty("external_id")
    private String externalId;

    @JsonProperty("name")
    private String name;

    // Getters et setters
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
