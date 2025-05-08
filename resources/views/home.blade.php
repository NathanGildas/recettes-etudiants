@extends('layouts.app')

@section('content')
<main>
    <!-- Hero Section -->
    <section class="relative bg-gradient-to-r from-primary to-primary-dark text-white py-20 overflow-hidden">
        <div class="container mx-auto px-4 flex flex-col md:flex-row items-center">
            <div class="md:w-1/2 mb-10 md:mb-0">
                <h1 class="text-4xl md:text-5xl font-bold mb-6 leading-tight">
                    Des recettes rapides et économiques pour étudiants
                </h1>
                <p class="text-xl mb-8 opacity-90">
                    Découvrez des repas adaptés à votre budget et votre emploi du temps chargé.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a href="{{ route('recipes.index') }}" class="btn-primary inline-flex items-center gap-2">
                        Explorer les recettes
                        <i class="fas fa-arrow-right"></i>
                    </a>
                    @auth
                    @if(auth()->user()->is_admin)
                    <a href="{{ route('admin.recipes.create') }}" class="btn-secondary">
                        Ajouter une recette
                    </a>
                    @endif
                    @endauth
                </div>
            </div>
            <div class="md:w-1/2 flex justify-center">
                <img src="{{ asset('images/hero-image.webp') }}"
                    alt="Nourriture pour étudiants"
                    class="max-w-md w-full rounded-lg shadow-2xl"
                    width="600" height="400"
                    loading="eager">
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-16 bg-gray-50 dark:bg-gray-800">
        <div class="container mx-auto px-4">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-bold mb-4">Pourquoi choisir StudentRecipes?</h2>
                <div class="w-24 h-1 bg-primary mx-auto"></div>
            </div>

            <div class="grid md:grid-cols-3 gap-8">
                <!-- Feature Card 1 -->
                <div class="bg-white dark:bg-gray-700 p-8 rounded-xl shadow-md hover:shadow-lg transition duration-300">
                    <div class="text-primary text-4xl mb-4">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Rapide</h3>
                    <p class="text-gray-600 dark:text-gray-300">
                        Recettes préparées en moins de 30 minutes pour s'adapter à votre emploi du temps.
                    </p>
                </div>

                <!-- Feature Card 2 -->
                <div class="bg-white dark:bg-gray-700 p-8 rounded-xl shadow-md hover:shadow-lg transition duration-300">
                    <div class="text-primary text-4xl mb-4">
                        <i class="fas fa-euro-sign"></i>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Économique</h3>
                    <p class="text-gray-600 dark:text-gray-300">
                        Des repas délicieux à petit prix, spécialement conçus pour un budget étudiant.
                    </p>
                </div>

                <!-- Feature Card 3 -->
                <div class="bg-white dark:bg-gray-700 p-8 rounded-xl shadow-md hover:shadow-lg transition duration-300">
                    <div class="text-primary text-4xl mb-4">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Équilibré</h3>
                    <p class="text-gray-600 dark:text-gray-300">
                        Des repas variés et nutritifs pour maintenir une alimentation saine.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Recipes -->
    <section class="py-16">
        <div class="container mx-auto px-4">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-bold mb-4">Recettes populaires</h2>
                <p class="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
                    Découvrez les recettes les plus appréciées par notre communauté étudiante
                </p>
            </div>

            @if($recipes->count() > 0)
            <div class="grid md:grid-cols-3 gap-8 mb-12">
                @foreach($recipes->take(3) as $recipe)
                <article class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden hover:shadow-lg transition">
                    <div class="h-48 overflow-hidden">
                        <img src="{{ $recipe->image_url ?? asset('images/recipe-placeholder.webp') }}"
                            alt="{{ $recipe->title }}"
                            class="w-full h-full object-cover"
                            loading="lazy">
                    </div>
                    <div class="p-6">
                        <h3 class="font-bold text-xl mb-2">{{ $recipe->title }}</h3>
                        <div class="flex justify-between text-sm text-gray-600 dark:text-gray-400 mb-4">
                            <span class="flex items-center gap-1">
                                <i class="fas fa-clock"></i> {{ $recipe->prep_time }} min
                            </span>
                            <span class="flex items-center gap-1">
                                <i class="fas fa-euro-sign"></i> {{ $recipe->cost }}€
                            </span>
                        </div>
                        <a href="{{ route('recipes.show', $recipe) }}" class="btn-primary inline-block w-full text-center">
                            Voir la recette
                        </a>
                    </div>
                </article>
                @endforeach
            </div>

            <div class="text-center">
                <a href="{{ route('recipes.index') }}" class="btn-secondary inline-flex items-center gap-2">
                    Voir toutes les recettes
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            @else
            <div class="text-center py-12 bg-gray-100 dark:bg-gray-700 rounded-lg">
                <p class="text-gray-600 dark:text-gray-300">Aucune recette disponible pour le moment.</p>
                @auth
                @if(auth()->user()->is_admin)
                <a href="{{ route('admin.recipes.create') }}" class="btn-primary mt-4 inline-block">
                    Ajouter une recette
                </a>
                @endif
                @endauth
            </div>
            @endif
        </div>
    </section>
</main>
@endsection