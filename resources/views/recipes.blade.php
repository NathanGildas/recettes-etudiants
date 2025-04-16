@include('partials.header')

<main>
    <section class="recipes-header">
        <div class="container">
            <h1>Toutes nos recettes</h1>
            <p>Filtrer par :</p>
            <div class="filters">
                <div class="filter-group">
                    <label for="budget">Budget</label>
                    <select id="budget">
                        <option value="all">Tous</option>
                        <option value="€">€ Économique</option>
                        <option value="€€">€€ Moyen</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="time">Temps</label>
                    <select id="time">
                        <option value="all">Tous</option>
                        <option value="15">Moins de 15 min</option>
                        <option value="30">Moins de 30 min</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="ingredients">Ingrédients</label>
                    <select id="ingredients">
                        <option value="all">Tous</option>
                        <option value="vegetarian">Végétarien</option>
                        <option value="vegan">Végan</option>
                    </select>
                </div>
                <button class="btn btn-primary">Filtrer</button>
            </div>
        </div>
    </section>

    <section class="all-recipes">
        <div class="container">
            <div class="recipes-grid">
                @foreach($recipes as $recipe)
                    <div class="recipe-card">
                        <div class="recipe-image" style="background-image: url('/images/{{ $recipe->image }}')"></div>
                        <div class="recipe-info">
                            <h3>{{ $recipe->title }}</h3>
                            <div class="recipe-meta">
                                <span><i class="fas fa-clock"></i> {{ $recipe->prepTime }} min</span>
                                <span><i class="fas fa-euro-sign"></i> {{ $recipe->budget }}</span>
                            </div>
                            <div class="recipe-ingredients">
                                <h4>Ingrédients principaux :</h4>
                                <ul>
                                    @foreach(array_slice($recipe->ingredients, 0, 3) as $ingredient)
                                        <li>{{ $ingredient }}</li>
                                    @endforeach
                                    @if(count($recipe->ingredients) > 3)
                                        <li>+{{ count($recipe->ingredients) - 3 }} autres</li>
                                    @endif
                                </ul>
                            </div>
                            <a href="/recipes/{{ $recipe->id }}" class="btn btn-small">Voir la recette</a>
                            <button class="btn btn-small btn-add-to-list" data-recipe-id="{{ $recipe->id }}">
                                <i class="fas fa-cart-plus"></i> Liste de courses
                            </button>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
</main>

@include('partials.footer')
