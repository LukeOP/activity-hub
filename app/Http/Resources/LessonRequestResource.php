<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LessonRequestResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'student' => [
                'name' => $this->student_name,
                'year' => $this->student_year,
            ],
            'parent' => [
                'name' => $this->parent_name,
                'phone' => $this->parent_phone,
                'email' => $this->parent_email,
            ],
            'school' => [
                'id' => $this->school->id,
                'name' => $this->school->name
            ],
            'status' => $this->status,
            'created_at' => $this->created_at,
            'requested_tutor' => $this->requested_tutor,
            'requested_instrument' => $this->requested_instrument,
            'experience' => $this->experience,
            'funding_type' => $this->funding_type,
            'option_music' => $this->option_music,
        ];
    }
}
