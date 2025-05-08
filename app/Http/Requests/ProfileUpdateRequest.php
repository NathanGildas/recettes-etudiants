<?php

namespace App\Http\Requests;

use App\Models\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        // Si la requête concerne les préférences culinaires
        if ($this->has('is_vegetarian') || $this->has('skill_level') || $this->has('budget_preference')) {
            return [
                'is_vegetarian' => 'boolean',
                'is_vegan' => 'boolean',
                'is_gluten_free' => 'boolean',
                'is_lactose_free' => 'boolean',
                'skill_level' => ['string', Rule::in(['beginner', 'intermediate', 'advanced'])],
                'budget_preference' => ['string', Rule::in(['low', 'medium', 'high'])],
                'max_prep_time' => 'integer|min:5|max:120',
                'notify_new_recipes' => 'boolean',
                'notify_weekly_meal' => 'boolean',
            ];
        }

        // Validation par défaut pour les informations de profil
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', Rule::unique(User::class)->ignore($this->user()->id)],
        ];
    }
}