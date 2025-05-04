<div class="bg-white dark:bg-gray-800 rounded-lg shadow-md overflow-hidden hover:shadow-lg transition">
    <div class="h-48 overflow-hidden">
        <img src="{{ $recipe->image_url }}" alt="{{ $recipe->title }}" class="w-full h-full object-cover" loading="lazy">
    </div>
    <div class="p-4">
        <h3 class="font-bold text-lg mb-2">{{ $recipe->title }}</h3>
        <div class="flex justify-between text-sm text-gray-600 dark:text-gray-400 mb-3">
            <span>{{ $recipe->prep_time }} min</span>
            <span>{{ $recipe->cost }}€</span>
        </div>
        <a href="{{ route('recipes.show', $recipe->id) }}" class="btn-primary">Voir la recette</a>
    </div>
</div>