@extends('layouts.app')

@section('content')
<main class="py-8">
    <div class="container mx-auto px-4">
        <div class="mb-8">
            <h1 class="text-3xl font-bold mb-2">Votre Profil</h1>
            <p class="text-gray-600 dark:text-gray-400">
                Gérez vos informations personnelles et vos préférences
            </p>
        </div>

        <div class="grid md:grid-cols-4 gap-8">
            <!-- Menu de navigation latéral -->
            <div class="md:col-span-1">
                <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden sticky top-24">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <div class="flex items-center gap-4">
                            <div class="w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-full flex items-center justify-center text-gray-400 text-2xl">
                                {{ substr($user->name, 0, 1) }}
                            </div>
                            <div>
                                <h2 class="font-bold">{{ $user->name }}</h2>
                                <p class="text-sm text-gray-600 dark:text-gray-400">{{ $user->email }}</p>
                            </div>
                        </div>
                    </div>
                    <nav class="p-4">
                        <ul class="space-y-2">
                            <li>
                                <a href="#profile-info" class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition">
                                    <i class="fas fa-user"></i>
                                    Informations personnelles
                                </a>
                            </li>
                            <li>
                                <a href="#security" class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition">
                                    <i class="fas fa-lock"></i>
                                    Sécurité
                                </a>
                            </li>
                            <li>
                                <a href="#preferences" class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition">
                                    <i class="fas fa-cog"></i>
                                    Préférences culinaires
                                </a>
                            </li>
                            <li>
                                <a href="#danger-zone" class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition text-red-500">
                                    <i class="fas fa-exclamation-triangle"></i>
                                    Suppression du compte
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

            <!-- Contenu principal -->
            <div class="md:col-span-3 space-y-8">
                <!-- Informations de profil -->
                <div id="profile-info" class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold flex items-center gap-2">
                            <i class="fas fa-user text-primary"></i>
                            Informations personnelles
                        </h2>
                    </div>
                    <div class="p-6">
                        @include('profile.partials.update-profile-information-form')
                    </div>
                </div>

                <!-- Sécurité -->
                <div id="security" class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold flex items-center gap-2">
                            <i class="fas fa-lock text-primary"></i>
                            Sécurité
                        </h2>
                    </div>
                    <div class="p-6">
                        @include('profile.partials.update-password-form')
                    </div>
                </div>

                <!-- Préférences culinaires -->
                <div id="preferences" class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold flex items-center gap-2">
                            <i class="fas fa-utensils text-primary"></i>
                            Préférences culinaires
                        </h2>
                    </div>
                    <div class="p-6">
                        @include('profile.partials.update-preferences-form')
                    </div>
                </div>

                <!-- Zone de danger -->
                <div id="danger-zone" class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold flex items-center gap-2 text-red-500">
                            <i class="fas fa-exclamation-triangle"></i>
                            Zone de danger
                        </h2>
                    </div>
                    <div class="p-6">
                        @include('profile.partials.delete-user-form')
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection

@push('scripts')
<script>
    // Smooth scroll pour les liens d'ancrage
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 100, // Offset pour la navigation fixe
                    behavior: 'smooth'
                });
                
                // Highlight de la section active
                document.querySelectorAll('nav a').forEach(a => {
                    a.classList.remove('bg-gray-100', 'dark:bg-gray-700', 'font-bold');
                });
                this.classList.add('bg-gray-100', 'dark:bg-gray-700', 'font-bold');
            }
        });
    });
    
    // Highlight initial basé sur le hash de l'URL
    document.addEventListener('DOMContentLoaded', function() {
        const hash = window.location.hash || '#profile-info';
        const activeLink = document.querySelector(`a[href="${hash}"]`);
        if (activeLink) {
            activeLink.classList.add('bg-gray-100', 'dark:bg-gray-700', 'font-bold');
            
            // Scroll to section
            const target = document.querySelector(hash);
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 100,
                    behavior: 'smooth'
                });
            }
        }
    });
</script>
@endpush