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
        Schema::table('users', function (Blueprint $table) {
            // Préférences alimentaires
            $table->boolean('is_vegetarian')->default(false);
            $table->boolean('is_vegan')->default(false);
            $table->boolean('is_gluten_free')->default(false);
            $table->boolean('is_lactose_free')->default(false);
            
            // Niveau de compétence
            $table->string('skill_level')->default('beginner'); // beginner, intermediate, advanced
            
            // Préférences de budget
            $table->string('budget_preference')->default('low'); // low, medium, high
            
            // Temps de préparation maximum (en minutes)
            $table->integer('max_prep_time')->default(30);
            
            // Préférences de notification
            $table->boolean('notify_new_recipes')->default(true);
            $table->boolean('notify_weekly_meal')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn([
                'is_vegetarian',
                'is_vegan',
                'is_gluten_free',
                'is_lactose_free',
                'skill_level',
                'budget_preference',
                'max_prep_time',
                'notify_new_recipes',
                'notify_weekly_meal',
            ]);
        });
    }
};