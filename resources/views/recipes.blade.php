@include('partials.header')

<main class="py-8">
    <div class="container mx-auto px-4">
        <!-- Page Header -->
        <div class="mb-12 text-center">
            <h1 class="text-3xl md:text-4xl font-bold mb-4">Toutes nos recettes</h1>
            <p class="text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
                Filtrez et découvrez des recettes adaptées à vos besoins
            </p>
        </div>

        <!-- Filters -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md p-6 mb-8">
            <form id="filter-form" class="grid md:grid-cols-4 gap-4 items-end">
                <!-- Budget Filter -->
                <div>
                    <label for="budget" class="block font-medium mb-2">Budget</label>
                    <select id="budget" name="budget" class="w-full filter-select">
                        <option value="">Tous</option>
                        <option value="low">Économique (moins de 5€)</option>
                        <option value="medium">Moyen (5-10€)</option>
                        <option value="high">Élevé (plus de 10€)</option>
                    </select>
                </div>

                <!-- Time Filter -->
                <div>
                    <label for="time" class="block font-medium mb-2">Temps</label>
                    <select id="time" name="time" class="w-full filter-select">
                        <option value="">Tous</option>
                        <option value="15">Rapide (<15 min)</option>
                        <option value="30">Moyen (15-30 min)</option>
                        <option value="60">Long (>30 min)</option>
                    </select>
                </div>

                <!-- Diet Filter -->
                <div>
                    <label for="diet" class="block font-medium mb-2">Régime</label>
                    <select id="diet" name="diet" class="w-full filter-select">
                        <option value="">Tous</option>
                        <option value="vegetarian">Végétarien</option>
                        <option value="vegan">Végan</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div>
                    <button type="submit" class="btn-primary w-full">
                        <i class="fas fa-filter mr-2"></i> Filtrer
                    </button>
                </div>
            </form>
        </div>

        <!-- Recipes Grid -->
        <div id="recipes-container">
            @if($recipes->count() > 0)
                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                    @foreach($recipes as $recipe)
                        <article class="recipe-card bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden hover:shadow-lg transition">
                            <div class="h-48 overflow-hidden">
                                <img src="{{ $recipe->image_url ?? asset('images/recipe-placeholder.webp') }}" 
                                     alt="{{ $recipe->title }}" 
                                     class="w-full h-full object-cover"
                                     loading="lazy">
                            </div>
                            <div class="p-6">
                                <h3 class="font-bold text-xl mb-2">{{ $recipe->title }}</h3>
                                
                                <div class="flex justify-between text-sm text-gray-600 dark:text-gray-400 mb-3">
                                    <span class="flex items-center gap-1">
                                        <i class="fas fa-clock"></i> {{ $recipe->prep_time }} min
                                    </span>
                                    <span class="flex items-center gap-1">
                                        <i class="fas fa-euro-sign"></i> {{ $recipe->cost }}€
                                    </span>
                                </div>

                                @if($recipe->is_vegetarian)
                                    <span class="inline-block bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full mb-3">
                                        Végétarien
                                    </span>
                                @endif

                                <div class="mb-4">
                                    <h4 class="font-medium mb-1">Ingrédients principaux :</h4>
                                    <div class="flex flex-wrap gap-2">
                                        @foreach(array_slice($recipe->ingredients, 0, 3) as $ingredient)
                                            <span class="bg-gray-100 dark:bg-gray-700 text-xs px-2 py-1 rounded">
                                                {{ is_array($ingredient) ? $ingredient['name'] : $ingredient }}
                                            </span>
                                        @endforeach
                                        @if(count($recipe->ingredients) > 3)
                                            <span class="bg-gray-100 dark:bg-gray-700 text-xs px-2 py-1 rounded">
                                                +{{ count($recipe->ingredients) - 3 }} autres
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="flex gap-2">
                                    <a href="{{ route('recipes.show', $recipe) }}" 
                                       class="btn-primary flex-1 text-center">
                                        Voir la recette
                                    </a>
                                    <button class="btn-add-to-list p-2 rounded-lg bg-gray-100 dark:bg-gray-700 hover:bg-primary hover:text-white"
                                            data-recipe-id="{{ $recipe->id }}"
                                            title="Ajouter à la liste de courses">
                                        <i class="fas fa-cart-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </article>
                    @endforeach
                </div>

                <!-- Pagination -->
                <div class="mt-8">
                    {{ $recipes->links() }}
                </div>
            @else
                <div class="text-center py-12 bg-gray-100 dark:bg-gray-700 rounded-lg">
                    <p class="text-gray-600 dark:text-gray-300">Aucune recette ne correspond à vos critères.</p>
                    <button id="reset-filters" class="btn-secondary mt-4 inline-flex items-center gap-2">
                        <i class="fas fa-undo"></i> Réinitialiser les filtres
                    </button>
                </div>
            @endif
        </div>
    </div>
</main>

@include('partials.footer')

@push('scripts')
<script>
    // Filtrage AJAX
    document.getElementById('filter-form').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this);
        const params = new URLSearchParams(formData).toString();
        
        fetch(`/recipes/filter?${params}`)
            .then(response => response.text())
            .then(html => {
                document.getElementById('recipes-container').innerHTML = html;
                history.pushState(null, '', `?${params}`);
            });
    });

    // Réinitialisation des filtres
    document.getElementById('reset-filters')?.addEventListener('click', function() {
        document.querySelectorAll('.filter-select').forEach(select => {
            select.value = '';
        });
        document.getElementById('filter-form').dispatchEvent(new Event('submit'));
    });

    // Gestion des favoris et liste de courses
    document.querySelectorAll('.btn-add-to-list').forEach(button => {
        button.addEventListener('click', function() {
            const recipeId = this.dataset.recipeId;
            addToShoppingList(recipeId, this);
        });
    });

    function addToShoppingList(recipeId, button) {
        axios.post('/shopping-list', { recipe_id: recipeId })
            .then(response => {
                // Feedback visuel
                const icon = button.querySelector('i');
                const originalClass = icon.className;
                
                icon.className = 'fas fa-check';
                button.classList.add('bg-green-500', 'text-white');
                
                setTimeout(() => {
                    icon.className = originalClass;
                    button.classList.remove('bg-green-500', 'text-white');
                }, 2000);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>
@endpush