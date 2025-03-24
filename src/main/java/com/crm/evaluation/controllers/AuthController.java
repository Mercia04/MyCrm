package com.crm.evaluation.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import com.crm.evaluation.models.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class AuthController {

    private final RestTemplate restTemplate = new RestTemplate();

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
    public String dashboard(Model model) {
        model.addAttribute("message", "Bienvenue sur le tableau de bord !");
        return "dashboard";
    }
}
