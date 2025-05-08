@extends('layouts.app')

@section('content')
<main class="py-8">
    <div class="container mx-auto px-4">
        <div class="mb-8">
            <h1 class="text-3xl font-bold mb-2">Recettes recommandées pour vous</h1>
            <p class="text-gray-600 dark:text-gray-400">
                Basées sur vos préférences culinaires et vos goûts
            </p>
        </div>
        
        @if($recommendedRecipes->isEmpty())
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md p-8 text-center">
                <div class="mx-auto w-24 h-24 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-utensils text-3xl text-gray-400"></i>
                </div>
                <h3 class="text-xl font-bold mb-2">Pas encore de recommandations</h3>
                <p class="text-gray-600 dark:text-gray-400 mb-6 max-w-md mx-auto">
                    Complétez vos préférences culinaires dans votre profil pour recevoir des recommandations personnalisées.
                </p>
                <a href="{{ route('profile.edit') }}#preferences" class="btn-primary inline-flex items-center gap-2">
                    <i class="fas fa-cog"></i>
                    Configurer mes préférences
                </a>
            </div>
        @else
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                @foreach($recommendedRecipes as $recipe)
                    <article class="recipe-card bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
                        <div class="h-48 overflow-hidden relative">
                            <img src="{{ $recipe->image_url ?? asset('images/recipe-placeholder.webp') }}"
                                alt="{{ $recipe->title }}"
                                class="w-full h-full object-cover"
                                loading="lazy">
                            <div class="absolute top-2 right-2">
                                <button 
                                    data-id="{{ $recipe->id }}"
                                    class="p-2 bg-white dark:bg-gray-800 rounded-full shadow favorite-btn"
                                    title="Ajouter aux favoris">
                                    <i class="fas fa-heart text-gray-400"></i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="p-6">
                            <div class="mb-2 flex flex-wrap gap-2">
                                @if($recipe->is_vegetarian)
                                    <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full">
                                        Végétarien
                                    </span>
                                @endif
                                
                                @if($recipe->prep_time <= 15)
                                    <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full">
                                        Rapide
                                    </span>
                                @endif
                                
                                @if($recipe->cost < 5)
                                    <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded-full">
                                        Économique
                                    </span>
                                @endif
                            </div>
                            
                            <h3 class="font-bold text-xl mb-2">
                                <a href="{{ route('recipes.show', $recipe->id) }}" class="hover:text-primary">
                                    {{ $recipe->title }}
                                </a>
                            </h3>
                            
                            <div class="flex justify-between text-sm text-gray-600 dark:text-gray-400 mb-3">
                                <span class="flex items-center gap-1">
                                    <i class="fas fa-clock"></i> {{ $recipe->prep_time }} min
                                </span>
                                <span class="flex items-center gap-1">
                                    <i class="fas fa-euro-sign"></i> {{ $recipe->cost }}€
                                </span>
                            </div>
                            
                            <p class="text-gray-700 dark:text-gray-300 mb-4">
                                {{ Str::limit(strip_tags($recipe->description), 100) }}
                            </p>
                            
                            <div class="flex justify-between items-center mt-4">
                                <a href="{{ route('recipes.show', $recipe->id) }}" class="btn-primary">
                                    Voir la recette
                                </a>
                                
                                <button 
                                    class="btn-add-to-list p-2 bg-gray-100 dark:bg-gray-700 rounded-full hover:bg-primary hover:text-white transition-colors"
                                    data-recipe-id="{{ $recipe->id }}"
                                    title="Ajouter à ma liste de courses">
                                    <i class="fas fa-shopping-basket"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                @endforeach
            </div>
            
            <div class="mt-12 text-center">
                <a href="{{ route('recipes.index') }}" class="btn-secondary inline-flex items-center gap-2">
                    <i class="fas fa-search"></i>
                    Explorer toutes les recettes
                </a>
            </div>
        @endif
    </div>
</main>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Gestion des favoris
        document.querySelectorAll('.favorite-btn').forEach(function(button) {
            button.addEventListener('click', function() {
                const recipeId = this.dataset.id;
                const heartIcon = this.querySelector('i');
                
                axios.post(`/favorites/toggle/${recipeId}`)
                    .then(function(response) {
                        if (response.data.status === 'added') {
                            heartIcon.classList.remove('text-gray-400');
                            heartIcon.classList.add('text-red-500');
                        } else {
                            heartIcon.classList.remove('text-red-500');
                            heartIcon.classList.add('text-gray-400');
                        }
                    })
                    .catch(function(error) {
                        console.error('Erreur de favoris:', error);
                    });
            });
        });
        
        // Gestion de la liste de courses
        document.querySelectorAll('.btn-add-to-list').forEach(function(button) {
            button.addEventListener('click', function() {
                const recipeId = this.dataset.recipeId;
                
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
                    console.error('Erreur liste courses:', error);
                });
            });
        });
    });
</script>
@endpush