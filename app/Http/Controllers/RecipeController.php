<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class RecipeController extends Controller
{
    public function index()
    {
        $recipes = Recipe::paginate(9);
        return view('recipes.index', compact('recipes'));
    }

    public function show(Recipe $recipe)
    {
        return view('recipes.show', compact('recipe'));
    }


    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'prepTime' => 'required|integer',
            'cost' => 'required|numeric',
            'difficulty' => 'required|string',
            'image_url' => 'nullable|string',
            'ingredients' => 'required|string',
            'description' => 'nullable|string',
            'steps' => 'nullable|string',
            'is_vegetarian' => 'boolean',
        ]);

        $ingredientsArray = array_map('trim', explode(',', $validated['ingredients']));

        Recipe::create([
            'title' => $validated['title'],
            'prep_time' => $validated['prepTime'],
            'cost' => $validated['cost'],
            'difficulty' => $validated['difficulty'],
            'image_url' => $validated['image_url'],
            'ingredients' => $ingredientsArray,
            'description' => $validated['description'] ?? null,
            'steps' => $validated['steps'] ?? null,
            'is_vegetarian' => $validated['is_vegetarian'] ?? false,
        ]);

        return redirect('/recipes')->with('success', 'Recette ajoutée avec succès !');
    }

    public function importFromSpoonacular()
    {
        $response = Http::get('https://api.spoonacular.com/recipes/random', [
            'number' => 5,
            'tags' => 'vegetarian,easy',
            'apiKey' => config('services.spoonacular.key'),
        ]);

        if ($response->successful()) {
            $data = $response->json();

            foreach ($data['recipes'] as $recipeData) {
                Recipe::create([
                    'title' => $recipeData['title'],
                    'prep_time' => $recipeData['readyInMinutes'],
                    'cost' => rand(2, 10),
                    'difficulty' => 'facile',
                    'image_url' => $this->downloadAndSaveImage($recipeData['image']),
                    'ingredients' => collect($recipeData['extendedIngredients'])->pluck('original')->toArray(),
                    'steps' => collect($recipeData['analyzedInstructions'][0]['steps'] ?? [])->pluck('step')->implode("\n"),
                    'description' => $recipeData['summary'] ?? 'Pas de description.',
                    'is_vegetarian' => $recipeData['vegetarian'] ?? false,
                ]);
            }

            return redirect('/recipes')->with('success', 'Recettes importées avec succès !');
        }

        return back()->with('error', 'Échec de l’importation depuis Spoonacular.');
    }

    public function addRecipeForm()
    {
        // Récupère les 10 dernières recettes ajoutées
        $recipes = Recipe::latest()->take(10)->get();

        // Retourne la vue 'add-recipe' avec les recettes
        return view('add-recipe', compact('recipes'));
    }

    private function downloadAndSaveImage($url)
    {
        $filename = basename($url);
        $path = public_path('images/' . $filename);

        if (!file_exists($path)) {
            $image = file_get_contents($url);
            file_put_contents($path, $image);
        }

        return 'images/' . $filename;
    }
}
