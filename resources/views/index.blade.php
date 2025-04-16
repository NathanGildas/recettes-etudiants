@include('partials.header')

<main>
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h1>Des recettes rapides et économiques pour étudiants</h1>
                <p>Trouvez des idées de repas adaptées à votre budget et votre emploi du temps chargé.</p>
                <div class="hero-buttons">
                    <a href="/recipes" class="btn btn-primary">Voir les recettes</a>
                    <a href="/add-recipe" class="btn btn-secondary">Ajouter une recette</a>
                </div>
            </div>
            <div class="hero-image">
                <img src="/images/hero-image.png" alt="Nourriture pour étudiants">
            </div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <h2 class="section-title">Pourquoi choisir StudentRecipes?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3>Rapide</h3>
                    <p>Recettes préparées en moins de 30 minutes pour s'adapter à votre emploi du temps.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-euro-sign"></i>
                    </div>
                    <h3>Économique</h3>
                    <p>Des repas délicieux à petit prix, spécialement conçus pour un budget étudiant.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Équilibré</h3>
                    <p>Des repas variés et nutritifs pour maintenir une alimentation saine.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="popular-recipes">
        <div class="container">
            <h2 class="section-title">Recettes populaires</h2>

            <div class="recipes-grid">
                @if(isset($recipes) && count($recipes) > 0)
                    @foreach($recipes->take(3) as $recipe)
                        <div class="recipe-card">
                            <div class="recipe-image" style="background-image: url('/images/{{ $recipe->image }}')"></div>
                            <div class="recipe-info">
                                <h3>{{ $recipe->title }}</h3>
                                <div class="recipe-meta">
                                    <span><i class="fas fa-clock"></i> {{ $recipe->prepTime }} min</span>
                                    <span><i class="fas fa-euro-sign"></i> {{ $recipe->budget }}</span>
                                </div>
                                <a href="/recipes/{{ $recipe->id }}" class="btn btn-small">Voir la recette</a>
                            </div>
                        </div>
                    @endforeach
                @else
                    <p>Aucune recette disponible pour le moment.</p>
                @endif
            </div>

            <div class="section-cta">
                <a href="/recipes" class="btn btn-primary">Voir toutes les recettes</a>
            </div>
        </div>
    </section>
</main>

@include('partials.footer')
