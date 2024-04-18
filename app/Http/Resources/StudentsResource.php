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
        $contacts = $this->contacts ? new StudentContactsResource($this->contacts) : [
            'id' => null,
            'student' => [
                'mobile' => null,
                'email' => null,
            ],
            'pc' => [
                'name' => null,
                'relationship' => null,
                'mobile' => null,
                'email' => null,
            ],
            'sc' => [
                'name' => null,
                'relationship' => null,
                'mobile' => null,
                'email' => null,
            ]
        ];
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
            'contacts' => $contacts,
            'school' => [
                'id' => $this->school->id,
                'name' => $this->school->name,
            ],
        ];
    }
}
