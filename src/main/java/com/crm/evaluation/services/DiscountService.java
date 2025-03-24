package com.crm.evaluation.services;

import com.crm.evaluation.Dto.DiscountSettingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class DiscountService {

    private final RestTemplate restTemplate= new RestTemplate();

    private String laravelApiUrl="http://127.0.0.1:8000/api   ";

    /**
     * Obtenir la configuration de remise actuelle depuis l'API Laravel
     */
    public DiscountSettingDTO getCurrentDiscountSetting(String token) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);

            HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

            String url = laravelApiUrl + "/settings/discount";

            ResponseEntity<DiscountSettingDTO> response = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    requestEntity,
                    DiscountSettingDTO.class
            );

            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            // En cas d'erreur, retourner une valeur par défaut
            DiscountSettingDTO dto = new DiscountSettingDTO();
            dto.setGlobalDiscountRate(0.0);
            return dto;
        }
    }

    /**
     * Mettre à jour la configuration de remise via l'API Laravel
     */
    public DiscountSettingDTO updateDiscountSetting(String token, DiscountSettingDTO dto) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            headers.set("Content-Type", "application/json");

            HttpEntity<DiscountSettingDTO> requestEntity = new HttpEntity<>(dto, headers);

            String url = laravelApiUrl + "/settings/discount";

            ResponseEntity<DiscountSettingDTO> response = restTemplate.exchange(
                    url,
                    HttpMethod.POST,
                    requestEntity,
                    DiscountSettingDTO.class
            );

            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            // En cas d'erreur, retourner l'objet original
            return dto;
        }
    }
}
