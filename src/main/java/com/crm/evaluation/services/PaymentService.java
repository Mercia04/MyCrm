package com.crm.evaluation.services;

import com.crm.evaluation.models.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


import java.util.Arrays;
import java.util.List;

@Service
public class PaymentService {

    private final RestTemplate restTemplate=new RestTemplate();
    private final ObjectMapper objectMapper=new ObjectMapper();

    public List<Payment> getAllPayments() {
        try {

            String url = "http://127.0.0.1:8000/api/payments";
            String jsonResponse = restTemplate.getForObject(url, String.class);

            
            PaymentResponse response = objectMapper.readValue(jsonResponse, PaymentResponse.class);

            if (response != null && response.isSuccess()) {
                return response.getData(); // Retourne la liste des paiements
            } else {
                throw new RuntimeException("Failed to fetch payments");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error while fetching payments: " + e.getMessage(), e);
        }
    }
}
