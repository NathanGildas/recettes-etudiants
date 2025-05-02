<!DOCTYPE html>
<html lang="fr"
    x-data="{ 
          darkMode: $persist(false), 
          mobileMenuOpen: false, 
          loginModalOpen: false,
          hasLoginErrors: {{ $errors->has('email') || $errors->has('password') ? 'true' : 'false' }}
      }"
    x-init="if(hasLoginErrors) loginModalOpen = true"
    :class="{ 'dark': darkMode }"
    class="scroll-smooth">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Recettes économiques et rapides pour étudiants">

    <title>{{ $title ?? 'StudentRecipes - Recettes pour étudiants' }}</title>

    <!-- Preload critical resources -->
    <link rel="preload" href="{{ asset('css/style.css') }}" as="style">
    <link rel="preload" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Montserrat:wght@700&display=swap" as="style">

    <!-- CSS -->
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Montserrat:wght@700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <link rel="alternate icon" href="/favicon.ico">

    <!-- Dark/light theme switcher -->
    <script>
        // Initialisation du thème
        function initTheme() {
            const savedTheme = localStorage.getItem('theme');
            const systemDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

            if (savedTheme === 'dark' || (!savedTheme && systemDark)) {
                document.documentElement.classList.add('dark');
                return true;
            } else {
                document.documentElement.classList.remove('dark');
                return false;
            }
        }

        // Initialise et stocke l'état initial
        const isDark = initTheme();
        document.addEventListener('alpine:init', () => {
            Alpine.store('darkMode', isDark);
        });
    </script>

    @stack('head')
</head>

