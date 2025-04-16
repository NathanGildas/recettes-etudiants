<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class RecipeController extends Controller
{
    public function index()
    {
        $recipes = Recipe::all();
        return view('recipes', compact('recipes'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'prepTime' => 'required|integer',
            'budget' => 'required|string|max:10',
            'image' => 'nullable|string',
            'ingredients' => 'required|string',
        ]);

        $ingredientsArray = array_map('trim', explode(',', $validated['ingredients']));

        Recipe::create([
            'title' => $validated['title'],
            'prep_time' => $validated['prepTime'],
            'budget' => $validated['budget'],
            'image' => $validated['image'],
            'ingredients' => $ingredientsArray,
        ]);

        return redirect('/recipes')->with('success', 'Recette ajoutée avec succès !');
    }
}

