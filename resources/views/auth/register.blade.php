<x-guest-layout>
    <div class="mb-6 text-center">
        <h2 class="text-2xl font-bold text-gray-800">Créer un compte</h2>
        <p class="mt-2 text-gray-600">Rejoignez notre communauté de cuisiniers</p>
    </div>

    <form method="POST" action="{{ route('register') }}" class="space-y-6">
        @csrf

        <!-- Nom complet -->
        <div>
            <x-input-label for="name" :value="__('Nom complet')" />
            <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus autocomplete="name" />
            <x-input-error :messages="$errors->get('name')" class="mt-2" />
        </div>

        <!-- Email avec validation -->
        <div x-data="{ emailValid: null }">
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input
                id="email"
                class="block mt-1 w-full"
                x-bind:class="emailValid === null ? 'border-gray-300' : emailValid ? 'border-green-500' : 'border-red-500'"
                type="email"
                name="email"
                :value="old('email')"
                required
                autocomplete="email"
                @input="emailValid = /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test($event.target.value)" />

            <x-input-error :messages="$errors->get('email')" class="mt-2" />

            <!-- Indicateur de validité de l'email -->
            <div class="mt-1" x-show="emailValid !== null">
                <p x-show="emailValid" class="text-sm text-green-600">Email valide</p>
                <p x-show="!emailValid" class="text-sm text-red-600">Email invalide</p>
            </div>
        </div>

        <!-- Mot de passe avec indicateur de force -->
        <div x-data="{ passwordStrength: 0 }">
            <x-input-label for="password" :value="__('Mot de passe')" />
            <x-text-input
                id="password"
                class="block mt-1 w-full"
                type="password"
                name="password"
                required
                autocomplete="new-password"
                @input="
                    const value = $event.target.value;
                    passwordStrength = Math.min(4, 
                        (value.length > 7 ? 1 : 0) + 
                        (/[A-Z]/.test(value) ? 1 : 0) + 
                        (/\d/.test(value) ? 1 : 0) + 
                        (/[^A-Za-z0-9]/.test(value) ? 1 : 0)
                    );
                " />
            <div class="mt-2 flex gap-1">
                <template x-for="i in 4">
                    <div
                        class="h-1 flex-1 rounded-full"
                        :class="{
                            'bg-gray-200': passwordStrength < i,
                            'bg-red-500': passwordStrength === i && passwordStrength < 2,
                            'bg-yellow-500': passwordStrength === i && passwordStrength === 2,
                            'bg-blue-500': passwordStrength === i && passwordStrength === 3,
                            'bg-green-500': passwordStrength === i && passwordStrength === 4
                        }"></div>
                </template>
            </div>
            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Confirmation du mot de passe -->
        <div>
            <x-input-label for="password_confirmation" :value="__('Confirmer le mot de passe')" />
            <x-text-input
                id="password_confirmation"
                class="block mt-1 w-full"
                type="password"
                name="password_confirmation"
                required
                autocomplete="new-password" />
            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
        </div>

        <!-- Bouton d'inscription -->
        <div class="flex items-center justify-between mt-6">
            <a class="text-sm text-gray-600 hover:text-gray-900" href="{{ route('login') }}">
                Déjà inscrit ?
            </a>
            <x-primary-button class="ml-4">
                S'inscrire
            </x-primary-button>
        </div>
    </form>
</x-guest-layout>