<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventTemplateResource extends JsonResource
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
            'heading' => $this->heading,
            'description' => $this->description,
            'notes' => $this->notes,
            'school' => new SchoolsResource($this->school),
            'jobs' => $this->jobs,
            'timestamps' => [
                'created' => $this->created_at,
                'updated' => $this->updated_at,
                'deleted' => $this->deleted_at,
            ]
        ];
    }
}
