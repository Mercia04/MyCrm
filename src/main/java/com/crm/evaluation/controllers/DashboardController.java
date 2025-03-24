//package com.crm.evaluation.controllers;
//
//import com.crm.evaluation.models.DashboardResponse;
//import com.crm.evaluation.models.ConversionRateData;
//import com.crm.evaluation.models.InvoiceStatusData;
//import com.crm.evaluation.models.ProjectStatusData;
//import com.crm.evaluation.models.RevenueData;
//import com.crm.evaluation.services.DashboardService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
///**
// * Contrôleur pour gérer l'affichage et les interactions avec le tableau de bord
// */
//@Controller
//@RequestMapping("/dashboard")
//public class DashboardController {
//
//    private final DashboardService dashboardService;
//
//    @Autowired
//    public DashboardController(DashboardService dashboardService) {
//        this.dashboardService = dashboardService;
//    }
//
//    /**
//     * Affiche la page principale du tableau de bord
//     * @param model Le modèle Spring pour passer des données à la vue
//     * @param period La période sélectionnée (month, quarter, year)
//     * @return Le nom de la vue à afficher
//     */
//    @GetMapping
//    public String showDashboard(Model model, @RequestParam(defaultValue = "year") String period) {
//        try {
//            DashboardResponse dashboardData = (DashboardResponse) dashboardService.getAllDashboardData(period);
//
//            model.addAttribute("dashboardData", dashboardData);
//            model.addAttribute("period", period);
//            model.addAttribute("pageTitle", "Tableau de bord - DaybydayCRM");
//
//            return "dashboard/index";
//        } catch (Exception e) {
//            model.addAttribute("error", "Erreur lors du chargement des données : " + e.getMessage());
//            return "error";
//        }
//    }
//
//    /**
//     * Point d'API pour mettre à jour la période des données sans recharger la page
//     * @param period La nouvelle période (month, quarter, year)
//     * @return Les données du tableau de bord pour la nouvelle période
//     */
//    @GetMapping("/update-period")
//    @ResponseBody
//    public ResponseEntity<?> updatePeriod(@RequestParam String period) {
//        try {
//            DashboardResponse dashboardData = (DashboardResponse) dashboardService.updatePeriod(period);
//            return ResponseEntity.ok(dashboardData);
//        } catch (Exception e) {
//            return ResponseEntity.badRequest().body("Erreur lors de la mise à jour de la période : " + e.getMessage());
//        }
//    }
//
//    /**
//     * Affiche uniquement le graphique des revenus
//     * @param model Le modèle Spring pour passer des données à la vue
//     * @param period La période sélectionnée (month, quarter, year)
//     * @return Le nom de la vue à afficher
//     */
//    @GetMapping("/revenue")
//    public String showRevenueChart(Model model, @RequestParam(defaultValue = "year") String period) {
//        try {
//            RevenueData revenueData = dashboardService.getRevenueData(period);
//
//            model.addAttribute("revenueData", revenueData);
//            model.addAttribute("period", period);
//            model.addAttribute("pageTitle", "Graphique des revenus - DaybydayCRM");
//
//            return "dashboard/revenue";
//        } catch (Exception e) {
//            model.addAttribute("error", "Erreur lors du chargement des données de revenus : " + e.getMessage());
//            return "error";
//        }
//    }
//
//    /**
//     * Affiche uniquement le graphique des statuts de projet
//     * @param model Le modèle Spring pour passer des données à la vue
//     * @return Le nom de la vue à afficher
//     */
//    @GetMapping("/projects")
//    public String showProjectStatusChart(Model model) {
//        try {
//            ProjectStatusData projectStatusData = dashboardService.getProjectStatusData();
//
//            model.addAttribute("projectStatusData", projectStatusData);
//            model.addAttribute("pageTitle", "Statuts des projets - DaybydayCRM");
//
//            return "dashboard/projects";
//        } catch (Exception e) {
//            model.addAttribute("error", "Erreur lors du chargement des données de statut des projets : " + e.getMessage());
//            return "error";
//        }
//    }
//
//    /**
//     * Affiche uniquement le graphique des taux de conversion
//     * @param model Le modèle Spring pour passer des données à la vue
//     * @param period La période sélectionnée (month, quarter, year)
//     * @return Le nom de la vue à afficher
//     */
//    @GetMapping("/conversion")
//    public String showConversionRateChart(Model model, @RequestParam(defaultValue = "year") String period) {
//        try {
//            ConversionRateData conversionRateData = dashboardService.getConversionRateData(period);
//
//            model.addAttribute("conversionRateData", conversionRateData);
//            model.addAttribute("period", period);
//            model.addAttribute("pageTitle", "Taux de conversion - DaybydayCRM");
//
//            return "dashboard/conversion";
//        } catch (Exception e) {
//            model.addAttribute("error", "Erreur lors du chargement des données de taux de conversion : " + e.getMessage());
//            return "error";
//        }
//    }
//
//    /**
//     * Affiche uniquement le graphique des statuts de facture
//     * @param model Le modèle Spring pour passer des données à la vue
//     * @return Le nom de la vue à afficher
//     */
//    @GetMapping("/invoices")
//    public String showInvoiceStatusChart(Model model) {
//        try {
//            InvoiceStatusData invoiceStatusData = dashboardService.getInvoiceStatusData();
//
//            model.addAttribute("invoiceStatusData", invoiceStatusData);
//            model.addAttribute("pageTitle", "Statuts des factures - DaybydayCRM");
//
//            return "dashboard/invoices";
//        } catch (Exception e) {
//            model.addAttribute("error", "Erreur lors du chargement des données de statut des factures : " + e.getMessage());
//            return "error";
//        }
//    }
//
//    /**
//     * Point d'API pour récupérer les données du tableau de bord au format JSON
//     * @param period La période sélectionnée (month, quarter, year)
//     * @return Les données du tableau de bord au format JSON
//     */
//    @GetMapping("/api/data")
//    @ResponseBody
//    public ResponseEntity<?> getDashboardData(@RequestParam(defaultValue = "year") String period) {
//        try {
//            DashboardResponse dashboardData = (DashboardResponse) dashboardService.getAllDashboardData(period);
//            return ResponseEntity.ok(dashboardData);
//        } catch (Exception e) {
//            return ResponseEntity.badRequest().body("Erreur lors du chargement des données : " + e.getMessage());
//        }
//    }
//
//    /**
//     * Gestion des erreurs pour ce contrôleur
//     * @param ex L'exception qui a été levée
//     * @param model Le modèle Spring pour passer des données à la vue
//     * @return La vue d'erreur
//     */
//    @ExceptionHandler(Exception.class)
//    public String handleError(Exception ex, Model model) {
//        model.addAttribute("error", "Une erreur s'est produite : " + ex.getMessage());
//        return "error";
//    }
//}
