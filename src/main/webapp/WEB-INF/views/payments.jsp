<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Paiements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

<h2>Liste des Paiements</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Date de Paiement</th>
            <th>Montant</th>
            <th>Status</th>
            <th>Nom du Client</th>
            <th>Numéro de Facture</th>
        </tr>
    </thead>
    <tbody>
        <% 
            // Récupération de la liste des paiements passée dans le modèle
            List<Payment> payments = (List<Payment>) request.getAttribute("payments");
            for (Payment payment : payments) { 
        %>
            <tr>
                <td><%= payment.getId() %></td>
                <td><%= payment.getPaymentDate() %></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getStatus() %></td>
                <td><%= payment.getCustomerName() %></td>
                <td><%= payment.getInvoiceNumber() %></td>
            </tr>
        <% 
            } 
        %>
    </tbody>
</table>

</body>
</html>
