package com.crm.evaluation.services;

import com.crm.evaluation.models.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Service
public class DashboardService {

    private final RestTemplate restTemplate = new RestTemplate();
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final String baseUrl = "http://127.0.0.1:8000/api/dashboard";

    /**
     * Récupère toutes les données du tableau de bord
     * @param period La période (month, quarter, year)
     * @return Les données complètes du tableau de bord
     */
    public DashboardData getAllDashboardData(String period) {
        try {
            String url = baseUrl + "?period=" + period;
            String jsonResponse = restTemplate.getForObject(url, String.class);

            DashboardResponse response = objectMapper.readValue(jsonResponse, DashboardResponse.class);
            
            if (response != null) {
                return response;
            } else {
                throw new RuntimeException("Failed to fetch dashboard data");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching dashboard data: " + e.getMessage(), e);
        }
    }

    /**
     * Récupère les données de revenus
     * @param period La période (month, quarter, year)
     * @return Les données de revenus
     */
    public RevenueData getRevenueData(String period) {
        try {
            String url = baseUrl + "/revenue?period=" + period;
            String jsonResponse = restTemplate.getForObject(url, String.class);

            RevenueData response = objectMapper.readValue(jsonResponse, RevenueData.class);
            
            if (response != null) {
                return response;
            } else {
                throw new RuntimeException("Failed to fetch revenue data");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching revenue data: " + e.getMessage(), e);
        }
    }

    /**
     * Récupère les données de statut des projets
     * @return Les données de statut des projets
     */
    public ProjectStatusData getProjectStatusData() {
        try {
            String url = baseUrl + "/projects";
            String jsonResponse = restTemplate.getForObject(url, String.class);

            ProjectStatusData response = objectMapper.readValue(jsonResponse, ProjectStatusData.class);
            
            if (response != null) {
                return response;
            } else {
                throw new RuntimeException("Failed to fetch project status data");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching project status data: " + e.getMessage(), e);
        }
    }

    /**
     * Récupère les données de taux de conversion
     * @param period La période (month, quarter, year)
     * @return Les données de taux de conversion
     */
    public ConversionRateData getConversionRateData(String period) {
        try {
            String url = baseUrl + "/conversion?period=" + period;
            String jsonResponse = restTemplate.getForObject(url, String.class);

            ConversionRateData response = objectMapper.readValue(jsonResponse, ConversionRateData.class);
            
            if (response != null) {
                return response;
            } else {
                throw new RuntimeException("Failed to fetch conversion rate data");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching conversion rate data: " + e.getMessage(), e);
        }
    }

    /**
     * Récupère les données de statut des factures
     * @return Les données de statut des factures
     */
    public InvoiceStatusData getInvoiceStatusData() {
        try {
            String url = baseUrl + "/invoices";
            String jsonResponse = restTemplate.getForObject(url, String.class);

            InvoiceStatusData response = objectMapper.readValue(jsonResponse, InvoiceStatusData.class);
            
            if (response != null) {
                return response;
            } else {
                throw new RuntimeException("Failed to fetch invoice status data");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching invoice status data: " + e.getMessage(), e);
        }
    }

    /**
     * Récupère les totaux pour les cartes du tableau de bord
     * @return Les totaux
     */
    public DashboardTotals getTotals() {
        try {
            String url = baseUrl + "/totals";
            String jsonResponse = restTemplate.getForObject(url, String.class);

            DashboardTotals response = objectMapper.readValue(jsonResponse, DashboardTotals.class);
            
            if (response != null) {
                return response;
            } else {
                throw new RuntimeException("Failed to fetch dashboard totals");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching dashboard totals: " + e.getMessage(), e);
        }
    }

    /**
     * Méthode utilitaire pour changer la période des données
     * @param period La nouvelle période (month, quarter, year)
     * @return Les données complètes du tableau de bord pour la nouvelle période
     */
    public DashboardData updatePeriod(String period) {
        if (!Arrays.asList("month", "quarter", "year").contains(period)) {
            throw new IllegalArgumentException("Invalid period. Must be one of: month, quarter, year");
        }
        
        return getAllDashboardData(period);
    }
}
