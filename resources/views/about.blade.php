@extends('layouts.app')

@section('content')
<section class="py-16 bg-gradient-to-r from-primary/10 to-secondary/10">
    <div class="container max-w-4xl mx-auto px-4">
        <div class="text-center mb-12">
            <h1 class="text-4xl font-bold text-gray-900 dark:text-white mb-4">À propos de StudentRecipes</h1>
            <div class="w-24 h-1 bg-primary mx-auto"></div>
        </div>

        <div class="grid md:grid-cols-2 gap-8 items-center">
            <div class="prose dark:prose-invert max-w-none">
                <p class="text-lg">StudentRecipes est une plateforme collaborative créée pour aider les étudiants à cuisiner des plats rapides, économiques et équilibrés.</p>

                <h2>Notre mission</h2>
                <p>Rendre la cuisine accessible à tous les étudiants, quel que soit leur budget ou leur niveau culinaire.</p>

                <h2>Nos valeurs</h2>
                <ul>
                    <li>Accessibilité financière</li>
                    <li>Simplicité des recettes</li>
                    <li>Communauté bienveillante</li>
                    <li>Qualité nutritionnelle</li>
                </ul>
            </div>

            <div class="relative">
                <img src="{{ asset('images/about.jpg') }}"
                    alt="Étudiants cuisinant ensemble"
                    class="rounded-xl shadow-xl w-full"
                    loading="lazy">
                <div class="absolute -bottom-4 -right-4 bg-primary text-white p-4 rounded-lg shadow-lg">
                    <p class="font-bold">+500 recettes</p>
                    <p class="text-sm">disponibles</p>
                </div>
            </div>
        </div>

        <div class="mt-16 text-center">
            <h2 class="text-2xl font-bold mb-6">Rencontrez notre équipe</h2>
            <div class="grid sm:grid-cols-3 gap-8">
                <!-- Membre d'équipe -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
                    <div class="w-24 h-24 mx-auto mb-4 rounded-full bg-gray-200 overflow-hidden">
                        <img src="{{ asset('images/team1.jpg') }}" alt="Jean Dupont" class="w-full h-full object-cover">
                    </div>
                    <h3 class="font-bold">Jean Dupont</h3>
                    <p class="text-sm text-gray-600 dark:text-gray-400">Fondateur</p>
                </div>
                <!-- Ajouter d'autres membres -->
            </div>
        </div>
    </div>
</section>
@endsection