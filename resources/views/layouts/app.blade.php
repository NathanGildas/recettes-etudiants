<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ $pageTitle ?? config('app.name', 'StudentRecipes') }}</title>
    <meta name="description" content="{{ $pageDescription ?? 'Application de recettes pour étudiants' }}">
    <meta property="og:title" content="{{ config('app.name', 'StudentRecipes') }}">
    <meta property="og:type" content="website">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    
    <!-- Scripts -->
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <!-- Dark mode support -->
    <script>
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            document.documentElement.classList.add('dark')
        } else {
            document.documentElement.classList.remove('dark')
        }
    </script>
</head>
<body class="font-sans antialiased bg-gray-100 dark:bg-gray-900 min-h-screen">
    @include('partials.header')

    <main>
        @yield('content')
    </main>

    @include('partials.footer')

    <!-- Scripts supplémentaires -->
    <script src="{{ asset('js/script.js') }}" defer></script>
    @stack('scripts')
</body>
</html>