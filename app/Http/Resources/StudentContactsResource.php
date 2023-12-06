<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StudentContactsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id" => $this->id,
            'student' => [
                'mobile' => $this->student_mobile,
                'email' => $this->student_email,
            ],
            'pc' => [
                'name' => $this->pc_name,
                'relationship' => $this->pc_relationship,
                'mobile' => $this->pc_mobile,
                'email' => $this->pc_email,
            ],
            'sc' => [
                'name' => $this->sc_name,
                'relationship' => $this->sc_relationship,
                'mobile' => $this->sc_mobile,
                'email' => $this->sc_email,
            ]
        ];
    }
}
