<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ShoppingListController;
use App\Http\Controllers\FavoriteController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/

Route::controller(HomeController::class)->group(function () {
    Route::get('/', 'index')->name('home');
    Route::get('/about', 'about')->name('about');
});

Route::controller(RecipeController::class)->group(function () {
    Route::get('/recipes', 'index')->name('recipes.index');
    Route::get('/recipes/{recipe}', 'show')->name('recipes.show');
});

/*
|--------------------------------------------------------------------------
| Authentication Routes
|--------------------------------------------------------------------------
*/
require __DIR__ . '/auth.php';

Route::get('/login', [AuthenticatedSessionController::class, 'create'])
    ->middleware('guest')
    ->name('login');


/*
|--------------------------------------------------------------------------
| Authenticated User Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth'])->group(function () {
    // Dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Favorites
    Route::controller(FavoriteController::class)->prefix('favorites')->group(function () {
        Route::post('/', 'store')->name('favorites.store');
        Route::delete('/{recipe}', 'destroy')->name('favorites.destroy');
    });

    // Shopping List
    Route::controller(ShoppingListController::class)->prefix('shopping-list')->group(function () {
        Route::get('/', 'index')->name('shopping-list.index');
        Route::post('/', 'store')->name('shopping-list.store');
        Route::delete('/{recipe}', 'destroy')->name('shopping-list.destroy');
        Route::delete('/', 'clear')->name('shopping-list.clear');
    });
});

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'is_admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::controller(RecipeController::class)->prefix('recipes')->name('recipes.')->group(function () {
        Route::get('/create', 'create')->name('create');
        Route::post('/', 'store')->name('store');
        Route::get('/import', 'importForm')->name('import.form');
        Route::post('/import', 'importFromSpoonacular')->name('import');
    });
});
