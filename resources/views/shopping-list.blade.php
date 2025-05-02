@include('partials.header')

<main class="py-8">
    <div class="container mx-auto px-4">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-md overflow-hidden">
            <!-- Header -->
            <div class="border-b border-gray-200 dark:border-gray-700 p-6">
                <h1 class="text-2xl font-bold flex items-center gap-2">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    Ma liste de courses
                </h1>
                <p class="text-gray-600 dark:text-gray-400 mt-2">
                    Générez automatiquement votre liste à partir de vos recettes favorites
                </p>
            </div>

            <!-- Content -->
            <div class="p-6">
                @if($shoppingList->count() > 0)
                <div class="grid md:grid-cols-2 gap-8">
                    <!-- Ingredients List -->
                    <div>
                        <h2 class="text-xl font-bold mb-4 flex items-center gap-2">
                            <i class="fas fa-list-ul"></i>
                            Ingrédients
                        </h2>

                        <ul class="space-y-3">
                            @foreach($groupedIngredients as $category => $ingredients)
                            @if($category)
                            <li class="font-bold mt-4 mb-2 text-primary">{{ $category }}</li>
                            @endif

                            @foreach($ingredients as $ingredient)
                            <li class="flex items-start gap-3">
                                <input type="checkbox" id="ingredient-{{ $loop->index }}"
                                    class="mt-1 rounded text-primary focus:ring-primary">
                                <label for="ingredient-{{ $loop->index }}" class="flex-1">
                                    {{ $ingredient['name'] }}
                                    @if($ingredient['amount'])
                                    <span class="text-sm text-gray-500 ml-2">
                                        ({{ $ingredient['amount'] }})
                                    </span>
                                    @endif
                                </label>
                                <button class="text-red-500 hover:text-red-700">
                                    <i class="fas fa-times"></i>
                                </button>
                            </li>
                            @endforeach
                            @endforeach
                        </ul>
                    </div>

                    <!-- Recipes List -->
                    <div>
                        <h2 class="text-xl font-bold mb-4 flex items-center gap-2">
                            <i class="fas fa-utensils"></i>
                            Recettes sélectionnées
                        </h2>

                        <ul class="space-y-4">
                            @foreach($shoppingList as $recipe)
                            <li class="flex gap-4 items-start border-b border-gray-100 dark:border-gray-700 pb-4">
                                <img src="{{ $recipe->image_url ?? asset('images/recipe-placeholder.webp') }}"
                                    alt="{{ $recipe->title }}"
                                    class="w-16 h-16 object-cover rounded-lg"
                                    loading="lazy">
                                <div class="flex-1">
                                    <h3 class="font-medium">{{ $recipe->title }}</h3>
                                    <div class="text-sm text-gray-600 dark:text-gray-400 mt-1">
                                        {{ $recipe->prep_time }} min • {{ $recipe->cost }}€
                                    </div>
                                </div>
                                <button class="text-red-500 hover:text-red-700 p-2"
                                    onclick="removeFromShoppingList('{{ $recipe->id }}')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

                <!-- Actions -->
                <div class="mt-8 flex flex-wrap gap-4">
                    <button class="btn-primary inline-flex items-center gap-2">
                        <i class="fas fa-print"></i>
                        Imprimer la liste
                    </button>
                    <button class="btn-secondary inline-flex items-center gap-2">
                        <i class="fas fa-share-alt"></i>
                        Partager
                    </button>
                    <button onclick="clearShoppingList()"
                        class="text-red-500 hover:text-red-700 inline-flex items-center gap-2">
                        <i class="fas fa-trash"></i>
                        Vider la liste
                    </button>
                </div>
                @else
                <div class="text-center py-12">
                    <div class="mx-auto w-24 h-24 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-shopping-basket text-3xl text-gray-400"></i>
                    </div>
                    <h3 class="text-xl font-bold mb-2">Votre liste de courses est vide</h3>
                    <p class="text-gray-600 dark:text-gray-400 mb-6">
                        Ajoutez des recettes à vos favoris pour générer automatiquement votre liste de courses
                    </p>
                    <a href="{{ route('recipes.index') }}" class="btn-primary inline-flex items-center gap-2">
                        <i class="fas fa-utensils"></i>
                        Explorer les recettes
                    </a>
                </div>
                @endif
            </div>
        </div>
    </div>
</main>

@include('partials.footer')

@push('scripts')
<script>
    function removeFromShoppingList(recipeId) {
        if (confirm('Supprimer cette recette de votre liste de courses ?')) {
            axios.delete(`/shopping-list/${recipeId}`)
                .then(response => {
                    window.location.reload();
                });
        }
    }

    function clearShoppingList() {
        if (confirm('Vider complètement votre liste de courses ?')) {
            axios.delete('/shopping-list/clear')
                .then(response => {
                    window.location.reload();
                });
        }
    }

    // Gestion des cases à cocher
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const label = this.nextElementSibling;
            if (this.checked) {
                label.classList.add('line-through', 'text-gray-400');
            } else {
                label.classList.remove('line-through', 'text-gray-400');
            }
        });
    });
</script>
@endpush