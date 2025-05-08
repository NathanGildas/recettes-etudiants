@extends('layouts.app')

@section('content')
<main class="py-8">
    <article class="container max-w-4xl mx-auto px-4">
        <!-- Header avec boutons d'action -->
        <header class="mb-8 flex justify-between items-start">
            <div>
                <h1 class="text-3xl md:text-4xl font-bold text-gray-900 dark:text-white mb-2">{{ $recipe->title }}</h1>
                <div class="flex flex-wrap gap-4 text-sm text-gray-600 dark:text-gray-300 mb-4">
                    <span class="flex items-center gap-1">
                        <i class="fas fa-clock"></i> {{ $recipe->prep_time }} min
                    </span>
                    <span class="flex items-center gap-1">
                        <i class="fas fa-euro-sign"></i> {{ $recipe->cost }}€
                    </span>
                    @if($recipe->is_vegetarian)
                    <span class="bg-green-100 text-green-800 px-2 py-1 rounded-full text-xs">
                        Végétarien
                    </span>
                    @endif
                </div>
            </div>

            <div class="flex gap-2">
                @auth
                <!-- Bouton de favori sans attribut onclick, utiliser data-id à la place -->
                <button 
                    data-id="{{ $recipe->id }}"
                    class="p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-700 favorite-btn"
                    id="favorite-btn-{{ $recipe->id }}">
                    <i class="fas fa-heart {{ in_array($recipe->id, auth()->user()->favorites->pluck('id')->toArray()) ? 'text-red-500' : '' }}"></i>
                </button>
                @endauth
                @can('update', $recipe)
                <a href="{{ route('recipes.edit', $recipe->id) }}"
                    class="p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-700">
                    <i class="fas fa-edit"></i>
                </a>
                @endcan
            </div>
        </header>

        <!-- Image principale -->
        @if($recipe->image_url)
        <figure class="mb-8 rounded-xl overflow-hidden shadow-lg">
            <img src="{{ $recipe->image_url }}"
                alt="{{ $recipe->title }}"
                class="w-full h-64 md:h-96 object-cover"
                loading="lazy">
        </figure>
        @endif

        <!-- Description -->
        @if($recipe->description)
        <section class="prose dark:prose-invert max-w-none mb-8">
            {!! nl2br(e($recipe->description)) !!}
        </section>
        @endif

        <div class="grid md:grid-cols-2 gap-8">
            <!-- Ingrédients -->
            <section class="bg-gray-50 dark:bg-gray-800 p-6 rounded-lg">
                <h2 class="text-xl font-bold mb-4 flex items-center gap-2">
                    <i class="fas fa-shopping-basket"></i>
                    Ingrédients
                </h2>
                <ul class="space-y-2">
                    @foreach($recipe->ingredients as $ingredient)
                    <li class="flex items-start gap-2">
                        <span class="mt-1">
                            <i class="fas fa-check-circle text-green-500"></i>
                        </span>
                        <span>
                            @if(is_array($ingredient))
                                {{ $ingredient['original'] ?? '' }}
                            @else
                                {{ $ingredient }}
                            @endif
                        </span>
                    </li>
                    @endforeach
                </ul>
            </section>

            <!-- Étapes de préparation -->
            <section>
                <h2 class="text-xl font-bold mb-4 flex items-center gap-2">
                    <i class="fas fa-list-ol"></i>
                    Préparation
                </h2>
                <div class="prose dark:prose-invert max-w-none">
                    @if($recipe->steps)
                        {!! nl2br(e($recipe->steps)) !!}
                    @else
                        <p class="text-gray-500">Instructions à venir.</p>
                    @endif
                </div>
            </section>
        </div>

        <!-- Notes et commentaires -->
        <section class="mt-12">
            <h2 class="text-2xl font-bold mb-4">Commentaires</h2>
            <div id="comments" class="space-y-4">
                <!-- Système de commentaires à implémenter -->
                <p class="text-gray-500">Soyez le premier à commenter cette recette !</p>
            </div>
        </section>
    </article>
</main>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Sélectionner tous les boutons de favoris
        const favoriteButtons = document.querySelectorAll('.favorite-btn');
        
        // Ajouter un écouteur d'événements à chaque bouton
        favoriteButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                const recipeId = this.getAttribute('data-id');
                toggleFavorite(recipeId, this);
            });
        });
        
        // Fonction pour basculer le statut de favori
        function toggleFavorite(recipeId, buttonElement) {
            const heartIcon = buttonElement.querySelector('i');
            
            // Envoyer une requête AJAX pour basculer le favori
            axios.post('/favorites/toggle/' + recipeId)
                .then(function(response) {
                    if (response.data.status === 'added') {
                        heartIcon.classList.add('text-red-500');
                    } else {
                        heartIcon.classList.remove('text-red-500');
                    }
                })
                .catch(function(error) {
                    console.error('Erreur lors de la gestion des favoris:', error);
                });
        }
    });
</script>
@endpush