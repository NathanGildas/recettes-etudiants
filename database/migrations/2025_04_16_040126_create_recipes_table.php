<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('recipes', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description');
            $table->integer('prep_time'); // en minutes
            $table->decimal('cost', 8, 2); // coût estimé
            $table->string('difficulty'); // facile/moyen/difficile
            $table->json('ingredients'); // liste des ingrédients
            $table->text('steps'); // étapes de préparation
            $table->string('image_url')->nullable();
            $table->boolean('is_vegetarian')->default(false);
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('recipes');
    }
};
