<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventsResource extends JsonResource
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
                'name' => $this->name,
                'description' => $this->description,
                'notes' => $this->notes,
                'location' => $this->location,
                'date' => $this->date,
                'time' => $this->time,
                'term' => $this->school_term(),
                'archived' => $this->archived
            ],
            'school' => new SchoolsResource($this->school),
            'users' => EventUsersResource::collection($this->users),
            'jobs' => EventJobResource::collection($this->jobs),
            'timestamps' => [
                'created' => $this->created_at,
                'updated' => $this->updated_at,
                'deleted' => $this->deleted_at,
            ]
        ];
    }
}
