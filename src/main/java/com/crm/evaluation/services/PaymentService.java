package com.crm.evaluation.services;

import com.crm.evaluation.models.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


import java.util.*;

@Service
public class PaymentService {

    private final RestTemplate restTemplate = new RestTemplate();
    private final ObjectMapper objectMapper = new ObjectMapper();

    public List<Payment> getAllPayments() {
        try {
            String url = "http://127.0.0.1:8000/api/payments";
            String jsonResponse = restTemplate.getForObject(url, String.class);

            PaymentListResponse response = objectMapper.readValue(jsonResponse, PaymentListResponse.class);

            if (response != null && response.isSuccess()) {
                return response.getData(); // Retourne la liste des paiements
            } else {
                throw new RuntimeException("Failed to fetch payments: " + response.getMessage());
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching payments: " + e.getMessage(), e);
        }
    }

    public Payment getPaymentDetailsByExternalId(String externalId) {
        try {
            String url = "http://127.0.0.1:8000/api/payments/" + externalId;
            String jsonResponse = restTemplate.getForObject(url, String.class);

            PaymentResponse response = objectMapper.readValue(jsonResponse, PaymentResponse.class);

            if (response != null && response.isSuccess()) {
                return response.getData();
            } else {
                throw new RuntimeException("Payment not found for externalId: " + externalId);
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching payment details: " + e.getMessage(), e);
        }
    }

    /**
     * Met à jour le montant d'un paiement
     *
     * @param externalId L'identifiant externe du paiement
     * @param amount Le nouveau montant du paiement
     * @return Le paiement mis à jour
     */
    public Payment updatePaymentAmount(String externalId, double amount) {
        try {
            String url ="http://127.0.0.1:8000/api/payments/" + externalId + "/amount";

            // Création des en-têtes HTTP
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

            // Création du corps de la requête
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("amount", amount);

            // Création de l'entité HTTP avec les en-têtes et le corps
            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            // Envoi de la requête PUT
            ResponseEntity<String> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.PUT,
                    requestEntity,
                    String.class
            );

            // Traitement de la réponse
            String jsonResponse = responseEntity.getBody();
            PaymentResponse response = objectMapper.readValue(jsonResponse, PaymentResponse.class);

            if (response != null && response.isSuccess()) {
                return response.getData();
            } else {
                throw new RuntimeException("Failed to update payment amount: " +
                        (response != null ? response.getMessage() : "Unknown error"));
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while updating payment amount: " + e.getMessage(), e);
        }
    }
    /**
     * Supprime un paiement
     *
     * @param externalId L'identifiant externe du paiement à supprimer
     * @return true si la suppression a réussi, sinon une exception est levée
     */
    public boolean deletePayment(String externalId) {
        try {
            String url = "http://127.0.0.1:8000/api/payments/" + externalId;
            
            // Création des en-têtes HTTP
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            
            // Création de l'entité HTTP avec les en-têtes (pas de corps pour DELETE)
            HttpEntity<Void> requestEntity = new HttpEntity<>(headers);
            
            // Envoi de la requête DELETE
            ResponseEntity<String> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.DELETE,
                    requestEntity,
                    String.class
            );
            
            // Traitement de la réponse
            String jsonResponse = responseEntity.getBody();
            Map<String, Object> response = objectMapper.readValue(jsonResponse, Map.class);
            
            if (response != null && Boolean.TRUE.equals(response.get("success"))) {
                return true;
            } else {
                throw new RuntimeException("Failed to delete payment: " + 
                        (response != null ? response.get("message") : "Unknown error"));
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while deleting payment: " + e.getMessage(), e);
        }
    }
}
