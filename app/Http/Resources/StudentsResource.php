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
            'year_level' => $this->year_level,
            'contacts' => new ContactsResource($this->contacts),
            'school' => [
                'id' => $this->school->id,
                'name' => $this->school->name,
            ],
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
