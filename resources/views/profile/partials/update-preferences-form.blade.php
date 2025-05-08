<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100">
            {{ __('Préférences culinaires') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __("Personnalisez votre expérience en nous informant de vos préférences alimentaires.") }}
        </p>
    </header>

    <form method="post" action="{{ route('profile.update') }}" class="mt-6 space-y-6">
        @csrf
        @method('patch')

        <!-- Régime alimentaire -->
        <div>
            <h3 class="font-medium mb-2">Régime alimentaire</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex items-center space-x-3">
                    <input type="checkbox" id="is_vegetarian" name="is_vegetarian" class="rounded text-primary focus:ring-primary" {{ old('is_vegetarian', $user->is_vegetarian ?? false) ? 'checked' : '' }}>
                    <label for="is_vegetarian" class="flex items-center gap-2">
                        <span class="bg-green-100 text-green-800 p-1 rounded-full">
                            <i class="fas fa-leaf text-xs"></i>
                        </span>
                        Végétarien
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="checkbox" id="is_vegan" name="is_vegan" class="rounded text-primary focus:ring-primary" {{ old('is_vegan', $user->is_vegan ?? false) ? 'checked' : '' }}>
                    <label for="is_vegan" class="flex items-center gap-2">
                        <span class="bg-green-100 text-green-800 p-1 rounded-full">
                            <i class="fas fa-seedling text-xs"></i>
                        </span>
                        Vegan
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="checkbox" id="is_gluten_free" name="is_gluten_free" class="rounded text-primary focus:ring-primary" {{ old('is_gluten_free', $user->is_gluten_free ?? false) ? 'checked' : '' }}>
                    <label for="is_gluten_free" class="flex items-center gap-2">
                        <span class="bg-yellow-100 text-yellow-800 p-1 rounded-full">
                            <i class="fas fa-wheat-awn-circle-exclamation text-xs"></i>
                        </span>
                        Sans gluten
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="checkbox" id="is_lactose_free" name="is_lactose_free" class="rounded text-primary focus:ring-primary" {{ old('is_lactose_free', $user->is_lactose_free ?? false) ? 'checked' : '' }}>
                    <label for="is_lactose_free" class="flex items-center gap-2">
                        <span class="bg-blue-100 text-blue-800 p-1 rounded-full">
                            <i class="fas fa-cheese text-xs"></i>
                        </span>
                        Sans lactose
                    </label>
                </div>
            </div>
        </div>

        <!-- Niveau de préparation -->
        <div>
            <h3 class="font-medium mb-2">Niveau de préparation préféré</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="flex items-center space-x-3">
                    <input type="radio" id="skill_level_beginner" name="skill_level" value="beginner" class="text-primary focus:ring-primary" {{ old('skill_level', $user->skill_level ?? 'beginner') == 'beginner' ? 'checked' : '' }}>
                    <label for="skill_level_beginner" class="flex items-center gap-2">
                        <span class="bg-green-100 text-green-800 p-1 rounded-full">
                            <i class="fas fa-star text-xs"></i>
                        </span>
                        Débutant
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="radio" id="skill_level_intermediate" name="skill_level" value="intermediate" class="text-primary focus:ring-primary" {{ old('skill_level', $user->skill_level ?? '') == 'intermediate' ? 'checked' : '' }}>
                    <label for="skill_level_intermediate" class="flex items-center gap-2">
                        <span class="bg-yellow-100 text-yellow-800 p-1 rounded-full">
                            <i class="fas fa-star text-xs"></i>
                        </span>
                        Intermédiaire
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="radio" id="skill_level_advanced" name="skill_level" value="advanced" class="text-primary focus:ring-primary" {{ old('skill_level', $user->skill_level ?? '') == 'advanced' ? 'checked' : '' }}>
                    <label for="skill_level_advanced" class="flex items-center gap-2">
                        <span class="bg-red-100 text-red-800 p-1 rounded-full">
                            <i class="fas fa-star text-xs"></i>
                        </span>
                        Avancé
                    </label>
                </div>
            </div>
        </div>

        <!-- Budget -->
        <div>
            <h3 class="font-medium mb-2">Budget par repas</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="flex items-center space-x-3">
                    <input type="radio" id="budget_low" name="budget_preference" value="low" class="text-primary focus:ring-primary" {{ old('budget_preference', $user->budget_preference ?? 'low') == 'low' ? 'checked' : '' }}>
                    <label for="budget_low" class="flex items-center gap-2">
                        <span class="bg-green-100 text-green-800 p-1 rounded-full">
                            <i class="fas fa-euro-sign text-xs"></i>
                        </span>
                        Économique
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="radio" id="budget_medium" name="budget_preference" value="medium" class="text-primary focus:ring-primary" {{ old('budget_preference', $user->budget_preference ?? '') == 'medium' ? 'checked' : '' }}>
                    <label for="budget_medium" class="flex items-center gap-2">
                        <span class="bg-yellow-100 text-yellow-800 p-1 rounded-full">
                            <i class="fas fa-euro-sign text-xs"></i>
                        </span>
                        Modéré
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="radio" id="budget_high" name="budget_preference" value="high" class="text-primary focus:ring-primary" {{ old('budget_preference', $user->budget_preference ?? '') == 'high' ? 'checked' : '' }}>
                    <label for="budget_high" class="flex items-center gap-2">
                        <span class="bg-red-100 text-red-800 p-1 rounded-full">
                            <i class="fas fa-euro-sign text-xs"></i>
                        </span>
                        Premium
                    </label>
                </div>
            </div>
        </div>

        <!-- Temps de préparation -->
        <div>
            <h3 class="font-medium mb-2">Temps de préparation max</h3>
            <div class="flex items-center gap-4">
                <input type="range" id="max_prep_time" name="max_prep_time" min="5" max="60" step="5" class="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer dark:bg-gray-700" value="{{ old('max_prep_time', $user->max_prep_time ?? 30) }}">
                <span id="prep_time_value" class="text-gray-700 dark:text-gray-300 font-medium min-w-[4rem] text-center">{{ old('max_prep_time', $user->max_prep_time ?? 30) }} min</span>
            </div>
        </div>

        <!-- Notifications -->
        <div>
            <h3 class="font-medium mb-2">Notifications</h3>
            <div class="space-y-3">
                <div class="flex items-center space-x-3">
                    <input type="checkbox" id="notify_new_recipes" name="notify_new_recipes" class="rounded text-primary focus:ring-primary" {{ old('notify_new_recipes', $user->notify_new_recipes ?? true) ? 'checked' : '' }}>
                    <label for="notify_new_recipes">
                        Nouvelles recettes correspondant à mes préférences
                    </label>
                </div>
                
                <div class="flex items-center space-x-3">
                    <input type="checkbox" id="notify_weekly_meal" name="notify_weekly_meal" class="rounded text-primary focus:ring-primary" {{ old('notify_weekly_meal', $user->notify_weekly_meal ?? false) ? 'checked' : '' }}>
                    <label for="notify_weekly_meal">
                        Suggestions de repas hebdomadaires
                    </label>
                </div>
            </div>
        </div>

        <div class="flex items-center gap-4">
            <button type="submit" class="btn-primary">{{ __('Enregistrer') }}</button>

            @if (session('status') === 'preferences-updated')
                <p
                    x-data="{ show: true }"
                    x-show="show"
                    x-transition
                    x-init="setTimeout(() => show = false, 2000)"
                    class="text-sm text-gray-600 dark:text-gray-400"
                >{{ __('Préférences enregistrées.') }}</p>
            @endif
        </div>
    </form>
</section>

<script>
    // Mettre à jour la valeur affichée du temps de préparation
    document.addEventListener('DOMContentLoaded', function() {
        const slider = document.getElementById('max_prep_time');
        const output = document.getElementById('prep_time_value');
        
        slider.oninput = function() {
            output.textContent = this.value + ' min';
        }
    });
</script>