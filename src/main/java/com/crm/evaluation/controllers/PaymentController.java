package com.crm.evaluation.controllers;

import com.crm.evaluation.services.PaymentService;
import com.crm.evaluation.models.Payment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class PaymentController {

    private final PaymentService paymentService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    @GetMapping("/payments")
    public String getAllPayments(Model model) {
        List<Payment> payments = paymentService.getAllPayments();
        model.addAttribute("payments", payments);
        return "payments";
    }

    @GetMapping("/payment/details/{externalId}")
    public String getPaymentDetails(@PathVariable("externalId") String externalId, Model model) {
        try {
            Payment payment = paymentService.getPaymentDetailsByExternalId(externalId);
            model.addAttribute("payment", payment);
            return "paymentDetails";
        } catch (Exception e) {
            model.addAttribute("error", "Paiement non trouvé pour l'ID externe : " + externalId);
            return "error";
        }
    }

    @PostMapping("/payment/update")
    public String updatePayment(
            @RequestParam("id") String id,
            @RequestParam("amount") double amount,
            RedirectAttributes redirectAttributes) {

        try {
            paymentService.updatePaymentAmount(id, amount);
            redirectAttributes.addFlashAttribute("success", "Paiement mis à jour avec succès !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la mise à jour : " + e.getMessage());
        }

        // Redirection vers la page des détails après mise à jour
        // return "redirect:/payment/details/" + id;
        return "redirect:/payments";
    }

    /**
     * Supprime un paiement
     * 
     * @param externalId L'identifiant externe du paiement à supprimer
     * @param redirectAttributes Pour ajouter des messages flash
     * @return Redirection vers la liste des paiements
     */
    @GetMapping("/payment/delete/{externalId}")
    public String deletePayment(
            @PathVariable("externalId") String externalId,
            RedirectAttributes redirectAttributes) {
        
        try {
            boolean deleted = paymentService.deletePayment(externalId);
            if (deleted) {
                redirectAttributes.addFlashAttribute("success", "Paiement supprimé avec succès !");
            } else {
                redirectAttributes.addFlashAttribute("error", "Échec de la suppression du paiement.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la suppression : " + e.getMessage());
        }
        
        return "redirect:/payments";
    }
}

