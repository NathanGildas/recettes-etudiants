<header class="main-header">
    <div class="container">
        <div class="logo">
            <a href="/">
                <span class="logo-icon"><i class="fas fa-utensils"></i></span>
                <span class="logo-text">Student<span>Recipes</span></span>
            </a>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="/" class="{{ request()->is('/') ? 'active' : '' }}">Accueil</a></li>
                <li><a href="{{ route('recipes.index') }}" class="{{ request()->routeIs('recipes.*') ? 'active' : '' }}">Recettes</a></li>
                
                @guest
                <li><a href="{{ route('login') }}" class="{{ request()->routeIs('login') ? 'active' : '' }}">Connexion</a></li>
                <li><a href="{{ route('register') }}" class="{{ request()->routeIs('register') ? 'active' : '' }}">Inscription</a></li>
                @else
                <li><a href="{{ route('dashboard') }}" class="{{ request()->routeIs('dashboard') ? 'active' : '' }}">Tableau de bord</a></li>
                <li><a href="{{ route('shopping-list.index') }}" class="{{ request()->routeIs('shopping-list.*') ? 'active' : '' }}">Courses</a></li>
                <li><a href="{{ route('profile.edit') }}" class="{{ request()->routeIs('profile.*') ? 'active' : '' }}">Profil</a></li>
                
                <li>
                    <form method="POST" action="{{ route('logout') }}" class="inline">
                        @csrf
                        <button type="submit" class="nav-link bg-transparent border-0 p-0">
                            Déconnexion
                        </button>
                    </form>
                </li>
                @endguest
                
                <li><a href="{{ route('about') }}" class="{{ request()->routeIs('about') ? 'active' : '' }}">À propos</a></li>
            </ul>
        </nav>
        <div class="mobile-menu-toggle">
            <i class="fas fa-bars"></i>
        </div>
    </div>
</header>