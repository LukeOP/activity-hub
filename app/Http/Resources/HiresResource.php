<?php

namespace App\Http\Resources;

use App\Traits\TimestampConversionTrait;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class HiresResource extends JsonResource
{
    use TimestampConversionTrait;

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
            'student' => $this->getStudent($this->student_id),
            'timestamps' => [
                'created' => $this->convertToUserTimezone($this->created_at),
                'updated' => $this->convertToUserTimezone($this->updated_at),
                'deleted' => $this->convertToUserTimezone($this->deleted_at)
            ]
        ];
    }
}
