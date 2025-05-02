<!-- Responsive Navigation Menu -->
<div :class="{ 'block': open, 'hidden': !open }" class="hidden sm:hidden">
    <div class="pt-2 pb-3 space-y-1">
        <x-mobile-nav-link :href="route('recipes.index')" :active="request()->routeIs('recipes.*')">
            Recettes
        </x-mobile-nav-link>

        <x-mobile-nav-link :href="route('shopping-list.index')" :active="request()->routeIs('shopping-list.*')">
            Liste de courses
        </x-mobile-nav-link>
    </div>

    <!-- Responsive Settings Options -->
    @auth
    <div class="pt-4 pb-1 border-t border-gray-200 dark:border-gray-700">
        <div class="px-4">
            <div class="font-medium text-base text-gray-800 dark:text-gray-200">{{ Auth::user()->name }}</div>
            <div class="font-medium text-sm text-gray-500 dark:text-gray-400">{{ Auth::user()->email }}</div>
        </div>

        <div class="mt-3 space-y-1">
            <x-mobile-nav-link :href="route('profile.edit')" :active="request()->routeIs('profile.edit')">
                Profil
            </x-mobile-nav-link>

            @if (Auth::user()->is_admin)
            <x-mobile-nav-link :href="route('admin.dashboard')" :active="request()->routeIs('admin.dashboard')">
                Administration
            </x-mobile-nav-link>
            @endif

            <!-- Déconnexion -->
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <x-mobile-nav-link
                    href="{{ route('logout') }}"
                    onclick="event.preventDefault(); this.closest('form').submit();">
                    Déconnexion
                </x-mobile-nav-link>
            </form>
        </div>
    </div>
    @endauth
</div>