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
            'attributes' => [
                'status' => $this->status,
                'requested_tutor' => $this->requested_tutor,
                'requested_instrument' => $this->requested_instrument,
                'experience' => $this->experience,
                'funding_type' => $this->funding_type,
                'form_description' => $this->form_description
            ],
            'student' => [
                'name' => $this->student_name,
                'email' => $this->student_email,
                'phone' => $this->student_phone,
                'age' => $this->student_age,
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
            'timestamps' => [
                'created' => $this->created_at,
                'updated' => $this->updated_at,
                'deleted' => $this->deleted_at,
            ]
        ];
    }
}
