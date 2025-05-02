@include('partials.header')

<main class="py-8">
    <div class="container max-w-4xl mx-auto px-4">
        <h1 class="text-3xl font-bold mb-6">Ajouter une recette</h1>

        <!-- Notifications -->
        @if(session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6">
            {{ session('success') }}
        </div>
        @endif

        <!-- Import Spoonacular -->
        @if(auth()->user()->is_admin)
        <div class="mb-8 p-4 bg-blue-50 rounded-lg">
            <h2 class="text-xl font-bold mb-2">Importer des recettes</h2>
            <a href="{{ route('admin.recipes.import') }}"
                class="inline-flex items-center gap-2 bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                <i class="fas fa-cloud-download-alt"></i>
                Importer depuis Spoonacular
            </a>
        </div>
        @endif

        <!-- Formulaire -->
        <form action="{{ route('admin.recipes.store') }}" method="POST" class="space-y-6" enctype="multipart/form-data">
            @csrf

            <div class="grid md:grid-cols-2 gap-6">
                <!-- Colonne gauche -->
                <div class="space-y-6">
                    <!-- Titre -->
                    <div>
                        <label for="title" class="block font-medium mb-1">Nom de la recette *</label>
                        <input type="text" id="title" name="title" required
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent">
                    </div>

                    <!-- Image -->
                    <div>
                        <label for="image" class="block font-medium mb-1">Image *</label>
                        <input type="file" id="image" name="image" accept="image/*"
                            class="w-full px-4 py-2 border rounded-lg file:mr-4 file:py-2 file:px-4 file:border-0 file:bg-gray-100 file:hover:bg-gray-200">
                    </div>

                    <!-- Temps et budget -->
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="prepTime" class="block font-medium mb-1">Temps (min) *</label>
                            <input type="number" id="prepTime" name="prep_time" min="1" required
                                class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent">
                        </div>
                        <div>
                            <label for="cost" class="block font-medium mb-1">Coût (€) *</label>
                            <input type="number" id="cost" name="cost" min="0" step="0.1" required
                                class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent">
                        </div>
                    </div>
                </div>

                <!-- Colonne droite -->
                <div class="space-y-6">
                    <!-- Type -->
                    <div>
                        <label for="type" class="block font-medium mb-1">Type</label>
                        <select id="type" name="is_vegetarian"
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent">
                            <option value="0">Standard</option>
                            <option value="1">Végétarien</option>
                        </select>
                    </div>

                    <!-- Difficulté -->
                    <div>
                        <label for="difficulty" class="block font-medium mb-1">Difficulté</label>
                        <select id="difficulty" name="difficulty"
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent">
                            <option value="facile">Facile</option>
                            <option value="moyen">Moyen</option>
                            <option value="difficile">Difficile</option>
                        </select>
                    </div>

                    <!-- Description -->
                    <div>
                        <label for="description" class="block font-medium mb-1">Description</label>
                        <textarea id="description" name="description" rows="3"
                            class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"></textarea>
                    </div>
                </div>
            </div>

            <!-- Ingrédients -->
            <div>
                <label for="ingredients" class="block font-medium mb-1">Ingrédients *</label>
                <div id="ingredients-container" class="space-y-2 mb-2">
                    <!-- Ingrédients dynamiques seront ajoutés ici -->
                </div>
                <div class="flex gap-2">
                    <input type="text" id="ingredient-input" placeholder="Ajouter un ingrédient"
                        class="flex-1 px-4 py-2 border rounded-lg">
                    <button type="button" id="add-ingredient"
                        class="bg-gray-200 hover:bg-gray-300 px-4 py-2 rounded-lg">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
                <input type="hidden" id="ingredients" name="ingredients">
            </div>

            <!-- Étapes -->
            <div>
                <label for="steps" class="block font-medium mb-1">Étapes de préparation *</label>
                <textarea id="steps" name="steps" rows="6" required
                    class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"></textarea>
            </div>

            <!-- Bouton de soumission -->
            <div class="flex justify-end">
                <button type="submit"
                    class="bg-primary hover:bg-primary-dark text-white font-bold py-3 px-6 rounded-lg transition">
                    Publier la recette
                </button>
            </div>
        </form>

        <!-- Recettes récentes -->
        <section class="mt-16">
            <h2 class="text-2xl font-bold mb-6">Recettes importées récemment</h2>

            @if($recipes->isEmpty())
            <div class="bg-gray-100 dark:bg-gray-800 p-8 rounded-lg text-center">
                <p class="text-gray-500">Aucune recette importée pour l'instant.</p>
            </div>
            @else
            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                @foreach($recipes as $recipe)
                <article class="bg-white dark:bg-gray-800 rounded-lg shadow-md overflow-hidden">
                    @if($recipe->image_url)
                    <img src="{{ $recipe->image_url }}"
                        alt="{{ $recipe->title }}"
                        class="w-full h-48 object-cover"
                        loading="lazy">
                    @endif
                    <div class="p-4">
                        <h3 class="font-bold text-lg mb-2">{{ $recipe->title }}</h3>
                        <div class="flex justify-between text-sm text-gray-600 dark:text-gray-400 mb-3">
                            <span>{{ $recipe->prep_time }} min</span>
                            <span>{{ $recipe->cost }}€</span>
                        </div>
                        <a href="{{ route('recipes.show', $recipe) }}"
                            class="inline-block text-primary hover:text-primary-dark font-medium">
                            Voir la recette →
                        </a>
                    </div>
                </article>
                @endforeach
            </div>
            @endif
        </section>
    </div>
</main>

@include('partials.footer')

@push('scripts')
<script>
    // Gestion des ingrédients dynamiques
    const ingredientsContainer = document.getElementById('ingredients-container');
    const ingredientInput = document.getElementById('ingredient-input');
    const addIngredientBtn = document.getElementById('add-ingredient');
    const hiddenIngredients = document.getElementById('ingredients');
    let ingredients = [];

    function addIngredient() {
        const value = ingredientInput.value.trim();
        if (value) {
            ingredients.push(value);
            updateIngredientsDisplay();
            ingredientInput.value = '';
        }
    }

    function updateIngredientsDisplay() {
        ingredientsContainer.innerHTML = '';
        ingredients.forEach((ing, index) => {
            const div = document.createElement('div');
            div.className = 'flex items-center gap-2 bg-gray-100 dark:bg-gray-700 p-2 rounded';
            div.innerHTML = `
                <span>${ing}</span>
                <button type="button" onclick="removeIngredient(${index})" 
                        class="ml-auto text-red-500 hover:text-red-700">
                    <i class="fas fa-times"></i>
                </button>
            `;
            ingredientsContainer.appendChild(div);
        });
        hiddenIngredients.value = JSON.stringify(ingredients);
    }

    function removeIngredient(index) {
        ingredients.splice(index, 1);
        updateIngredientsDisplay();
    }

    addIngredientBtn.addEventListener('click', addIngredient);
    ingredientInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            addIngredient();
        }
    });
</script>
@endpush