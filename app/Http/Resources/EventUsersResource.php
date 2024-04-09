<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventUsersResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'event_user_id' => $this->id,
            'id' => $this->user->id,
            'first_name' => $this->user->first_name,
            'last_name' => $this->user->last_name,
            'image' => $this->user->image,
        ];
    }
}
