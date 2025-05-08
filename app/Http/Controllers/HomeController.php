<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        // Récupérer 3 recettes populaires (vous pourriez ajouter un critère comme le nombre de favoris)
        $recipes = Recipe::inRandomOrder()->limit(3)->get();
        return view('home', compact('recipes')); // Utilisez index.blade.php au lieu de home.blade.php
    }
    public function about()
    {
        return view('about'); // Assure-toi que la vue 'about.blade.php' existe bien dans resources/views
    }
}
