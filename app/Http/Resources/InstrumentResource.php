<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InstrumentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this['id'],
            'attributes' => [
                'name' => $this['name'],
                'type' => $this['type'],
                'family' => $this['family'],
                'notes' => $this['notes'],
                'fee' => $this['fee'],
                'state' => $this->state($this->state_id)
            ],
            'school' => $this->school($this->school_id),
            'timestamp' => [
                'created_at' => $this['created_at'],
                'updated_at' => $this['updated_at'],
                'deleted_at' => $this['deleted_at'],
            ],
        ];
    }
}
