<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $featuredRecipes = Recipe::where('is_featured', true)->take(3)->get();
        return view('home', compact('featuredRecipes'));
    }
    public function about()
    {
        return view('about'); // Assure-toi que la vue 'about.blade.php' existe bien dans resources/views
    }
}
