<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crm.evaluation.models.User" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tableau de Bord CRM</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- Chart.js pour les graphiques -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
<a class="navbar-brand" href="#">CRM Enterprise</a>
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
<ul class="navbar-nav ms-auto">
<% if (request.getAttribute("user") != null) {
User user = (User) request.getAttribute("user");
%>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
<i class="bi bi-person-circle me-1"></i><%= user.getName() %>
</a>
<ul class="dropdown-menu dropdown-menu-end">
<li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Paramètres</a></li>
<li><hr class="dropdown-divider"></li>
<li><a class="dropdown-item" href="#"><i class="bi bi-box-arrow-right me-2"></i>Déconnexion</a></li>
</ul>
</li>
<% } %>
</ul>
</div>
</div>
</nav>

<div class="container py-4">
<div class="row mb-4">
<div class="col">
<div class="d-flex justify-content-between align-items-center">
<h2 class="fw-bold text-dark">Tableau de Bord</h2>
</div>
</div>
</div>

<div class="row g-4">
<!-- Offres -->
<div class="col-md-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-body">
<div class="d-flex justify-content-between align-items-center mb-3">
<h5 class="card-title fw-bold mb-0">Offres</h5>
<div class="rounded-circle bg-primary bg-opacity-10 p-2">
<i class="bi bi-file-earmark-text text-primary fs-4"></i>
</div>
</div>
<h2 class="display-6 fw-bold mb-0"><%= request.getAttribute("totalOffers") != null ? request.getAttribute("totalOffers") : 0 %></h2>
<p class="text-muted small">Total des offres actives</p>
<!-- <a href="#" class="btn btn-sm btn-outline-primary mt-2">Voir détails</a> -->
</div>
</div>
</div>

<!-- Paiements -->
<div class="col-md-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-body">
<div class="d-flex justify-content-between align-items-center mb-3">
<h5 class="card-title fw-bold mb-0">Paiements</h5>
<div class="rounded-circle bg-success bg-opacity-10 p-2">
<i class="bi bi-cash-coin text-success fs-4"></i>
</div>
</div>
<h2 class="display-6 fw-bold mb-0"><%= request.getAttribute("totalPayments") != null ? request.getAttribute("totalPayments") : 0 %></h2>
<p class="text-muted small">Total des paiements reçus</p>
<a href="<%= request.getContextPath() %>/payments" class="btn btn-sm btn-outline-success mt-2">Voir paiements</a>
</div>
</div>
</div>

<!-- Projets -->
<div class="col-md-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-body">
<div class="d-flex justify-content-between align-items-center mb-3">
<h5 class="card-title fw-bold mb-0">Projets</h5>
<div class="rounded-circle bg-warning bg-opacity-10 p-2">
<i class="bi bi-kanban text-warning fs-4"></i>
</div>
</div>
<h2 class="display-6 fw-bold mb-0"><%= request.getAttribute("totalProjects") != null ? request.getAttribute("totalProjects") : 0 %></h2>
<p class="text-muted small">Projets en cours</p>
<!-- <a href="#" class="btn btn-sm btn-outline-warning mt-2">Voir projets</a> -->
</div>
</div>
</div>

<!-- Factures -->
<div class="col-md-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-body">
<div class="d-flex justify-content-between align-items-center mb-3">
<h5 class="card-title fw-bold mb-0">Factures</h5>
<div class="rounded-circle bg-danger bg-opacity-10 p-2">
<i class="bi bi-receipt text-danger fs-4"></i>
</div>
</div>
<h2 class="display-6 fw-bold mb-0"><%= request.getAttribute("totalInvoices") != null ? request.getAttribute("totalInvoices") : 0 %></h2>
<p class="text-muted small">Factures émises</p>
<!-- <a href="#" class="btn btn-sm btn-outline-danger mt-2">Voir factures</a> -->
</div>
</div>
</div>

<!-- Tâches -->
<div class="col-md-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-body">
<div class="d-flex justify-content-between align-items-center mb-3">
<h5 class="card-title fw-bold mb-0">Tâches</h5>
<div class="rounded-circle bg-info bg-opacity-10 p-2">
<i class="bi bi-check2-square text-info fs-4"></i>
</div>
</div>
<h2 class="display-6 fw-bold mb-0"><%= request.getAttribute("totalTasks") != null ? request.getAttribute("totalTasks") : 0 %></h2>
<p class="text-muted small">Tâches à réaliser</p>
<!-- <a href="#" class="btn btn-sm btn-outline-info mt-2">Voir tâches</a> -->
</div>
</div>
</div>

