<?php

namespace App\Console\Commands;

use App\Models\Recipe;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Log;

class ImportRecipesFromSpoonacular extends Command
{
    protected $signature = 'import:recipes 
                            {--number=10 : Number of recipes to import}
                            {--type= : Recipe type (main course, dessert, etc.)}';

    protected $description = 'Import random recipes from Spoonacular API';

    public function handle()
    {
        $apiKey = env('SPOONACULAR_API_KEY');
        $number = $this->option('number');
        $type = $this->option('type');

        if (empty($apiKey)) {
            $this->error('SPOONACULAR_API_KEY is not set in .env');
            return;
        }

        $this->info("Fetching $number random recipes...");

        try {
            $params = [
                'apiKey' => $apiKey,
                'number' => $number,
            ];

            if (!empty($type)) {
                $params['type'] = $type;
            }

            $response = Http::get('https://api.spoonacular.com/recipes/random', $params);

            if ($response->successful()) {
                $recipes = $response->json()['recipes'];
                $importedCount = 0;

                foreach ($recipes as $recipeData) {
                    try {
                        $recipe = $this->transformRecipeData($recipeData);
                        
                        if (!$this->recipeExists($recipe['spoonacular_id'])) {
                            Recipe::create($recipe);
                            $importedCount++;
                            $this->info("Imported: {$recipe['title']}");
                        } else {
                            $this->warn("Skipped (already exists): {$recipe['title']}");
                        }
                    } catch (\Exception $e) {
                        Log::error("Error processing recipe: " . $e->getMessage());
                        $this->error("Error with recipe {$recipeData['id']}: " . $e->getMessage());
                    }
                }

                $this->newLine();
                $this->info("Successfully imported $importedCount/$number recipes!");
            } else {
                $this->error('API request failed: ' . $response->status());
                $this->line('Response: ' . $response->body());
            }
        } catch (\Exception $e) {
            $this->error('Error: ' . $e->getMessage());
            Log::error('Import failed: ' . $e->getMessage());
        }
    }

    protected function recipeExists($spoonacularId)
    {
        if (!Schema::hasColumn('recipes', 'spoonacular_id')) {
            return false;
        }
        
        return Recipe::where('spoonacular_id', $spoonacularId)->exists();
    }

    protected function transformRecipeData(array $apiData): array
    {
        return [
            'title' => $apiData['title'] ?? 'No title',
            'description' => $this->cleanDescription($apiData['summary'] ?? ''),
            'prep_time' => $apiData['readyInMinutes'] ?? 0,
            'cost' => round(($apiData['pricePerServing'] ?? 0) / 100, 2),
            'difficulty' => $this->determineDifficulty($apiData['readyInMinutes'] ?? 0),
            'ingredients' => $this->extractIngredients($apiData['extendedIngredients'] ?? []),
            'steps' => $this->extractInstructions($apiData['analyzedInstructions'] ?? []),
            'image_url' => $apiData['image'] ?? null,
            'is_vegetarian' => $apiData['vegetarian'] ?? false,
            'is_vegan' => $apiData['vegan'] ?? false,
            'servings' => $apiData['servings'] ?? 1,
            'spoonacular_id' => $apiData['id'] ?? null,
        ];
    }

    protected function cleanDescription(string $summary): string
    {
        return mb_substr(strip_tags($summary), 0, 500);
    }

    protected function determineDifficulty(int $cookingTime): string
    {
        return match (true) {
            $cookingTime <= 15 => 'facile',
            $cookingTime <= 30 => 'moyen',
            default => 'difficile',
        };
    }

    protected function extractIngredients(array $ingredients): array
    {
        return array_map(function ($ingredient) {
            return [
                'id' => $ingredient['id'] ?? null,
                'name' => $ingredient['name'] ?? 'Unknown',
                'amount' => $ingredient['amount'] ?? 0,
                'unit' => $ingredient['unit'] ?? '',
                'original' => $ingredient['original'] ?? '',
            ];
        }, $ingredients);
    }

    protected function extractInstructions(array $instructions): string
    {
        if (empty($instructions)) {
            return 'Instructions not available';
        }

        $steps = [];
        foreach (($instructions[0]['steps'] ?? []) as $step) {
            $steps[] = "Étape {$step['number']}: {$step['step']}";
        }

        return implode("\n\n", $steps);
    }
}