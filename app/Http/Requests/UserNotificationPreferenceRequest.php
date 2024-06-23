<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserNotificationPreferenceRequest extends FormRequest
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
            'user_id' => 'exists:users,id',
            'school_id' => 'exists:schools,id',
            'option_id' => 'exists:user_notification_options,id',
            'app' => 'sometimes|boolean',
            'email' => 'sometimes|boolean',
        ];
    }
}
