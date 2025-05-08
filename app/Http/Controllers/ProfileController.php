<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $user = $request->user();
        
        // Déterminer quel type de mise à jour est effectué
        $updateType = $request->has('is_vegetarian') ? 'preferences' : 'profile';
        
        // Remplir l'utilisateur avec les champs validés
        if ($updateType === 'preferences') {
            // Mise à jour des préférences culinaires
            $user->fill([
                'is_vegetarian' => $request->boolean('is_vegetarian'),
                'is_vegan' => $request->boolean('is_vegan'),
                'is_gluten_free' => $request->boolean('is_gluten_free'), 
                'is_lactose_free' => $request->boolean('is_lactose_free'),
                'skill_level' => $request->input('skill_level'),
                'budget_preference' => $request->input('budget_preference'),
                'max_prep_time' => $request->integer('max_prep_time'),
                'notify_new_recipes' => $request->boolean('notify_new_recipes'),
                'notify_weekly_meal' => $request->boolean('notify_weekly_meal'),
            ]);
            
            $statusMessage = 'preferences-updated';
        } else {
            // Mise à jour des informations de profil standard
            $user->fill($request->validated());
            
            if ($user->isDirty('email')) {
                $user->email_verified_at = null;
            }
            
            $statusMessage = 'profile-updated';
        }

        $user->save();

        return Redirect::route('profile.edit')->with('status', $statusMessage);
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
    
    /**
     * Afficher les recettes recommandées pour l'utilisateur.
     */
    public function recommendations(Request $request): View
    {
        $user = $request->user();
        $recommendedRecipes = $user->getRecommendedRecipes(6);
        
        return view('profile.recommendations', [
            'user' => $user,
            'recommendedRecipes' => $recommendedRecipes,
        ]);
    }
}