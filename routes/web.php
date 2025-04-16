<?php

use Illuminate\Support\Facades\Route;

Route::get('/', fn() => view('index'));
Route::get('/about', fn() => view('about'));
Route::get('/recipes', fn() => view('recipes'));
Route::get('/add-recipe', fn() => view('add-recipe'));
Route::get('/shopping-list', fn() => view('shopping-list'));
