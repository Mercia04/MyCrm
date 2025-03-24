<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crm.evaluation.models.User" %>
<html>
<head>
    <title>Tableau de Bord</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease-in-out;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .dashboard-header {
            margin-bottom: 30px;
            color: #343a40;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container mt-5">

    <%
    String message = (String) request.getAttribute("message");
    User user = (User) request.getAttribute("user");

    if (user != null) {
        %>
        <h2>Bienvenue, <%= user.getName() %> !</h2>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>

    <%
    }
    %>
    <h2 class="dashboard-header">Tableau de Bord</h2>
    
    <div class="row">
        <!-- Offres -->
        <div class="col-md-4">
            <div class="card dashboard-card bg-primary text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Offres</h5>
                    <p class="card-text"><%= request.getAttribute("totalOffers") %></p>
                </div>
            </div>
        </div>

        <!-- Paiements -->
        <div class="col-md-4">
            <div class="card dashboard-card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Paiements</h5>
                    <p class="card-text"><%= request.getAttribute("totalPayments") %></p>
                    <a href="<%= request.getContextPath() %>/payments" class="btn btn-primary">View Payments</a>
                </div>
            </div>
        </div>

        <!-- Projets -->
        <div class="col-md-4">
            <div class="card dashboard-card bg-warning text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Projets</h5>
                    <p class="card-text"><%= request.getAttribute("totalProjects") %></p>
                </div>
            </div>
        </div>

        <!-- Factures -->
        <div class="col-md-4 mt-3">
            <div class="card dashboard-card bg-danger text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Factures</h5>
                    <p class="card-text"><%= request.getAttribute("totalInvoices") %></p>
                </div>
            </div>
        </div>

        <!-- Tâches -->
        <div class="col-md-4 mt-3">
            <div class="card dashboard-card bg-info text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Tâches</h5>
                    <p class="card-text"><%= request.getAttribute("totalTasks") %></p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
