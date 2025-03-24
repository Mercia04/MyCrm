<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion | CRM Enterprise</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-6 col-lg-5">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-4 p-md-5">
                    <div class="text-center mb-4">
                        <i class="bi bi-building text-primary" style="font-size: 3rem;"></i>
                        <h2 class="fw-bold mt-3">CRM Enterprise</h2>
                        <p class="text-muted">Connectez-vous à votre compte</p>
                    </div>

                    <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        <div><%= request.getAttribute("error") %></div>
                    </div>
                    <% } %>

                    <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="email" class="form-label">Adresse email</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                <input type="email"
                                       class="form-control"
                                       id="email"
                                       name="email"
                                       placeholder="nom@exemple.com"
                                       required>
                                <div class="invalid-feedback">
                                    Veuillez saisir une adresse email valide.
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <label for="password" class="form-label">Mot de passe</label>
                                <a href="#" class="text-decoration-none small">Mot de passe oublié?</a>
                            </div>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                <input type="password"
                                       class="form-control"
                                       id="password"
                                       name="password"
                                       placeholder="Votre mot de passe"
                                       required>
                                <button class="btn btn-outline-secondary"
                                        type="button"
                                        id="togglePassword">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <div class="invalid-feedback">
                                    Veuillez saisir votre mot de passe.
                                </div>
                            </div>
                        </div>

                        <div class="mb-4 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-box-arrow-in-right me-2"></i>Se connecter
                            </button>
                        </div>
                    </form>

                    <div class="text-center mt-4">
                        <p class="mb-0">Vous n'avez pas de compte? <a href="#" class="text-decoration-none">Créer un compte</a></p>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4 text-muted small">
                <p>&copy; 2023 CRM Enterprise. Tous droits réservés.</p>
            </div>
        </div>
    </div>
</div>

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

    // Script pour afficher/masquer le mot de passe
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        const icon = this.querySelector('i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('bi-eye');
            icon.classList.add('bi-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('bi-eye-slash');
            icon.classList.add('bi-eye');
        }
    });
</script>
</body>
</html>
