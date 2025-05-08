@extends('layouts.app')

@section('content')
<main class="py-8">
    <div class="container mx-auto px-4">
        <!-- Page Header -->
        <div class="mb-12 text-center">
            <h1 class="text-3xl md:text-4xl font-bold mb-4">Toutes nos recettes</h1>
            <p class="text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
                Filtrez et découvrez des recettes adaptées à vos besoins
            </p>
        </div>

        <!-- Barre de recherche -->
        <div class="max-w-2xl mx-auto mb-8">
            <form action="{{ route('recipes.search') }}" method="GET" class="flex">
                <input 
                    type="text" 
                    name="query" 
                    placeholder="Rechercher une recette, un ingrédient..." 
                    class="flex-1 px-4 py-3 rounded-l-lg border-2 border-r-0 border-gray-300 focus:ring-2 focus:ring-primary focus:border-transparent"
                    value="{{ request('query') }}"
                >
                <button type="submit" class="bg-primary hover:bg-primary-dark text-black px-6 py-3 rounded-r-lg transition">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>

        <!-- Filters -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md p-6 mb-8">
            <form id="filter-form" class="grid md:grid-cols-4 gap-4 items-end">
                <!-- Budget Filter -->
                <div>
                    <label for="budget" class="block font-medium mb-2">Budget</label>
                    <select id="budget" name="budget" class="w-full filter-select">
                        <option value="">Tous</option>
                        <option value="low" {{ request('budget') == 'low' ? 'selected' : '' }}>Économique (moins de 5€)</option>
                        <option value="medium" {{ request('budget') == 'medium' ? 'selected' : '' }}>Moyen (5-10€)</option>
                        <option value="high" {{ request('budget') == 'high' ? 'selected' : '' }}>Élevé (plus de 10€)</option>
                    </select>
                </div>

                <!-- Time Filter -->
                <div>
                    <label for="time" class="block font-medium mb-2">Temps</label>
                    <select id="time" name="time" class="w-full filter-select">
                        <option value="">Tous</option>
                        <option value="15" {{ request('time') == '15' ? 'selected' : '' }}>Rapide (<15 min)</option>
                        <option value="30" {{ request('time') == '30' ? 'selected' : '' }}>Moyen (15-30 min)</option>
                        <option value="60" {{ request('time') == '60' ? 'selected' : '' }}>Long (>30 min)</option>
                    </select>
                </div>

                <!-- Diet Filter -->
                <div>
                    <label for="diet" class="block font-medium mb-2">Régime</label>
                    <select id="diet" name="diet" class="w-full filter-select">
                        <option value="">Tous</option>
                        <option value="vegetarian" {{ request('diet') == 'vegetarian' ? 'selected' : '' }}>Végétarien</option>
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

        <!-- Affichage des résultats de recherche -->
        @if(request('query'))
        <div class="mb-6 p-4 bg-gray-50 dark:bg-gray-700 rounded-lg">
            <p class="text-lg">
                Résultats pour : <span class="font-bold">{{ request('query') }}</span>
                <a href="{{ route('recipes.index') }}" class="text-primary hover:underline ml-2 text-sm">
                    <i class="fas fa-times"></i> Effacer la recherche
                </a>
            </p>
        </div>
        @endif

        <!-- Recipes Grid -->
        <div id="recipes-container">
            @include('recipes.partials.grid', ['recipes' => $recipes])
        </div>
    </div>
</main>
@endsection

@push('scripts')
<script>
    // Filtrage AJAX
    document.getElementById('filter-form').addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(this);
        const params = new URLSearchParams(formData).toString();
        
        // Afficher un indicateur de chargement
        const recipesContainer = document.getElementById('recipes-container');
        recipesContainer.innerHTML = '<div class="text-center py-8"><i class="fas fa-spinner fa-spin fa-2x"></i><p class="mt-2">Chargement des recettes...</p></div>';

        fetch(`/recipes/filter?${params}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'  // Pour s'assurer que le contrôleur détecte l'AJAX
            }
        })
        .then(response => response.text())
        .then(html => {
            recipesContainer.innerHTML = html;
            history.pushState(null, '', `/recipes?${params}`);
            initializeButtons();
        });
    });

    function initializeButtons() {
        // Réinitialiser les boutons d'ajout à la liste de courses
        document.querySelectorAll('.btn-add-to-list').forEach(button => {
            button.addEventListener('click', function() {
                const recipeId = this.dataset.recipeId;
                addToShoppingList(recipeId, this);
            });
        });
        
        // Réinitialiser le bouton de réinitialisation des filtres
        document.getElementById('reset-filters')?.addEventListener('click', function() {
            document.querySelectorAll('.filter-select').forEach(select => {
                select.value = '';
            });
            document.getElementById('filter-form').dispatchEvent(new Event('submit'));
        });
    }

    function addToShoppingList(recipeId, button) {
        axios.post('/shopping-list', {
                recipe_id: recipeId
            })
            .then(function(response) {
                // Feedback visuel
                const icon = button.querySelector('i');
                const originalClass = icon.className;

                icon.className = 'fas fa-check';
                button.classList.add('bg-green-500', 'text-white');

                setTimeout(function() {
                    icon.className = originalClass;
                    button.classList.remove('bg-green-500', 'text-white');
                }, 2000);
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
    }

    // Initialiser les boutons au chargement de la page
    document.addEventListener('DOMContentLoaded', function() {
        initializeButtons();
    });
</script>
@endpush