<!-- Paramètres de Remise -->
<div class="col-md-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-body">
<div class="d-flex justify-content-between align-items-center mb-3">
<h5 class="card-title fw-bold mb-0">Remises</h5>
<div class="rounded-circle bg-secondary bg-opacity-10 p-2">
<i class="bi bi-percent text-secondary fs-4"></i>
</div>
</div>
<h2 class="display-6 fw-bold mb-0">Config</h2>
<p class="text-muted small">Paramètres de remise globale</p>
<a href="<%= request.getContextPath() %>/discount/settings" class="btn btn-sm btn-outline-secondary mt-2">Configurer</a>
</div>
</div>
</div>
</div>

<!-- Section des graphiques -->
<div class="row mt-4">
<div class="col-12">
<div class="card border-0 shadow-sm mb-4">
<div class="card-header bg-white d-flex justify-content-between align-items-center">
<h5 class="card-title mb-0 fw-bold">Analyse des données</h5>
<div class="dropdown">
<button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
<i class="bi bi-calendar3 me-1"></i><%= request.getAttribute("currentPeriod") != null && request.getAttribute("currentPeriod").equals("month") ? "Ce mois" : 
           request.getAttribute("currentPeriod") != null && request.getAttribute("currentPeriod").equals("quarter") ? "Ce trimestre" : "Cette année" %>
</button>
<ul class="dropdown-menu dropdown-menu-end">
<li><a class="dropdown-item" href="#" onclick="updateChartPeriod('month')">Ce mois</a></li>
<li><a class="dropdown-item" href="#" onclick="updateChartPeriod('quarter')">Ce trimestre</a></li>
<li><a class="dropdown-item" href="#" onclick="updateChartPeriod('year')">Cette année</a></li>
</ul>
</div>
</div>
<div class="card-body">
<div class="row">
<!-- Graphique 1: Revenus par mois -->
<div class="col-md-6 mb-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-header bg-white">
<h6 class="card-title mb-0 fw-bold">Revenus mensuels</h6>
</div>
<div class="card-body">
<div class="chart-container" style="position: relative; height: 300px;">
<canvas id="revenueChart"></canvas>
</div>
</div>
</div>
</div>

<!-- Graphique 2: Répartition des projets par statut -->
<div class="col-md-6 mb-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-header bg-white">
<h6 class="card-title mb-0 fw-bold">Statut des projets</h6>
</div>
<div class="card-body">
<div class="chart-container" style="position: relative; height: 300px;">
<canvas id="projectStatusChart"></canvas>
</div>
</div>
</div>
</div>

<!-- Graphique 3: Taux de conversion des offres -->
<div class="col-md-6 mb-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-header bg-white">
<h6 class="card-title mb-0 fw-bold">Taux de conversion des offres</h6>
</div>
<div class="card-body">
<div class="chart-container" style="position: relative; height: 300px;">
<canvas id="conversionRateChart"></canvas>
</div>
</div>
</div>
</div>

<!-- Graphique 4: Répartition des factures par statut -->
<div class="col-md-6 mb-4">
<div class="card border-0 shadow-sm h-100">
<div class="card-header bg-white">
<h6 class="card-title mb-0 fw-bold">Statut des factures</h6>
</div>
<div class="card-body">
<div class="chart-container" style="position: relative; height: 300px;">
<canvas id="invoiceStatusChart"></canvas>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
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