<body class="bg-gray-50 dark:bg-gray-900 text-gray-900 dark:text-gray-100">
    <header class="main-header sticky top-0 z-50 bg-white dark:bg-gray-800 shadow-md">
        <div class="container mx-auto flex justify-between items-center py-4 px-4">
            <!-- Logo -->
            <a href="/" class="logo flex items-center gap-2">
                <span class="logo-icon text-2xl text-primary">
                    <i class="fas fa-utensils"></i>
                </span>
                <span class="logo-text font-bold text-xl">
                    Student<span class="text-primary">Recipes</span>
                </span>
            </a>

            <!-- Desktop Navigation -->
            <nav class="hidden md:flex items-center space-x-6">
                <x-nav-link href="/" :active="request()->is('/')">Accueil</x-nav-link>
                <x-nav-link href="/recipes" :active="request()->is('recipes*')">Recettes</x-nav-link>

                @auth
                @if(auth()->user()->is_admin)
                <x-nav-link href="{{ route('admin.recipes.add') }}" :active="request()->is('admin/recipes/add')">
                    Ajouter
                </x-nav-link>
                @endif
                <x-nav-link href="{{ route('user.dashboard') }}" :active="request()->is('user/dashboard*')">
                    Tableau de bord
                </x-nav-link>
                @else
                <button @click="loginModalOpen = true" class="text-gray-700 dark:text-gray-300 hover:text-primary dark:hover:text-primary transition">
                    Se connecter
                </button>
                @endauth

                <x-nav-link href="/shopping-list" :active="request()->is('shopping-list*')">Courses</x-nav-link>
                <x-nav-link href="/about" :active="request()->is('about')">À propos</x-nav-link>

                <!-- Dark mode toggle -->
                <button @click="
                    darkMode = !darkMode; 
                    localStorage.setItem('theme', darkMode ? 'dark' : 'light');
                    $store.darkMode = darkMode;
                " class="p-2 rounded-full hover:bg-gray-200 dark:hover:bg-gray-700 transition">
                    <i x-show="!darkMode" class="fas fa-moon"></i>
                    <i x-show="darkMode" class="fas fa-sun"></i>
                </button>
            </nav>

            <!-- Mobile menu button -->
            <button @click="mobileMenuOpen = !mobileMenuOpen" class="md:hidden p-2 text-gray-700 dark:text-gray-300">
                <i x-show="!mobileMenuOpen" class="fas fa-bars text-xl"></i>
                <i x-show="mobileMenuOpen" class="fas fa-times text-xl"></i>
            </button>
        </div>

        <!-- Mobile Navigation -->
        <div x-show="mobileMenuOpen" @click.away="mobileMenuOpen = false"
            x-transition class="md:hidden bg-white dark:bg-gray-800 shadow-lg">
            <div class="container mx-auto py-4 px-4 space-y-3">
                <x-mobile-nav-link href="/" :active="request()->is('/')">Accueil</x-mobile-nav-link>
                <x-mobile-nav-link href="/recipes" :active="request()->is('recipes*')">Recettes</x-mobile-nav-link>

                @auth
                @if(auth()->user()->is_admin)
                <x-mobile-nav-link href="{{ route('admin.recipes.add') }}" :active="request()->is('admin/recipes/add')">
                    Ajouter
                </x-mobile-nav-link>
                @endif
                <x-mobile-nav-link href="{{ route('user.dashboard') }}" :active="request()->is('user/dashboard*')">
                    Tableau de bord
                </x-mobile-nav-link>
                @else
                <button @click="loginModalOpen = true; mobileMenuOpen = false"
                    class="w-full text-left px-4 py-2 text-gray-700 dark:text-gray-300 hover:text-primary">
                    Se connecter
                </button>
                @endauth

                <x-mobile-nav-link href="/shopping-list" :active="request()->is('shopping-list*')">Courses</x-mobile-nav-link>
                <x-mobile-nav-link href="/about" :active="request()->is('about')">À propos</x-mobile-nav-link>

                <!-- Dark mode toggle mobile -->
                <button @click="
                    darkMode = !darkMode; 
                    localStorage.setItem('theme', darkMode ? 'dark' : 'light');
                    $store.darkMode = darkMode;
                " class="w-full text-left px-4 py-2 flex items-center gap-2 text-gray-700 dark:text-gray-300">
                    <i x-show="!darkMode" class="fas fa-moon"></i>
                    <i x-show="darkMode" class="fas fa-sun"></i>
                    <span>Mode sombre</span>
                </button>
            </div>
        </div>
    </header>

    <!-- Login Modal -->
    <div x-show="loginModalOpen"
        x-transition.opacity
        @keydown.escape.window="loginModalOpen = false"
        class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black bg-opacity-50">
        <div @click.away="loginModalOpen = false"
            class="w-full max-w-md bg-white dark:bg-gray-800 rounded-lg shadow-xl overflow-hidden">
            <div class="p-6">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-bold">Connexion</h2>
                    <button @click="loginModalOpen = false"
                        class="text-gray-500 hover:text-gray-700 dark:hover:text-gray-300">
                        <i class="fas fa-times"></i>
                    </button>
                </div>

                @if($errors->has('email') || $errors->has('password'))
                <div class="mb-4 p-4 bg-red-50 dark:bg-red-900/20 text-red-700 dark:text-red-300 rounded">
                    <p>Identifiants incorrects</p>
                </div>
                @endif

                <form method="POST" action="{{ route('login') }}" class="space-y-4">
                    @csrf

                    <div>
                        <label for="email" class="block mb-1 font-medium">Email</label>
                        <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent dark:bg-gray-700 dark:border-gray-600">
                    </div>

                    <div>
                        <label for="password" class="block mb-1 font-medium">Mot de passe</label>
                        <input id="password" type="password" name="password" required
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent dark:bg-gray-700 dark:border-gray-600">
                    </div>

                    <div class="flex items-center justify-between">
                        <label class="flex items-center">
                            <input type="checkbox" name="remember" class="rounded text-primary dark:bg-gray-700">
                            <span class="ml-2">Se souvenir de moi</span>
                        </label>

                        @if (Route::has('password.request'))
                        <a href="{{ route('password.request') }}" class="text-sm text-primary hover:underline">
                            Mot de passe oublié?
                        </a>
                        @endif
                    </div>

                    <button type="submit"
                        class="w-full py-2 px-4 bg-primary hover:bg-primary-dark text-white font-bold rounded-lg transition">
                        Se connecter
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <p class="text-gray-600 dark:text-gray-400">
                        Pas encore de compte?
                        <a href="{{ route('register') }}" class="text-primary font-medium hover:underline">
                            S'inscrire
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>