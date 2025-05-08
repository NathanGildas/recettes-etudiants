<x-guest-layout>
    @auth
    <div class="welcome-message text-center p-6 bg-green-50 rounded-lg">
        <p class="text-lg font-semibold">Bienvenue, {{ Auth::user()->name }} !</p>
        <a href="{{ route('dashboard') }}" class="btn-primary mt-4 inline-block">
            Accéder au tableau de bord
        </a>
    </div>
    @else
    <div x-data="{ showLogin: true }" class="login-container py-8">
        <div class="w-full max-w-md mx-auto">
            <div class="login-form p-6">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Connexion</h2>
                </div>

                <form method="POST" action="{{ route('login') }}">
                    @csrf

                    <!-- Email Address -->
                    <div class="mb-4">
                        <x-input-label for="email" value="Email" />
                        <x-text-input id="email" class="block mt-1 w-full input-style" 
                            type="email" name="email" :value="old('email')" required autofocus />
                        <x-input-error :messages="$errors->get('email')" class="mt-2 x-input-error" />
                    </div>

                    <!-- Password -->
                    <div class="mb-4">
                        <x-input-label for="password" value="Mot de passe" />
                        <x-text-input id="password" class="block mt-1 w-full input-style"
                            type="password" name="password" required />
                        <x-input-error :messages="$errors->get('password')" class="mt-2 x-input-error" />
                    </div>

                    <!-- Remember Me -->
                    <div class="block mb-4">
                        <label for="remember_me" class="inline-flex items-center">
                            <input id="remember_me" type="checkbox" class="rounded dark:bg-gray-900 border-gray-300 dark:border-gray-700 text-primary focus:ring-primary dark:focus:ring-primary dark:focus:ring-offset-gray-800 shadow-sm" name="remember">
                            <span class="ml-2 text-sm text-gray-600 dark:text-gray-400">Se souvenir de moi</span>
                        </label>
                    </div>

                    <div class="flex items-center justify-between mb-4">
                        @if (Route::has('password.request'))
                        <a class="text-sm text-primary hover:text-primary-dark" href="{{ route('password.request') }}">
                            Mot de passe oublié?
                        </a>
                        @endif

                        <x-primary-button class="btn-primary">
                            Se connecter
                        </x-primary-button>
                    </div>
                </form>

                <div class="mt-6 pt-4 border-t border-gray-200">
                    <p class="text-center text-sm text-gray-600">
                        Pas encore de compte ?
                        <a href="{{ route('register') }}" class="font-medium text-primary hover:text-primary-dark">
                            S'inscrire
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    @endauth
</x-guest-layout>