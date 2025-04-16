<footer class="main-footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>StudentRecipes</h3>
                <p>La plateforme de recettes rapides et économiques pour étudiants.</p>
            </div>
            <div class="footer-section">
                <h3>Liens rapides</h3>
                <ul>
                    <li><a href="/">Accueil</a></li>
                    <li><a href="/recipes">Recettes</a></li>
                    <li><a href="/add-recipe">Ajouter une recette</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact</h3>
                <p><i class="fas fa-envelope"></i> contact@studentrecipes.com</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; {{ date('Y') }} StudentRecipes. Tous droits réservés.</p>
        </div>
    </div>
</footer>
<script src="{{ asset('js/script.js') }}"></script>
