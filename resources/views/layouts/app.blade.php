<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ $pageTitle ?? config('app.name', 'Laravel') }}</title>
    <meta name="description" content="{{ $pageDescription ?? 'Application de recettes pour étudiants' }}">
    <meta property="og:title" content="{{ config('app.name', 'Laravel') }}">
    <meta property="og:type" content="website">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">

    <!-- Dark mode support -->
    <script>
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            document.documentElement.classList.add('dark')
        } else {
            document.documentElement.classList.remove('dark')
        }
    </script>

    @vite(['resources/css/app.css', 'resources/js/app.js']) <!-- ou selon ton setup -->
</head>
<body class="font-sans antialiased">
    <div class="min-h-screen bg-gray-100 dark:bg-gray-900">
        @include('layouts.navigation') <!-- si tu as une barre de navigation -->

        <!-- Page Content -->
        <main>
            @yield('content')
        </main>
    </div>
</body>
</html>
