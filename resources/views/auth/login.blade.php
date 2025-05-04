<x-guest-layout>
    @auth
    <div class="welcome-message text-center p-6 bg-green-50 rounded-lg">
        <p class="text-lg font-semibold">Bienvenue, {{ Auth::user()->name }} !</p>
        <a href="{{ route('dashboard') }}" class="btn-primary mt-4 inline-block">
            Accéder au tableau de bord
        </a>
    </div>
    @else
    <!-- Modal amélioré avec AlpineJS -->
    <div x-data="{ showLogin: false }" class="text-center">
        <button @click="showLogin = true" class="btn-primary">
            Se connecter
        </button>

        <!-- Modal -->
        <div x-show="showLogin"
            x-transition:enter="transition ease-out duration-300"
            x-transition:enter-start="opacity-0"
            x-transition:enter-end="opacity-100"
            x-transition:leave="transition ease-in duration-200"
            x-transition:leave-start="opacity-100"
            x-transition:leave-end="opacity-0"
            class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black bg-opacity-50"
            @click.away="showLogin = false">
            <div class="w-full max-w-md bg-white rounded-lg shadow-xl overflow-hidden">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h2 class="text-2xl font-bold text-gray-800">Connexion</h2>
                        <button @click="showLogin = false" class="text-gray-500 hover:text-gray-700">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </button>
                    </div>

                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <!-- Reste du formulaire inchangé -->
                    </form>
                </div>

                <div class="px-6 py-4 bg-gray-50 border-t border-gray-200">
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