<!-- Scripts pour les graphiques -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Débogage des données
    console.log("Initialisation des graphiques...");
    
    // Données pour les graphiques (provenant du backend)
    const revenueLabels =['<%= request.getAttribute("revenueLabels") != null ? request.getAttribute("revenueLabels") : "'Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sep', 'Oct', 'Nov', 'Déc'" %>'];
    console.log("revenueLabels:", revenueLabels);

    const monthlyRevenueData = [<%= request.getAttribute("revenueData") != null ? request.getAttribute("revenueData") : "12000, 19000, 15000, 25000, 22000, 30000, 28000, 26000, 29000, 32000, 35000, 38000" %>];
    console.log("monthlyRevenueData:", monthlyRevenueData);

    const projectStatusLabels = ['<%= request.getAttribute("projectStatusLabels") != null ? request.getAttribute("projectStatusLabels") : "['En cours', 'Terminés', 'En attente', 'Annulés']" %> '];
    console.log("projectStatusLabels:", projectStatusLabels);
    
    const projectStatusData = [<%= request.getAttribute("projectStatusData") != null ? request.getAttribute("projectStatusData") : "40, 30, 20, 10" %>];
    console.log("projectStatusData:", projectStatusData);

    const projectStatusColors =[' <%= request.getAttribute("projectStatusColors") != null ? request.getAttribute("projectStatusColors") : "['rgba(255, 193, 7, 0.8)', 'rgba(40, 167, 69, 0.8)', 'rgba(23, 162, 184, 0.8)', 'rgba(220, 53, 69, 0.8)']" %> '];
    console.log("projectStatusColors:", projectStatusColors);

    const conversionRateLabels =[' <%= request.getAttribute("conversionRateLabels") != null ? request.getAttribute("conversionRateLabels") : "['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin']" %> '];
    console.log("conversionRateLabels:", conversionRateLabels);

    const conversionRateData = [<%= request.getAttribute("conversionRateData") != null ? request.getAttribute("conversionRateData") : "25, 30, 28, 35, 40, 42" %>];
    console.log("conversionRateData:", conversionRateData);

    const invoiceStatusLabels = ['<%= request.getAttribute("invoiceStatusLabels") != null ? request.getAttribute("invoiceStatusLabels") : "['Payées', 'En attente', 'En retard', 'Annulées']" %> '];
    console.log("invoiceStatusLabels:", invoiceStatusLabels);

    const invoiceStatusData = [<%= request.getAttribute("invoiceStatusData") != null ? request.getAttribute("invoiceStatusData") : "45, 30, 20, 5" %>];
    console.log("invoiceStatusData:", invoiceStatusData);

    const invoiceStatusColors =['  <%= request.getAttribute("invoiceStatusColors") != null ? request.getAttribute("invoiceStatusColors") : "['rgba(40, 167, 69, 0.8)', 'rgba(255, 193, 7, 0.8)', 'rgba(220, 53, 69, 0.8)', 'rgba(108, 117, 125, 0.8)']" %> '];
    console.log("invoiceStatusColors:", invoiceStatusColors);

    // Graphique 1: Revenus mensuels
    const revenueCtx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(revenueCtx, {
        type: 'bar',
        data: {
            labels: revenueLabels,
            datasets: [{
                label: 'Revenus (€)',
                data: monthlyRevenueData,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return new Intl.NumberFormat('fr-FR', { style: 'currency', currency: 'EUR' }).format(context.raw);
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value / 1000 + 'k €';
                        }
                    }
                }
            }
        }
    });

    // Graphique 2: Répartition des projets par statut
    const projectStatusCtx = document.getElementById('projectStatusChart').getContext('2d');
    const projectStatusChart = new Chart(projectStatusCtx, {
        type: 'doughnut',
        data: {
            labels: projectStatusLabels,
            datasets: [{
                data: projectStatusData,
                backgroundColor: projectStatusColors,
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'right'
                }
            }
        }
    });

    // Graphique 3: Taux de conversion des offres
    const conversionRateCtx = document.getElementById('conversionRateChart').getContext('2d');
    const conversionRateChart = new Chart(conversionRateCtx, {
        type: 'line',
        data: {
            labels: conversionRateLabels,
            datasets: [{
                label: 'Taux de conversion (%)',
                data: conversionRateData,
                fill: true,
                backgroundColor: 'rgba(40, 167, 69, 0.2)',
                borderColor: 'rgba(40, 167, 69, 1)',
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return context.raw + '%';
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100,
                    ticks: {
                        callback: function(value) {
                            return value + '%';
                        }
                    }
                }
            }
        }
    });

    // Graphique 4: Répartition des factures par statut
    const invoiceStatusCtx = document.getElementById('invoiceStatusChart').getContext('2d');
    const invoiceStatusChart = new Chart(invoiceStatusCtx, {
        type: 'pie',
        data: {
            labels: invoiceStatusLabels,
            datasets: [{
                data: invoiceStatusData,
                backgroundColor: invoiceStatusColors,
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'right'
                }
            }
        }
    });

    // Rendre les graphiques cliquables pour afficher les détails
    document.getElementById('revenueChart').onclick = function(evt) {
        const points = revenueChart.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);
        if (points.length) {
            const firstPoint = points[0];
            const month = revenueChart.data.labels[firstPoint.index];
            const revenue = revenueChart.data.datasets[0].data[firstPoint.index];

            // Rediriger vers la page de détails des revenus pour ce mois
            window.location.href = '<%= request.getContextPath() %>/payments?month=' + (firstPoint.index + 1) + '&year=2023';
        }
    };

    document.getElementById('projectStatusChart').onclick = function(evt) {
        const points = projectStatusChart.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);
        if (points.length) {
            const firstPoint = points[0];
            const status = projectStatusChart.data.labels[firstPoint.index];

            // Rediriger vers la page de détails des projets avec ce statut
            window.location.href = '<%= request.getContextPath() %>/projects?status=' + status;
        }
    };

    document.getElementById('conversionRateChart').onclick = function(evt) {
        const points = conversionRateChart.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);
        if (points.length) {
            const firstPoint = points[0];
            const month = conversionRateChart.data.labels[firstPoint.index];

            // Rediriger vers la page de détails des offres pour ce mois
            window.location.href = '<%= request.getContextPath() %>/offers?month=' + (firstPoint.index + 1) + '&year=2023';
        }
    };

    document.getElementById('invoiceStatusChart').onclick = function(evt) {
        const points = invoiceStatusChart.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);
        if (points.length) {
            const firstPoint = points[0];
            const status = invoiceStatusChart.data.labels[firstPoint.index];

            // Rediriger vers la page de détails des factures avec ce statut
            window.location.href = '<%= request.getContextPath() %>/invoices?status=' + status;
        }
    };
});

