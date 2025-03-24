<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crm.evaluation.models.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails du Paiement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="row mb-4">
        <div class="col">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="fw-bold text-dark">
                    <i class="bi bi-credit-card me-2"></i>Détails du Paiement
                </h2>
                <a href="javascript:history.back()" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Retour
                </a>
            </div>
        </div>
    </div>

    <%
        Payment payment = (Payment) request.getAttribute("payment");
        if (payment != null) {
    %>
    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <th style="width: 30%;" class="bg-light">ID</th>
                        <td><%= payment.getId() %></td>
                    </tr>
                    <tr>
                        <th class="bg-light">Montant</th>
                        <td>
                            <form action="<%= request.getContextPath() %>/payment/update" method="post" class="d-flex align-items-center">
                                <input type="hidden" name="id" value="<%= payment.getId() %>">
                                <div class="input-group">
                                    <span class="input-group-text">€</span>
                                    <input type="number" name="amount" value="<%= payment.getAmount() %>" step="0.01" required class="form-control" style="max-width: 150px;">
                                </div>
                                <button type="submit" class="btn btn-primary ms-2">
                                    <i class="bi bi-pencil-square me-1"></i>Modifier
                                </button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <th class="bg-light">Date de Paiement</th>
                        <td><%= payment.getPaymentDate() %></td>
                    </tr>
                    <tr>
                        <th class="bg-light">Source de Paiement</th>
                        <td>
                                    <span class="badge bg-info text-dark">
                                        <i class="bi bi-bank me-1"></i><%= payment.getPaymentSource() %>
                                    </span>
                        </td>
                    </tr>
                    <tr>
                        <th class="bg-light">Numéro de Facture</th>
                        <td>
                            <a href="<%= request.getContextPath() %>/invoice/<%= payment.getInvoice().getId() %>" class="text-decoration-none">
                                <i class="bi bi-file-earmark-text me-1"></i><%= payment.getInvoice().getId() %>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <th class="bg-light">Status de Facture</th>
                        <td>
                            <%
                                String status = payment.getInvoice().getStatus();
                                String badgeClass = "bg-secondary";
                                String icon = "question-circle";

                                if (status.equalsIgnoreCase("paid")) {
                                    badgeClass = "bg-success";
                                    icon = "check-circle";
                                } else if (status.equalsIgnoreCase("pending")) {
                                    badgeClass = "bg-warning text-dark";
                                    icon = "clock";
                                } else if (status.equalsIgnoreCase("overdue")) {
                                    badgeClass = "bg-danger";
                                    icon = "exclamation-circle";
                                }
                            %>
                            <span class="badge <%= badgeClass %>">
                                        <i class="bi bi-<%= icon %> me-1"></i><%= status %>
                                    </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%
    } else {
    %>
    <div class="alert alert-warning" role="alert">
        <i class="bi bi-exclamation-triangle me-2"></i>Paiement non trouvé
    </div>
    <%
        }
    %>
</div>

<!-- Scripts Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
