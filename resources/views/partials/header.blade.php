<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title ?? 'StudentRecipes' }}</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<header class="main-header">
    <div class="container">
        <div class="logo">
            <a href="/">
                <span class="logo-icon"><i class="fas fa-utensils"></i></span>
                <span class="logo-text">Student<span>Recipes</span></span>
            </a>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="/" class="{{ request()->is('/') ? 'active' : '' }}">Accueil</a></li>
                <li><a href="/recipes" class="{{ request()->is('recipes') ? 'active' : '' }}">Recettes</a></li>
                <li><a href="/add-recipe" class="{{ request()->is('add-recipe') ? 'active' : '' }}">Ajouter</a></li>
                <li><a href="/shopping-list" class="{{ request()->is('shopping-list') ? 'active' : '' }}">Courses</a></li>
                <li><a href="/about" class="{{ request()->is('about') ? 'active' : '' }}">À propos</a></li>
            </ul>
        </nav>
        <div class="mobile-menu-toggle">
            <i class="fas fa-bars"></i>
        </div>
    </div>
</header>
