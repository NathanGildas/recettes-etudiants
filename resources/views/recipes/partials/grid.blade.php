@if($recipes->count() > 0)
<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
    @foreach($recipes as $recipe)
    <article class="recipe-card bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden hover:shadow-lg transition">
        <div class="h-48 overflow-hidden">
            <img src="{{ $recipe->image_url ?? asset('images/recipe-placeholder.webp') }}"
                alt="{{ $recipe->title }}"
                class="w-full h-full object-cover"
                loading="lazy">
        </div>
        <div class="p-6">
            <h3 class="font-bold text-xl mb-2">{{ $recipe->title }}</h3>

            <div class="flex justify-between text-sm text-gray-600 dark:text-gray-400 mb-3">
                <span class="flex items-center gap-1">
                    <i class="fas fa-clock"></i> {{ $recipe->prep_time }} min
                </span>
                <span class="flex items-center gap-1">
                    <i class="fas fa-euro-sign"></i> {{ $recipe->cost }}€
                </span>
            </div>

            @if($recipe->is_vegetarian)
            <span class="inline-block bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full mb-3">
                Végétarien
            </span>
            @endif

            <div class="mb-4">
                <h4 class="font-medium mb-1">Ingrédients principaux :</h4>
                <div class="flex flex-wrap gap-2">
                    @foreach(array_slice($recipe->ingredients, 0, 3) as $ingredient)
                    <span class="bg-gray-100 dark:bg-gray-700 text-xs px-2 py-1 rounded">
                        {{ is_array($ingredient) ? $ingredient['name'] : $ingredient }}
                    </span>
                    @endforeach
                    @if(count($recipe->ingredients) > 3)
                    <span class="bg-gray-100 dark:bg-gray-700 text-xs px-2 py-1 rounded">
                        +{{ count($recipe->ingredients) - 3 }} autres
                    </span>
                    @endif
                </div>
            </div>

            <div class="flex gap-2">
                <a href="{{ route('recipes.show', $recipe) }}"
                    class="btn-primary flex-1 text-center">
                    Voir la recette
                </a>
                <button class="btn-add-to-list p-2 rounded-lg bg-gray-100 dark:bg-gray-700 hover:bg-primary hover:text-white"
                    data-recipe-id="{{ $recipe->id }}"
                    title="Ajouter à la liste de courses">
                    <i class="fas fa-cart-plus"></i>
                </button>
            </div>
        </div>
    </article>
    @endforeach
</div>

<!-- Pagination -->
<div class="mt-8">
    {{ $recipes->appends(request()->query())->links() }}
</div>
@else
<div class="text-center py-12 bg-gray-100 dark:bg-gray-700 rounded-lg">
    <p class="text-gray-600 dark:text-gray-300">Aucune recette ne correspond à vos critères.</p>
    <button id="reset-filters" class="btn-secondary mt-4 inline-flex items-center gap-2">
        <i class="fas fa-undo"></i> Réinitialiser les filtres
    </button>
</div>
@endif