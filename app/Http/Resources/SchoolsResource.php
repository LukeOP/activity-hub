<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SchoolsResource extends JsonResource
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
            'name' => $this->name,
            // 'subscription' => $this->subscription,
            // 'number' => $this->number,
            // 'address' => $this->address,
            // 'public_id' => $this->public_id,
            // 'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at
        ];
    }
}
