<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreLessonNoteRequest extends FormRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'lesson_id' => 'required|exists:lessons,id',
            'attendance_id' => 'nullable|exists:lesson_attendance,id',
            'user_id' => 'required|exists:users,id',
            'tutor_id' => 'required|exists:users,id',
            'date' => 'required|date',
            'time' => 'required|date_format:H:i:s',
        ];
    }
}
