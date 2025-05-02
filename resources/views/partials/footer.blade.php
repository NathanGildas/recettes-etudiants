<footer class="main-footer bg-gray-800 text-gray-300 py-12">
    <div class="container">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
            <!-- About Section -->
            <div class="footer-section">
                <h3 class="text-xl font-bold text-white mb-4 flex items-center gap-2">
                    <i class="fas fa-utensils text-primary"></i>
                    StudentRecipes
                </h3>
                <p class="mb-4">La plateforme de recettes rapides et économiques pour étudiants.</p>
                
                <div class="flex items-center gap-2">
                    <i class="fas fa-star text-yellow-400"></i>
                    <span>Noté 4.9/5 par nos utilisateurs</span>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="footer-section">
                <h3 class="text-xl font-bold text-white mb-4">Liens rapides</h3>
                <ul class="space-y-2">
                    <li><a href="/" class="hover:text-primary transition">Accueil</a></li>
                    <li><a href="/recipes" class="hover:text-primary transition">Recettes</a></li>
                    <li><a href="/shopping-list" class="hover:text-primary transition">Liste de courses</a></li>
                    <li><a href="/about" class="hover:text-primary transition">À propos</a></li>
                    @auth
                        @if(auth()->user()->is_admin)
                            <li>
                                <a href="{{ route('admin.recipes.add') }}" class="hover:text-primary transition">
                                    Ajouter une recette
                                </a>
                            </li>
                        @endif
                    @endauth
                </ul>
            </div>

            <!-- Contact & Newsletter -->
            <div class="footer-section">
                <h3 class="text-xl font-bold text-white mb-4">Contact</h3>
                <address class="not-italic mb-4">
                    <p class="flex items-center gap-2 mb-2">
                        <i class="fas fa-envelope text-primary"></i>
                        contact@studentrecipes.com
                    </p>
                    <p class="flex items-center gap-2">
                        <i class="fas fa-phone text-primary"></i>
                        +33 1 23 45 67 89
                    </p>
                </address>

                <h4 class="font-bold text-white mb-2">Newsletter</h4>
                <form class="flex gap-2">
                    <input type="email" placeholder="Votre email" 
                           class="flex-1 px-3 py-2 rounded text-gray-800">
                    <button type="submit" class="bg-primary hover:bg-primary-dark text-white px-4 py-2 rounded">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </form>

                <div class="social-icons mt-4 flex gap-4">
                    <a href="#" class="w-10 h-10 rounded-full bg-gray-700 hover:bg-primary flex items-center justify-center transition">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="w-10 h-10 rounded-full bg-gray-700 hover:bg-primary flex items-center justify-center transition">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="w-10 h-10 rounded-full bg-gray-700 hover:bg-primary flex items-center justify-center transition">
                        <i class="fab fa-tiktok"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="footer-bottom pt-6 border-t border-gray-700 text-center text-sm">
            <p>&copy; {{ date('Y') }} StudentRecipes. Tous droits réservés.</p>
            <div class="mt-2 flex justify-center gap-4">
                <a href="/privacy" class="hover:text-primary transition">Politique de confidentialité</a>
                <a href="/terms" class="hover:text-primary transition">Conditions d'utilisation</a>
                <a href="/cookies" class="hover:text-primary transition">Préférences cookies</a>
            </div>
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="{{ asset('js/script.js') }}" defer></script>
@stack('scripts')