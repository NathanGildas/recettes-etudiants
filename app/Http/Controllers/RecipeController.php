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

        return back()->with('error', 'Échec de l\'importation depuis Spoonacular.');
    }

    /**
     * Filtrer les recettes (AJAX)
     */
    public function filter(Request $request)
    {
        $query = Recipe::query();
        
        // Filtrer par budget
        if ($request->has('budget') && !empty($request->budget)) {
            switch ($request->budget) {
                case 'low':
                    $query->where('cost', '<', 5);
                    break;
                case 'medium':
                    $query->whereBetween('cost', [5, 10]);
                    break;
                case 'high':
                    $query->where('cost', '>', 10);
                    break;
            }
        }
        
        // Filtrer par temps de préparation
        if ($request->has('time') && !empty($request->time)) {
            $time = (int) $request->time;
            
            if ($time == 15) {
                $query->where('prep_time', '<', 15);
            } elseif ($time == 30) {
                $query->whereBetween('prep_time', [15, 30]);
            } elseif ($time == 60) {
                $query->where('prep_time', '>', 30);
            }
        }
        
        // Filtrer par régime alimentaire
        if ($request->has('diet') && !empty($request->diet)) {
            if ($request->diet == 'vegetarian') {
                $query->where('is_vegetarian', true);
            }
        }
        
        $recipes = $query->paginate(9);
        
        // Pour les requêtes AJAX, retourner uniquement le HTML partiel
        if ($request->ajax() || $request->header('X-Requested-With') === 'XMLHttpRequest') {
            return view('recipes.partials.grid', compact('recipes'))->render();
        }
        
        // Pour les requêtes normales, retourner la vue complète
        return view('recipes.index', compact('recipes'));
    }
    
    public function search(Request $request)
    {
        $query = $request->input('query');
        
        // Si aucun terme de recherche n'est fourni, rediriger vers l'index des recettes
        if (empty($query)) {
            return redirect()->route('recipes.index');
        }
        
        // Rechercher dans le titre et les ingrédients
        $recipes = Recipe::where('title', 'like', "%{$query}%")
            ->orWhere(function($q) use ($query) {
                // Recherche dans le tableau JSON des ingrédients
                // Cette implémentation peut varier selon la structure exacte de votre base de données
                $q->whereJsonContains('ingredients', $query);
            })
            ->paginate(9);
        
        // Passer le terme de recherche à la vue
        return view('recipes.index', compact('recipes'));
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