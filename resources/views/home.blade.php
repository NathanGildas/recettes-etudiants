@include('partials.header')

@extends('layouts.app')

@section('content')
<section class="py-12 bg-gradient-to-r from-primary to-secondary text-white">
    <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl font-bold mb-6">Bienvenue sur StudentRecipes</h1>
        <p class="text-xl mb-8">Découvrez des recettes adaptées aux étudiants</p>
        <a href="{{ route('recipes.index') }}" class="btn-primary">Explorer les recettes</a>
    </div>
</section>

<section class="py-12">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold mb-8 text-center">Recettes à découvrir</h2>
        <div class="grid md:grid-cols-3 gap-8">
            @forelse($recipes as $recipe)
            @include('partials.recipe-card', ['recipe' => $recipe])
            @empty
            <p class="text-center col-span-3">Aucune recette disponible pour le moment.</p>
            @endforelse
        </div>
    </div>
</section>

@include('partials.footer')

@endsection
