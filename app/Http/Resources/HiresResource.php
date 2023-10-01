<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class HiresResource extends JsonResource
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
                'start_date' => $this->start_date,
                'return_date' => $this->return_date,
                'returned_date' => $this->returned_date,
                'form_signed' => $this->form_signed,
                'upload_id' => $this->upload_id,
                'notes' => $this->notes,
            ],
            'instrument' => $this->instrument($this->instrument_id),
            'student' => $this->student($this->student_id),
            'timestamps' => [
                'created' => $this->created_at,
                'updated' => $this->updated_at,
                'deleted' => $this->deleted_at
            ]
        ];
    }
}
