<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateEventRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'sometimes|string|max:50',
            'school_id' => 'sometimes|exists:schools,id',
            'description' => 'sometimes|string|max:255',
            'location' => 'sometimes|string|max:50',
            'date' => 'sometimes|date',
            'time' => 'sometimes|date_format:H:i',
        ];
    }
}