// Fonction pour mettre à jour la période des graphiques
function updateChartPeriod(period) {
    console.log("Mise à jour de la période:", period);
    
    // Appel AJAX pour récupérer les nouvelles données
    fetch('<%= request.getContextPath() %>/api/dashboard/update-period?period=' + period)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erreur réseau: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log("Données reçues:", data);
            
            // Mettre à jour les graphiques avec les nouvelles données
            updateCharts(data);
            
            // Mettre à jour le texte du bouton dropdown
            const periodText = period === 'month' ? 'Ce mois' : period === 'quarter' ? 'Ce trimestre' : 'Cette année';
            document.querySelector('.dropdown-toggle').innerHTML = `<i class="bi bi-calendar3 me-1"></i>${periodText}`;
        })
        .catch(error => {
            console.error('Erreur lors de la récupération des données:', error);
            alert('Erreur lors de la mise à jour des données: ' + error.message);
        });
}

// Fonction pour mettre à jour les graphiques avec de nouvelles données
function updateCharts(data) {
    // Récupérer les instances des graphiques
    const revenueChart = Chart.getChart('revenueChart');
    const projectStatusChart = Chart.getChart('projectStatusChart');
    const conversionRateChart = Chart.getChart('conversionRateChart');
    const invoiceStatusChart = Chart.getChart('invoiceStatusChart');
    
    if (data.revenueData) {
        // Mettre à jour le graphique des revenus
        revenueChart.data.labels = data.revenueData.labels;
        revenueChart.data.datasets[0].data = data.revenueData.data;
        revenueChart.update();
    }
    
    if (data.projectStatusData) {
        // Mettre à jour le graphique des statuts de projet
        projectStatusChart.data.labels = data.projectStatusData.labels;
        projectStatusChart.data.datasets[0].data = data.projectStatusData.data;
        projectStatusChart.data.datasets[0].backgroundColor = data.projectStatusData.colors;
        projectStatusChart.update();
    }
    
    if (data.conversionRateData) {
        // Mettre à jour le graphique des taux de conversion
        conversionRateChart.data.labels = data.conversionRateData.labels;
        conversionRateChart.data.datasets[0].data = data.conversionRateData.data;
        conversionRateChart.update();
    }
    
    if (data.invoiceStatusData) {
        // Mettre à jour le graphique des statuts de facture
        invoiceStatusChart.data.labels = data.invoiceStatusData.labels;
        invoiceStatusChart.data.datasets[0].data = data.invoiceStatusData.data;
        invoiceStatusChart.data.datasets[0].backgroundColor = data.invoiceStatusData.colors;
        invoiceStatusChart.update();
    }
    
    // Mettre à jour les totaux dans les cartes
    if (data.totals) {
        const cards = document.querySelectorAll('.card .display-6');
        if (data.totals.totalOffers) cards[0].textContent = data.totals.totalOffers;
        if (data.totals.totalPayments) cards[1].textContent = data.totals.totalPayments;
        if (data.totals.totalProjects) cards[2].textContent = data.totals.totalProjects;
        if (data.totals.totalInvoices) cards[3].textContent = data.totals.totalInvoices;
        if (data.totals.totalTasks) cards[4].textContent = data.totals.totalTasks;
    }
}
</script>

</body>
</html>
