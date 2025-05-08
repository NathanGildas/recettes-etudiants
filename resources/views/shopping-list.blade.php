@extends('layouts.app')

@section('content')
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
                                <input type="checkbox" id="ingredient-{{ $loop->parent->index }}-{{ $loop->index }}"
                                    class="mt-1 rounded text-primary focus:ring-primary ingredient-checkbox">
                                <label for="ingredient-{{ $loop->parent->index }}-{{ $loop->index }}" class="flex-1">
                                    {{ $ingredient['name'] }}
                                    @if(!empty($ingredient['amount']))
                                    <span class="text-sm text-gray-500 ml-2">
                                        ({{ $ingredient['amount'] }})
                                    </span>
                                    @endif
                                </label>
                                <button type="button" class="text-red-500 hover:text-red-700 ingredient-remove">
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
                                <button type="button" class="text-red-500 hover:text-red-700 p-2"
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
                    <button type="button" onclick="printShoppingList()" class="btn-primary inline-flex items-center gap-2">
                        <i class="fas fa-print"></i>
                        Imprimer la liste
                    </button>
                    <button type="button" onclick="shareShoppingList()" class="btn-secondary inline-flex items-center gap-2">
                        <i class="fas fa-share-alt"></i>
                        Partager
                    </button>
                    <button type="button" onclick="clearShoppingList()"
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
@endsection

@push('scripts')
<script>
    function removeFromShoppingList(recipeId) {
        if (confirm('Supprimer cette recette de votre liste de courses ?')) {
            axios.delete(`/shopping-list/${recipeId}`)
                .then(function(response) {
                    window.location.reload();
                })
                .catch(function(error) {
                    console.error('Erreur lors de la suppression:', error);
                    alert('Une erreur est survenue lors de la suppression de la recette.');
                });
        }
    }

    function clearShoppingList() {
        if (confirm('Vider complètement votre liste de courses ?')) {
            axios.delete('/shopping-list/clear')
                .then(function(response) {
                    window.location.reload();
                })
                .catch(function(error) {
                    console.error('Erreur lors du vidage de la liste:', error);
                    alert('Une erreur est survenue lors du vidage de la liste de courses.');
                });
        }
    }

    function printShoppingList() {
        window.print();
    }

    function shareShoppingList() {
        // Fonctionnalité à implémenter plus tard
        alert('Fonctionnalité de partage à venir prochainement!');
    }

    // Gestion des cases à cocher
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.ingredient-checkbox').forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                const label = this.nextElementSibling;
                if (this.checked) {
                    label.classList.add('line-through', 'text-gray-400');
                } else {
                    label.classList.remove('line-through', 'text-gray-400');
                }
                
                // Sauvegarder l'état dans le stockage local
                saveCheckedIngredients();
            });
        });
        
        // Charger l'état des cases à cocher depuis le stockage local
        loadCheckedIngredients();
        
        // Gestion des boutons de suppression d'ingrédient
        document.querySelectorAll('.ingredient-remove').forEach(function(button) {
            button.addEventListener('click', function() {
                const listItem = this.closest('li');
                listItem.classList.add('line-through', 'text-gray-400');
                
                // Animation de suppression
                listItem.style.transition = 'opacity 0.3s ease';
                listItem.style.opacity = '0';
                
                setTimeout(function() {
                    listItem.style.display = 'none';
                }, 300);
            });
        });
    });
    
    function saveCheckedIngredients() {
        const checkedItems = {};
        document.querySelectorAll('.ingredient-checkbox').forEach(function(checkbox) {
            checkedItems[checkbox.id] = checkbox.checked;
        });
        
        localStorage.setItem('shopping-list-checked', JSON.stringify(checkedItems));
    }
    
    function loadCheckedIngredients() {
        const checkedItems = JSON.parse(localStorage.getItem('shopping-list-checked') || '{}');
        
        for (const [id, isChecked] of Object.entries(checkedItems)) {
            const checkbox = document.getElementById(id);
            if (checkbox && isChecked) {
                checkbox.checked = true;
                const label = checkbox.nextElementSibling;
                if (label) {
                    label.classList.add('line-through', 'text-gray-400');
                }
            }
        }
    }
</script>
@endpush