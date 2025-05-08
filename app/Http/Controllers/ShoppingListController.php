<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ShoppingListController extends Controller
{
    /**
     * Affiche la liste de courses de l'utilisateur.
     */
    public function index()
    {
        // Récupérer les recettes de la liste de courses de l'utilisateur
        $user = Auth::user();
        
        if (!$user) {
            return redirect()->route('login');
        }
        
        // Pour le moment, on utilise les favoris comme liste de courses
        // Vous pourriez créer une relation dédiée plus tard
        $shoppingList = $user->favorites()->get();
        
        // Organiser les ingrédients par catégorie
        $groupedIngredients = $this->organizeIngredients($shoppingList);
        
        return view('shopping-list', compact('shoppingList', 'groupedIngredients'));
    }

    /**
     * Ajoute une recette à la liste de courses.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'recipe_id' => 'required|exists:recipes,id',
        ]);

        $recipe = Recipe::findOrFail($validated['recipe_id']);
        
        // Pour le moment, on utilise les favoris comme liste de courses
        // Vous pourriez créer une relation dédiée plus tard
        Auth::user()->favorites()->syncWithoutDetaching([$recipe->id]);
        
        return response()->json([
            'status' => 'success',
            'message' => 'Recette ajoutée à la liste de courses',
        ]);
    }

    /**
     * Supprime une recette de la liste de courses.
     */
    public function destroy($recipeId)
    {
        // Pour le moment, on utilise les favoris comme liste de courses
        Auth::user()->favorites()->detach($recipeId);
        
        if (request()->wantsJson()) {
            return response()->json([
                'status' => 'success',
                'message' => 'Recette supprimée de la liste de courses',
            ]);
        }
        
        return redirect()->route('shopping-list.index')
            ->with('success', 'Recette supprimée de la liste de courses');
    }
    
    /**
     * Vide complètement la liste de courses.
     */
    /**
 * Vide complètement la liste de courses.
 */
public function clear()
{
    // Pour le moment, on utilise les favoris comme liste de courses
    $user = Auth::user();
    
    if (!$user) {
        return redirect()->route('login');
    }
    
    $user->favorites()->detach();
    
    if (request()->wantsJson()) {
        return response()->json([
            'status' => 'success',
            'message' => 'Liste de courses vidée',
        ]);
    }
    
    return redirect()->route('shopping-list.index')
        ->with('success', 'Votre liste de courses a été vidée');
}
    
    /**
     * Organise les ingrédients des recettes par catégories.
     * 
     * @param \Illuminate\Database\Eloquent\Collection $recipes
     * @return array
     */
    private function organizeIngredients($recipes)
    {
        $allIngredients = [];
        
        // Les catégories possibles (simplifiées)
        $categories = [
            'Fruits et légumes' => ['pomme', 'banane', 'carotte', 'tomate', 'oignon', 'ail', 'fruit', 'légume'],
            'Viandes et poissons' => ['poulet', 'boeuf', 'porc', 'poisson', 'saumon', 'thon', 'viande'],
            'Produits laitiers' => ['lait', 'fromage', 'yaourt', 'crème', 'beurre'],
            'Épicerie' => ['farine', 'sucre', 'sel', 'poivre', 'huile', 'vinaigre'],
            'Boissons' => ['eau', 'jus', 'soda', 'vin', 'bière'],
        ];
        
        // Extraire et dédupliquer les ingrédients de toutes les recettes
        foreach ($recipes as $recipe) {
            if (empty($recipe->ingredients)) {
                continue;
            }
            
            foreach ($recipe->ingredients as $ingredient) {
                // Gérer différents formats possibles d'ingrédients
                if (is_string($ingredient)) {
                    $name = $ingredient;
                    $amount = '';
                } elseif (is_array($ingredient)) {
                    $name = $ingredient['original'] ?? $ingredient['name'] ?? '';
                    $amount = $ingredient['amount'] ?? '';
                } else {
                    continue;
                }
                
                // Normaliser le nom pour éviter les doublons
                $normalized = strtolower(trim($name));
                
                // Si l'ingrédient existe déjà, on ne l'ajoute pas à nouveau
                if (isset($allIngredients[$normalized])) {
                    continue;
                }
                
                $allIngredients[$normalized] = [
                    'name' => $name,
                    'amount' => $amount,
                ];
            }
        }
        
        // Organiser les ingrédients par catégorie
        $groupedIngredients = [
            '' => [] // Catégorie par défaut
        ];
        
        foreach ($allIngredients as $normalized => $ingredient) {
            $assigned = false;
            
            // Assigner à une catégorie si possible
            foreach ($categories as $category => $keywords) {
                foreach ($keywords as $keyword) {
                    if (strpos($normalized, $keyword) !== false) {
                        if (!isset($groupedIngredients[$category])) {
                            $groupedIngredients[$category] = [];
                        }
                        $groupedIngredients[$category][] = $ingredient;
                        $assigned = true;
                        break 2;
                    }
                }
            }
            
            // Si aucune catégorie ne correspond, ajouter à la catégorie par défaut
            if (!$assigned) {
                $groupedIngredients[''][] = $ingredient;
            }
        }
        
        return $groupedIngredients;
    }
}