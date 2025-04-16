<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    protected $fillable = [
        'title',
        'prep_time',
        'budget',
        'image',
        'ingredients',
        'steps'
    ];

    protected $casts = [
        'ingredients' => 'array'
    ];
}
