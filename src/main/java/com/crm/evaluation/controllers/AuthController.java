package com.crm.evaluation.controllers;

import com.crm.evaluation.models.DashboardResponse;
import com.crm.evaluation.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class AuthController {

    private final AuthService authService;

    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
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

        Map<String, Object> result = authService.login(email, password);
        
        if ((Boolean) result.get("success")) {
            // Ajouter tous les attributs du résultat au modèle
            result.forEach(model::addAttribute);
            return "dashboard";
        } else {
            model.addAttribute("error", result.get("error"));
            return "login";
        }
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, @RequestParam(defaultValue = "year") String period) {
        Map<String, Object> result = authService.getDashboardData(period);
        
        if ((Boolean) result.get("success")) {
            result.forEach(model::addAttribute);
        } else {
            model.addAttribute("error", result.get("error"));
        }
        
        return "dashboard";
    }
    
    @GetMapping("/api/dashboard/update-period")
    @ResponseBody
    public DashboardResponse updatePeriod(@RequestParam String period) {
        return authService.updatePeriod(period);
    }
}
