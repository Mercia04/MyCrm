package com.crm.evaluation.controllers;

import com.crm.evaluation.Dto.DiscountSettingDTO;
import com.crm.evaluation.services.DiscountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/discount")
public class DiscountController {

    private final DiscountService discountService;

    public DiscountController(DiscountService discountService) {
        this.discountService = discountService;
    }

    /**
     * Affiche la page de configuration des remises
     */
    @GetMapping("/settings")
    public String showDiscountSettings(Model model) {
        try {
            // Récupérer le token d'authentification depuis la session
            // String token = (String) session.getAttribute("token");
            String token = "eyJ0eXAiOi";
            
            if (token == null) {
                model.addAttribute("error", "Vous devez être connecté pour accéder à cette page");
                return "login"; // Rediriger vers la page de connexion si non authentifié
            }
            
            // Récupérer les paramètres de remise actuels
            DiscountSettingDTO discountSetting = discountService.getCurrentDiscountSetting(token);
            model.addAttribute("discountSetting", discountSetting);
            
            return "discountSettings";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la récupération des paramètres de remise: " + e.getMessage());
            return "error";
        }
    }

    /**
     * Traite la mise à jour des paramètres de remise
     */
    @PostMapping("/settings/update")
    public String updateDiscountSettings(
            @ModelAttribute DiscountSettingDTO discountSettingDTO,
            RedirectAttributes redirectAttributes) {
        
        try {
            // Récupérer le token d'authentification depuis la session
            // String token = (String) session.getAttribute("authToken");
            String token = "eyJ0eXAiOi";
            
            if (token == null) {
                redirectAttributes.addFlashAttribute("error", "Vous devez être connecté pour effectuer cette action");
                return "redirect:/login";
            }
            
            // Mettre à jour les paramètres de remise
            DiscountSettingDTO updatedSetting = discountService.updateDiscountSetting(token, discountSettingDTO);
            
            redirectAttributes.addFlashAttribute("success", "Paramètres de remise mis à jour avec succès");
            return "redirect:/discount/settings";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la mise à jour des paramètres de remise: " + e.getMessage());
            return "redirect:/discount/settings";
        }
    }
}
