<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'password',
        'is_admin',
        // Préférences culinaires
        'is_vegetarian',
        'is_vegan',
        'is_gluten_free',
        'is_lactose_free',
        'skill_level',
        'budget_preference',
        'max_prep_time',
        'notify_new_recipes',
        'notify_weekly_meal',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'is_admin' => 'boolean',
        'is_vegetarian' => 'boolean',
        'is_vegan' => 'boolean',
        'is_gluten_free' => 'boolean',
        'is_lactose_free' => 'boolean',
        'notify_new_recipes' => 'boolean',
        'notify_weekly_meal' => 'boolean',
    ];

    /**
     * Les recettes favorites de l'utilisateur
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function favorites(): BelongsToMany
    {
        return $this->belongsToMany(Recipe::class, 'favorites', 'user_id', 'recipe_id')
            ->withTimestamps();
    }
    
    /**
     * Les recettes dans la liste de courses de l'utilisateur
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function shoppingList(): BelongsToMany
    {
        // Pour l'instant, on réutilise la table des favoris
        // Vous pourriez plus tard créer une table distincte 'shopping_lists'
        return $this->belongsToMany(Recipe::class, 'favorites', 'user_id', 'recipe_id')
            ->withTimestamps();
    }
    
    /**
     * Détermine si les recettes correspondent aux préférences alimentaires de l'utilisateur
     * 
     * @param Recipe $recipe
     * @return bool
     */
    public function recipeMatchesDietaryPreferences(Recipe $recipe): bool
    {
        // Si l'utilisateur est végétarien et la recette ne l'est pas
        if ($this->is_vegetarian && !$recipe->is_vegetarian) {
            return false;
        }
        
        // Ajouter d'autres vérifications pour les préférences alimentaires
        // quand les colonnes seront ajoutées au modèle Recipe
        
        return true;
    }
    
    /**
     * Vérifie si une recette correspond aux préférences générales de l'utilisateur
     * 
     * @param Recipe $recipe
     * @return bool
     */
    public function recipeMatchesPreferences(Recipe $recipe): bool
    {
        // Vérifier les préférences alimentaires
        if (!$this->recipeMatchesDietaryPreferences($recipe)) {
            return false;
        }
        
        // Vérifier le temps de préparation maximum
        if ($this->max_prep_time && $recipe->prep_time > $this->max_prep_time) {
            return false;
        }
        
        // Vérifier le budget
        if ($this->budget_preference == 'low' && $recipe->cost > 5) {
            return false;
        }
        if ($this->budget_preference == 'medium' && $recipe->cost > 10) {
            return false;
        }
        
        return true;
    }
    
    /**
     * Obtient des recettes recommandées selon les préférences
     * 
     * @param int $limit
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getRecommendedRecipes($limit = 5)
    {
        // Base de la requête
        $query = Recipe::query();
        
        // Filtrer par régime alimentaire
        if ($this->is_vegetarian) {
            $query->where('is_vegetarian', true);
        }
        
        // Filtrer par temps de préparation
        if ($this->max_prep_time) {
            $query->where('prep_time', '<=', $this->max_prep_time);
        }
        
        // Filtrer par budget
        if ($this->budget_preference == 'low') {
            $query->where('cost', '<', 5);
        } elseif ($this->budget_preference == 'medium') {
            $query->whereBetween('cost', [5, 10]);
        }
        
        // Exclure les recettes déjà dans les favoris
        $favoriteIds = $this->favorites()->pluck('recipes.id')->toArray();
        if (!empty($favoriteIds)) {
            $query->whereNotIn('id', $favoriteIds);
        }
        
        // Récupérer des recettes aléatoires correspondant aux critères
        return $query->inRandomOrder()->limit($limit)->get();
    }
}