<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        // Exemple : 3 recettes aléatoires
        $recipes = \App\Models\Recipe::inRandomOrder()->limit(3)->get();
        return view('home', compact('recipes'));
    }
    public function about()
    {
        return view('about'); // Assure-toi que la vue 'about.blade.php' existe bien dans resources/views
    }
}
