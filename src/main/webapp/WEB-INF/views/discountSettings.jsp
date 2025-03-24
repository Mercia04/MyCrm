<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crm.evaluation.Dto.DiscountSettingDTO" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paramètres de Remise | CRM Enterprise</title>
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
<%--                    <a class="nav-link" href="<%= request.getContextPath() %>/payments">--%>
<%--                        <i class="bi bi-cash-coin me-1"></i>Paiements--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">--%>
<%--                        <i class="bi bi-receipt me-1"></i>Factures--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <ul class="navbar-nav ms-auto">--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">--%>
<%--                        <i class="bi bi-gear me-1"></i>Paramètres--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu dropdown-menu-end">--%>
<%--                        <li><a class="dropdown-item active" href="#"><i class="bi bi-percent me-2"></i>Remises</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#"><i class="bi bi-people me-2"></i>Utilisateurs</a></li>--%>
<%--                        <li><hr class="dropdown-divider"></li>--%>
<%--                        <li><a class="dropdown-item" href="#"><i class="bi bi-building me-2"></i>Entreprise</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<div class="container py-4">
<%--    <div class="row mb-4">--%>
<%--        <div class="col">--%>
<%--            <nav aria-label="breadcrumb">--%>
<%--                <ol class="breadcrumb">--%>
<%--                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/">Accueil</a></li>--%>
<%--                    <li class="breadcrumb-item"><a href="#">Paramètres</a></li>--%>
<%--                    <li class="breadcrumb-item active" aria-current="page">Remises</li>--%>
<%--                </ol>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="row">
        <div class="col-lg-8">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold mb-0">
                    <i class="bi bi-percent text-primary me-2"></i>Paramètres de Remise
                </h2>
            </div>

            <%
                String success = (String) request.getAttribute("success");
                if (success != null && !success.isEmpty()) {
            %>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i>
                <div><%= success %></div>
            </div>
            <% } %>

            <%
                String error = (String) request.getAttribute("error");
                if (error != null && !error.isEmpty()) {
            %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                <div><%= error %></div>
            </div>
            <% } %>

            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3">
                    <h5 class="card-title mb-0 fw-bold">Configuration des remises</h5>
                </div>
                <div class="card-body">
                    <form action="<%= request.getContextPath() %>/discount/settings/update" method="post" class="needs-validation" novalidate>
                        <%
                            DiscountSettingDTO discountSetting = (DiscountSettingDTO) request.getAttribute("discountSetting");
                            Double globalDiscountRate = (discountSetting != null) ? discountSetting.getGlobalDiscountRate() : 0.0;
                        %>

                        <div class="mb-4">
                            <label for="globalDiscountRate" class="form-label fw-bold">Taux de remise global (%)</label>
                            <div class="input-group">
                                <input type="number"
                                       class="form-control form-control-lg"
                                       id="globalDiscountRate"
                                       name="globalDiscountRate"
                                       value="<%= globalDiscountRate %>"
                                       step="0.01"
                                       min="0"
                                       max="100"
                                       aria-describedby="discountRateHelp"
                                       required>
                                <span class="input-group-text">%</span>
                                <div class="invalid-feedback">
                                    Veuillez saisir un taux de remise valide entre 0 et 100.
                                </div>
                            </div>
                            <div id="discountRateHelp" class="form-text">
                                Ce taux sera appliqué par défaut à toutes les nouvelles factures.
                            </div>
                        </div>

                        <input type="hidden" name="isActive" value="true">

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="reset" class="btn btn-outline-secondary me-md-2">
                                <i class="bi bi-arrow-counterclockwise me-1"></i>Réinitialiser
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-check-lg me-1"></i>Enregistrer les modifications
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card border-0 shadow-sm mt-4 mt-lg-0">
                <div class="card-header bg-white py-3">
                    <h5 class="card-title mb-0 fw-bold">
                        <i class="bi bi-info-circle me-2 text-primary"></i>Informations
                    </h5>
                </div>
                <div class="card-body">
                    <div class="alert alert-info bg-info bg-opacity-10 border-0">
                        <h6 class="fw-bold"><i class="bi bi-lightbulb me-2"></i>À propos des remises</h6>
                        <p class="mb-0 small">
                            Le taux de remise global est appliqué automatiquement à toutes les nouvelles factures.
                            Vous pouvez toujours modifier la remise individuellement pour chaque facture.
                        </p>
                    </div>

                    <h6 class="fw-bold mt-4">Exemple de calcul</h6>
                    <div class="table-responsive">
                        <table class="table table-sm">
                            <tbody>
                            <tr>
                                <td>Montant HT</td>
                                <td class="text-end">1 000,00 €</td>
                            </tr>
                            <tr>
                                <td>Remise (<%= globalDiscountRate %>%)</td>
                                <td class="text-end text-danger">- <%= String.format("%.2f", 1000 * (globalDiscountRate / 100)) %> €</td>
                            </tr>
                            <tr>
                                <td>TVA (20%)</td>
                                <td class="text-end"><%= String.format("%.2f", (1000 - (1000 * (globalDiscountRate / 100))) * 0.2) %> €</td>
                            </tr>
                            <tr class="fw-bold">
                                <td>Total TTC</td>
                                <td class="text-end"><%= String.format("%.2f", (1000 - (1000 * (globalDiscountRate / 100))) * 1.2) %> €</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

<%--            <div class="card border-0 shadow-sm mt-4">--%>
<%--                <div class="card-header bg-white py-3">--%>
<%--                    <h5 class="card-title mb-0 fw-bold">--%>
<%--                        <i class="bi bi-clock-history me-2 text-primary"></i>Historique--%>
<%--                    </h5>--%>
<%--                </div>--%>
<%--                <div class="card-body">--%>
<%--                    <p class="text-muted small text-center py-2">--%>
<%--                        L'historique des modifications sera disponible dans une prochaine mise à jour.--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
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
<script>
    // Script pour la validation des formulaires Bootstrap
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>
