@extends('layouts.app')

@section('content')
<div class="py-8">
    <div class="container max-w-7xl mx-auto px-4">
        <!-- Welcome Section -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden mb-8">
            <div class="p-6 md:p-8">
                <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h1 class="text-2xl md:text-3xl font-bold text-gray-900 dark:text-white mb-2">
                            Bienvenue, {{ auth()->user()->name }} !
                        </h1>
                        <p class="text-gray-600 dark:text-gray-300">
                            Voici votre espace personnel. Retrouvez vos recettes favorites et vos dernières activités.
                        </p>
                    </div>
                    <a href="{{ route('recipes.create') }}"
                        class="btn-primary inline-flex items-center gap-2">
                        <i class="fas fa-plus"></i>
                        Ajouter une recette
                    </a>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid md:grid-cols-3 gap-6 mb-8">
            <div class="bg-blue-50 dark:bg-blue-900/20 p-6 rounded-lg">
                <div class="flex items-center gap-4">
                    <div class="p-3 bg-blue-100 dark:bg-blue-800 rounded-full">
                        <i class="fas fa-heart text-blue-600 dark:text-blue-300"></i>
                    </div>
                    <div>
                        <p class="text-sm text-gray-600 dark:text-gray-300">Favorites</p>
                        <p class="text-2xl font-bold">{{ auth()->user()->favorites->count() }}</p>
                    </div>
                </div>
            </div>

            <!-- Ajouter d'autres cartes de statistiques -->
        </div>

        <!-- Favorites Section -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
            <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                <h2 class="text-xl font-bold flex items-center gap-2">
                    <i class="fas fa-heart text-red-500"></i>
                    Vos recettes favorites
                </h2>
            </div>

            <div class="divide-y divide-gray-200 dark:divide-gray-700">
                @forelse(auth()->user()->favorites as $favorite)
                <div class="p-6 hover:bg-gray-50 dark:hover:bg-gray-700/50 transition">
                    <div class="flex flex-col md:flex-row gap-4">
                        @if($favorite->image_url)
                        <img src="{{ $favorite->image_url }}"
                            alt="{{ $favorite->title }}"
                            class="w-full md:w-32 h-24 object-cover rounded-lg"
                            loading="lazy">
                        @endif
                        <div class="flex-1">
                            <h3 class="font-bold text-lg">
                                <a href="{{ route('recipes.show', $favorite->id) }}"
                                    class="hover:text-primary transition">
                                    {{ $favorite->title }}
                                </a>
                            </h3>
                            <div class="flex flex-wrap gap-4 text-sm text-gray-600 dark:text-gray-400 mt-2">
                                <span>{{ $favorite->prep_time }} min</span>
                                <span>{{ $favorite->cost }}€</span>
                                @if($favorite->is_vegetarian)
                                <span class="text-green-600 dark:text-green-400">Végétarien</span>
                                @endif
                            </div>
                        </div>
                        <div class="flex items-center gap-2">
                            <button @click="toggleFavorite({{ $favorite->id }})"
                                class="text-red-500 hover:text-red-700 p-2">
                                <i class="fas fa-heart"></i>
                            </button>
                            <a href="{{ route('recipes.show', $favorite->id) }}"
                                class="btn-secondary btn-sm">
                                Voir
                            </a>
                        </div>
                    </div>
                </div>
                @empty
                <div class="p-6 text-center text-gray-500">
                    <p>Vous n'avez aucune recette favorite pour le moment.</p>
                    <a href="{{ route('recipes.index') }}" class="btn-primary mt-4 inline-block">
                        Explorer les recettes
                    </a>
                </div>
                @endforelse
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="mt-8">
            <h2 class="text-xl font-bold mb-4 flex items-center gap-2">
                <i class="fas fa-history"></i>
                Votre activité récente
            </h2>
            <!-- À implémenter -->
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    function toggleFavorite(recipeId) {
        axios.post('/favorites/toggle', {
                recipe_id: recipeId
            })
            .then(response => {
                if (response.data.status === 'removed') {
                    // Supprimer visuellement de la liste
                    document.querySelector(`[data-recipe="${recipeId}"]`).remove();

                    // Mettre à jour le compteur
                    const countElement = document.querySelector('.favorites-count');
                    if (countElement) {
                        const currentCount = parseInt(countElement.textContent);
                        countElement.textContent = currentCount - 1;
                    }
                }
            });
    }
</script>
@endpush