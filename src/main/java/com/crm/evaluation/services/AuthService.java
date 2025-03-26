package com.crm.evaluation.services;

import com.crm.evaluation.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class AuthService {

    private final RestTemplate restTemplate = new RestTemplate();
    private final DashboardService dashboardService;

    @Autowired
    public AuthService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }

    public Map<String, Object> login(String email, String password) {
        Map<String, Object> result = new HashMap<>();
        String apiUrl = "http://127.0.0.1:8000/api/auth/login";

        Map<String, String> requestBody = new HashMap<>();
        requestBody.put("email", email);
        requestBody.put("password", password);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<LoginResponse> response = restTemplate.postForEntity(apiUrl, requestEntity, LoginResponse.class);

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                LoginResponse responseBody = response.getBody();
                result.put("success", true);
                result.put("message", "Connexion réussie !");
                result.put("user", responseBody.getUser());
                result.put("token", responseBody.getToken().getToken());

                // Ajout des statistiques de la réponse
                LoginData data = responseBody.getData();
                if (data != null) {
                    result.put("totalOffers", data.getTotalOffers());
                    result.put("totalPayments", data.getTotalPayments());
                    result.put("totalProjects", data.getTotalProjects());
                    result.put("totalInvoices", data.getTotalInvoices());
                    result.put("totalTasks", data.getTotalTasks());
                }

                // Récupérer les données du tableau de bord
                try {
                    String period = "year";
                    DashboardResponse dashboardData = (DashboardResponse) dashboardService.getAllDashboardData(period);
                    addChartDataToResult(result, dashboardData);
                    result.put("currentPeriod", period);
                } catch (Exception e) {
                    System.out.println("Erreur lors de la récupération des données du tableau de bord: " + e.getMessage());
                }

                return result;
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("error", "Identifiants incorrects !");
            return result;
        }

        result.put("success", false);
        result.put("error", "Identifiants incorrects !");
        return result;
    }

    public Map<String, Object> getDashboardData(String period) {
        Map<String, Object> result = new HashMap<>();
        
        try {
            DashboardResponse dashboardData = (DashboardResponse) dashboardService.getAllDashboardData(period);
            addChartDataToResult(result, dashboardData);
            result.put("currentPeriod", period);
            
            DashboardTotals totals = dashboardData.getTotals();
            result.put("totalOffers", totals.getTotalOffers());
            result.put("totalPayments", totals.getTotalPayments());
            result.put("totalProjects", totals.getTotalProjects());
            result.put("totalInvoices", totals.getTotalInvoices());
            result.put("totalTasks", totals.getTotalTasks());
            result.put("totalRevenue", totals.getTotalRevenue());
            
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("error", "Erreur lors de la récupération des données du tableau de bord: " + e.getMessage());
        }
        
        return result;
    }

    public DashboardResponse updatePeriod(String period) {
        return (DashboardResponse) dashboardService.updatePeriod(period);
    }

    private void addChartDataToResult(Map<String, Object> result, DashboardResponse dashboardData) {
        if (dashboardData == null) {
            return;
        }
        
        // Données de revenus
        RevenueData revenueData = dashboardData.getRevenueData();
        if (revenueData != null) {
            result.put("revenueLabels", String.join("','", revenueData.getLabels()));
            result.put("revenueData", String.join(", ", revenueData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
        }
        
        // Données de statut des projets
        ProjectStatusData projectStatusData = dashboardData.getProjectStatusData();
        if (projectStatusData != null) {
            result.put("projectStatusLabels", String.join("','", projectStatusData.getLabels()));
            result.put("projectStatusData", String.join(", ", projectStatusData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
            result.put("projectStatusColors", String.join("','", projectStatusData.getColors()));
        }
        
        // Données de taux de conversion
        ConversionRateData conversionRateData = dashboardData.getConversionRateData();
        if (conversionRateData != null) {
            result.put("conversionRateLabels", String.join("','", conversionRateData.getLabels()));
            result.put("conversionRateData", String.join(", ", conversionRateData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
        }
        
        // Données de statut des factures
        InvoiceStatusData invoiceStatusData = dashboardData.getInvoiceStatusData();
        if (invoiceStatusData != null) {
            result.put("invoiceStatusLabels", String.join("','", invoiceStatusData.getLabels()));
            result.put("invoiceStatusData", String.join(", ", invoiceStatusData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
            result.put("invoiceStatusColors", String.join("','", invoiceStatusData.getColors()));
        }
    }
} 