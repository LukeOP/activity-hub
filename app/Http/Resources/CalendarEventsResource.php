<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CalendarEventsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        if ($this->reference_type === 'lesson') $reference_data = $this->lesson($this->reference_type_id);

        return [
            'id' => $this->id,
            'calendar' => [
                'title' => $this->title,
                'user_id' => $this->user_id,
                'allDay' => $this->allDay,
                'className' => $this->className,
                'type' => $this->reference_type,
            ],
            'reference' => [
                'id' => $this->reference_type_id,
                'type' => $this->reference_type,
                'data' => $reference_data
            ]
        ];
    }
}
