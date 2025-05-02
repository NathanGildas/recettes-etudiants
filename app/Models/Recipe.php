<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    use HasFactory;

    protected $fillable = [
        'spoonacular_id',
        'title',
        'description',
        'prep_time',
        'cost',
        'difficulty',
        'ingredients',
        'steps',
        'image_url',
        'is_vegetarian',
    ];

    protected $casts = [
        'ingredients' => 'array',  // Pour gérer les ingrédients comme un tableau JSON
    ];

    /**
     * Relation avec le modèle User pour les favoris
     */
    public function usersFavorited()
    {
        return $this->belongsToMany(User::class, 'favorites');
    }
}
