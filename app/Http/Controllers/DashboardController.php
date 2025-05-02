<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Afficher le tableau de bord de l'utilisateur connecté.
     */
    public function index()
    {
        // Ici, tu peux récupérer les informations liées à l'utilisateur si nécessaire
        return view('dashboard');
    }
}
