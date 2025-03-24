<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crm.evaluation.models.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Paiements | CRM Enterprise</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="<%= request.getContextPath() %>/">CRM Enterprise</a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="<%= request.getContextPath() %>/">--%>
<%--                        <i class="bi bi-speedometer2 me-1"></i>Tableau de bord--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="<%= request.getContextPath() %>/payments">--%>
<%--                        <i class="bi bi-cash-coin me-1"></i>Paiements--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">--%>
<%--                        <i class="bi bi-receipt me-1"></i>Factures--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0">Gestion des Paiements</h2>
            <p class="text-muted">Consultez et gérez tous les paiements</p>
        </div>
        <div>
<%--            <button class="btn btn-primary">--%>
<%--                <i class="bi bi-plus-lg me-1"></i>Nouveau Paiement--%>
<%--            </button>--%>
        </div>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-white py-3">
            <div class="row align-items-center">
                <div class="col">
                    <h5 class="mb-0 fw-bold">Liste des Paiements</h5>
                </div>
                <div class="col-auto">
                    <div class="input-group">
<%--                        <input type="text" class="form-control" placeholder="Rechercher...">--%>
                        <button class="btn btn-outline-secondary" type="button">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Date</th>
                        <th scope="col">Montant</th>
                        <th scope="col">Source</th>
                        <th scope="col">N° Facture</th>
                        <th scope="col">Statut</th>
                        <th scope="col" class="text-end">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Payment> payments = (List<Payment>) request.getAttribute("payments");
                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.FRANCE);

                        if (payments != null && !payments.isEmpty()) {
                            for (Payment payment : payments) {
                                String statusClass = "";
                                if (payment.getInvoice() != null) {
                                    String status = payment.getInvoice().getStatus();
                                    if ("PAID".equals(status)) {
                                        statusClass = "bg-success";
                                    } else if ("PARTIAL".equals(status)) {
                                        statusClass = "bg-warning";
                                    } else if ("OVERDUE".equals(status)) {
                                        statusClass = "bg-danger";
                                    } else {
                                        statusClass = "bg-secondary";
                                    }
                                }
                    %>
                    <tr>
                        <td><%= payment.getId() %></td>
                        <td>
                            <%
                                if (payment.getPaymentDate() != null) {
                                    try {
                                        out.print(dateFormat.format(payment.getPaymentDate()));
                                    } catch (Exception e) {
                                        // Si la date ne peut pas être formatée, afficher une valeur par défaut
                                        out.print("Date invalide");
                                    }
                                } else {
                                    out.print("Non définie");
                                }
                            %>
                        </td>
                        <td><%= currencyFormat.format(payment.getAmount() / 100.0) %></td>
                        <td>
                            <% if (payment.getPaymentSource() != null) { %>
                            <span class="badge bg-light text-dark">
                                            <% if ("BANK_TRANSFER".equals(payment.getPaymentSource())) { %>
                                                <i class="bi bi-bank me-1"></i>Virement
                                            <% } else if ("CREDIT_CARD".equals(payment.getPaymentSource())) { %>
                                                <i class="bi bi-credit-card me-1"></i>Carte
                                            <% } else if ("CASH".equals(payment.getPaymentSource())) { %>
                                                <i class="bi bi-cash me-1"></i>Espèces
                                            <% } else if ("CHECK".equals(payment.getPaymentSource())) { %>
                                                <i class="bi bi-file-text me-1"></i>Chèque
                                            <% } else { %>
                                                <%= payment.getPaymentSource() %>
                                            <% } %>
                                        </span>
                            <% } %>
                        </td>
                        <td>
                            <% if (payment.getInvoice() != null) { %>
                            <a href="#" class="text-decoration-none">
                                #<%= payment.getInvoice().getId() %>
                            </a>
                            <% } else { %>
                            -
                            <% } %>
                        </td>
                        <td>
                            <% if (payment.getInvoice() != null) { %>
                            <span class="badge <%= statusClass %> rounded-pill">
                                            <%= payment.getInvoice().getStatus() %>
                                        </span>
                            <% } else { %>
                            -
                            <% } %>
                        </td>
                        <td class="text-end">
                            <div class="btn-group">
                                <a href="<%= request.getContextPath() + "/payment/details/" + payment.getId() %>" class="btn btn-sm btn-outline-primary">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <a href="<%= request.getContextPath() + "/payment/delete/" + payment.getId() %>"
                                   class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce paiement ?');">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center py-4 text-muted">
                            <i class="bi bi-info-circle me-2"></i>Aucun paiement trouvé
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
<%--        <div class="card-footer bg-white py-3">--%>
<%--            <nav aria-label="Pagination des paiements">--%>
<%--                <ul class="pagination justify-content-center mb-0">--%>
<%--                    <li class="page-item disabled">--%>
<%--                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Précédent</a>--%>
<%--                    </li>--%>
<%--                    <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="#">Suivant</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>
<%--        </div>--%>
    </div>
</div>

<footer class="bg-dark text-white py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="mb-0">&copy; 2023 CRM Enterprise. Tous droits réservés.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="mb-0">Version 1.0.0</p>
            </div>
        </div>
    </div>
</footer>

<!-- Scripts Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
