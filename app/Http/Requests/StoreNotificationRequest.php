<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreNotificationRequest extends FormRequest
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
            'recipient' => 'required|string',
            'user_id' => 'sometimes|exists:users,id',
            'school_id' => 'sometimes|exists:schools,id',
            'icon' => 'sometimes|string',
            'header' => 'string|max:100',
            'details' => 'string',
            'route' => 'sometimes|string|max:255',
            'dataType' => 'sometimes|string|max:255',
            'dataId' => 'sometimes|string|max:36',
        ];
    }
}
