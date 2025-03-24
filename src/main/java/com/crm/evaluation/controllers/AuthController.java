package com.crm.evaluation.controllers;

import com.crm.evaluation.models.*;
import com.crm.evaluation.services.DashboardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Controller
public class AuthController {

    private final RestTemplate restTemplate = new RestTemplate();
    
    // Injecter le service de tableau de bord
    private final DashboardService dashboardService;

    @Autowired
    public AuthController(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

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

                model.addAttribute("message", "Connexion réussie !");
                model.addAttribute("user", responseBody.getUser());
                model.addAttribute("token", responseBody.getToken().getToken());

                // Ajout des statistiques de la réponse
                LoginData data = responseBody.getData();
                if (data != null) {
                    model.addAttribute("totalOffers", data.getTotalOffers());
                    model.addAttribute("totalPayments", data.getTotalPayments());
                    model.addAttribute("totalProjects", data.getTotalProjects());
                    model.addAttribute("totalInvoices", data.getTotalInvoices());
                    model.addAttribute("totalTasks", data.getTotalTasks());
                }

                // Récupérer les données du tableau de bord pour les graphiques
                try {
                    // Période par défaut: année
                    String period = "year";
                    
                    // Récupérer toutes les données du tableau de bord
                    DashboardResponse dashboardData = (DashboardResponse) dashboardService.getAllDashboardData(period);
                    
                    // Ajouter les données des graphiques au modèle
                    addChartDataToModel(model, dashboardData);
                    
                    // Ajouter la période actuelle
                    model.addAttribute("currentPeriod", period);
                    
                } catch (Exception e) {
                    System.out.println("Erreur lors de la récupération des données du tableau de bord: " + e.getMessage());
                    // Ne pas bloquer la connexion si les données du tableau de bord ne sont pas disponibles
                }

                System.out.println("Token : " + responseBody.getToken().getToken());

                return "dashboard";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Identifiants incorrects !");
            return "login";
        }

        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, @RequestParam(defaultValue = "year") String period) {
        model.addAttribute("message", "Bienvenue sur le tableau de bord !");
        
        try {
            // Récupérer les données du tableau de bord pour la période spécifiée
            DashboardResponse dashboardData = (DashboardResponse) dashboardService.getAllDashboardData(period);
            
            // Ajouter les données des graphiques au modèle
            addChartDataToModel(model, dashboardData);
            
            // Ajouter la période actuelle
            model.addAttribute("currentPeriod", period);
            
            // Ajouter les totaux
            DashboardTotals totals = dashboardData.getTotals();
            model.addAttribute("totalOffers", totals.getTotalOffers());
            model.addAttribute("totalPayments", totals.getTotalPayments());
            model.addAttribute("totalProjects", totals.getTotalProjects());
            model.addAttribute("totalInvoices", totals.getTotalInvoices());
            model.addAttribute("totalTasks", totals.getTotalTasks());
            model.addAttribute("totalRevenue", totals.getTotalRevenue());
            
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la récupération des données du tableau de bord: " + e.getMessage());
        }
        
        return "dashboard";
    }
    
    @GetMapping("/api/dashboard/update-period")
    @ResponseBody
    public DashboardResponse updatePeriod(@RequestParam String period) {
        return (DashboardResponse) dashboardService.updatePeriod(period);
    }
    
    /**
     * Méthode utilitaire pour ajouter les données des graphiques au modèle
     */
    private void addChartDataToModel(Model model, DashboardResponse dashboardData) {
        if (dashboardData == null) {
            return;
        }
        
        // Données de revenus
        RevenueData revenueData = dashboardData.getRevenueData();
        if (revenueData != null) {
            model.addAttribute("revenueLabels", String.join("','", revenueData.getLabels()));
            model.addAttribute("revenueData", String.join(", ", revenueData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
        }
        
        // Données de statut des projets
        ProjectStatusData projectStatusData = dashboardData.getProjectStatusData();
        if (projectStatusData != null) {
            model.addAttribute("projectStatusLabels", String.join("','", projectStatusData.getLabels()));
            model.addAttribute("projectStatusData", String.join(", ", projectStatusData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
            model.addAttribute("projectStatusColors", String.join("','", projectStatusData.getColors()));
        }
        
        // Données de taux de conversion
        ConversionRateData conversionRateData = dashboardData.getConversionRateData();
        if (conversionRateData != null) {
            model.addAttribute("conversionRateLabels", String.join("','", conversionRateData.getLabels()));
            model.addAttribute("conversionRateData", String.join(", ", conversionRateData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
        }
        
        // Données de statut des factures
        InvoiceStatusData invoiceStatusData = dashboardData.getInvoiceStatusData();
        if (invoiceStatusData != null) {
            model.addAttribute("invoiceStatusLabels", String.join("','", invoiceStatusData.getLabels()));
            model.addAttribute("invoiceStatusData", String.join(", ", invoiceStatusData.getData().stream()
                    .map(String::valueOf)
                    .toArray(String[]::new)));
            model.addAttribute("invoiceStatusColors", String.join("','", invoiceStatusData.getColors()));
        }
    }
}
