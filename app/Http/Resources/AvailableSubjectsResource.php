<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AvailableSubjectsResource extends JsonResource
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
            'school_id' => $this->school_id,
            'tutor' => [
                'id' => $this->tutor->id,
                'full_name' => $this->tutor->first_name . ' ' . $this->tutor->last_name,
            ],
            'subject' => $this->subject,
            'signup_enabled' => $this->signup_enabled
        ];
    }
}
