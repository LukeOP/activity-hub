<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StudentsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => (string)$this->id,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'full_name' => $this->first_name . " " . $this->last_name,
            'year_level' => (string)$this->year_level,
            'tutor_group' => $this->tutor_group,
            'age' => $this->getAge($this->date_of_birth),
            'date_of_birth' => $this->date_of_birth,
            'identifier' => $this->identifier,
            'enrolled_status' => $this->enrolled_status,
            'contacts' => new StudentContactsResource($this->contacts),
            'school' => [
                'id' => $this->school->id,
                'name' => $this->school->name,
            ],
        ];
    }
}
