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
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'is_admin' => 'boolean',
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
}